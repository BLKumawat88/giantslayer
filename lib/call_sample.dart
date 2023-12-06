import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:giantslayer/utils/signaling.dart';

class CallSampleWidget extends StatefulWidget {
  CallSampleWidget(
      {super.key,
      required this.server,
      this.sessionName,
      this.userName,
      this.secret,
      this.iceServer});

  final String server;
  final String? sessionName;
  final String? userName;
  final String? secret;
  final String? iceServer;

  @override
  _CallSampleWidgetState createState() => _CallSampleWidgetState();
}

class _CallSampleWidgetState extends State<CallSampleWidget> {
  final _localRenderer = new RTCVideoRenderer();
  final _remoteRenderer = new RTCVideoRenderer();
  Signaling? _signaling;

  @override
  void initState() {
    super.initState();
    initRenderers();
  }

  @override
  void dispose() {
    _signaling?.close();
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    super.dispose();
    print('◤◢◤◢◤◢◤◢◤◢◤ dispose() ALL ◤◢◤◢◤◢◤◢◤◢◤');
  }

  Future<void> initRenderers() async {
    await _localRenderer.initialize();
    await _remoteRenderer.initialize();
    _connect();
  }

  Future<void> _connect() async {
    if (_signaling == null) {
      print("_connect _signaling connection  $_signaling");
      //_Init Signaling

      print("widget.iceServer ${widget.iceServer} ");

      _signaling = Signaling(
          widget.server, widget.secret!, widget.userName!, widget.iceServer!);

      print("After sending _signaling request $_signaling ");

      //_Create session
      final String sessionId =
          await _signaling!.createWebRtcSession(sessionId: widget.sessionName!);

      print('◤◢◤◢◤◢◤◢◤◢◤ sessionId123: $sessionId  ◤◢◤◢◤◢◤◢◤◢◤ ');

      //_Create_token
      final String token =
          await _signaling!.createWebRtcToken(sessionId: sessionId);
      print('◤◢◤◢◤◢◤◢◤◢◤ token: $token  ◤◢◤◢◤◢◤◢◤◢◤ ');

      //_Connect_socket //ADDED AWAIT
      await _signaling!.connect();

      _signaling!.onStateChange = (SignalingState state) {
        print('_signaling.onStateChange: $state');
        switch (state) {
          case SignalingState.CallStateNew:
            break;
          case SignalingState.CallStateBye:
            break;
          default:
            break;
        }
      };

      _signaling!.onLocalStream = ((stream) {
        print('onLocalStream: ${stream.id}');
        _localRenderer.srcObject = stream;
        setState(() {});
      });

      _signaling!.onAddRemoteStream = ((stream) {
        print('onAddRemoteStream: ${stream.id}');
        _remoteRenderer.srcObject = stream;
        // setState(() {
        //   print("IN SET STATE");
        // });
      });

      _signaling!.onRemoveRemoteStream = ((stream) {
        print('onRemoveRemoteStream');
        _remoteRenderer.srcObject = null;
      });

      setState(() {
        print("Set State");
      });
    }
  }

  void _hangUp() {
    print("STREAM END");
    if (_signaling != null) {
      Navigator.of(context).pop();
    }
  }

  void _switchCamera() {
    _signaling?.switchCamera();
  }

  void _muteMic() {
    print("_muteMic Mic");
    _signaling?.muteMic();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        return Container(
          child: Stack(children: <Widget>[
            Positioned(
                left: 0.0,
                right: 0.0,
                top: 0.0,
                bottom: 0.0,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: RTCVideoView(_remoteRenderer),
                  decoration: BoxDecoration(color: Colors.black54),
                )),
            Positioned(
              left: 0.0,
              top: 0.0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: RTCVideoView(_localRenderer),
                // decoration: BoxDecoration(color: Colors.red),
              ),
            ),
          ]),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
          width: 200.0,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FloatingActionButton(
                  child: Icon(Icons.switch_camera),
                  onPressed: _switchCamera,
                  heroTag: "btn_switchCamera",
                ),
                FloatingActionButton(
                  onPressed: _hangUp,
                  heroTag: "btn_hangUp",
                  tooltip: 'Hangup',
                  child: Icon(Icons.call_end),
                  backgroundColor: Colors.pink,
                ),
                FloatingActionButton(
                  child: Icon(Icons.mic_off),
                  onPressed: _muteMic,
                  heroTag: "btn_muteMic",
                )
              ])),
    );
  }
}
