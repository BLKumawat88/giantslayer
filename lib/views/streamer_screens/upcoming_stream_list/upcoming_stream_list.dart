import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:giantslayer/controller/all_in_controller.dart';
import 'package:giantslayer/theme/common_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../call_sample.dart';

class UpcomingStreamListScreen extends StatefulWidget {
  const UpcomingStreamListScreen({super.key});

  @override
  State<UpcomingStreamListScreen> createState() =>
      _UpcomingStreamListScreenState();
}

final commonTextStyle = GoogleFonts.urbanist(
  fontSize: 14,
  color: Colors.white,
  fontWeight: FontWeight.w500,
);

class _UpcomingStreamListScreenState extends State<UpcomingStreamListScreen> {
  bool rememberPassword = false;
  bool isOnline = false;

  @override
  void initState() {
    super.initState();

    // Live stream work start
    _liveConn();
  }

  Future<void> _liveConn() async {
    await _checkOnline();
    Timer.periodic(Duration(seconds: 5), (timer) async {
      await _checkOnline();
    });
  }

  Future<void> _checkOnline() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        if (!isOnline) {
          isOnline = true;
          // setState(() {});
          print('Online..');
        }
      }
    } on SocketException catch (_) {
      if (isOnline) {
        isOnline = false;
        // setState(() {});
        print('..Offline');
      }
    }
  }

  startStream(id) {
    //Stream Work Start
    print("object  ");

    AllInController provider = Provider.of(context, listen: false);

    Map requiredData = {"status": 1};

    // provider.updateStreamStatus(context, requiredData);

    if (isOnline) {
      print("Yes you are ready to connect");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return CallSampleWidget(
                server:
                    'ec2-35-74-244-232.ap-northeast-1.compute.amazonaws.com/openvidu',
                sessionName: '$id',
                userName: 'FlutterUser${Random().nextInt(1000)}',
                secret: 'giantslayer',
                iceServer: 'stun.l.google.com:19302');
          },
        ),
      );
    } else {
      print("You are in offline mode");
    }

    //Stream work End
  }

  updateStreamButton(streamDate, streamTime, id) {
    final checkDate = DateTime.now();
    print("ACD ${checkDate.year}-${checkDate.month}-${checkDate.day}");
    print(
        "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}");

    final month = "${checkDate.month}".length == 1
        ? "0${checkDate.month}"
        : "${checkDate.month}";
    final day = "${checkDate.day}".length == 1
        ? "0${checkDate.day}"
        : "${checkDate.day}";

    final today = DateTime.now();
    final aheadToCurrentTime10 = today.add(const Duration(minutes: 10));

    print(aheadToCurrentTime10);

    final tHours = "${aheadToCurrentTime10.hour}".length == 1
        ? "0${aheadToCurrentTime10.hour}"
        : "${aheadToCurrentTime10.hour}";
    final tMin = "${aheadToCurrentTime10.minute}".length == 1
        ? "0${aheadToCurrentTime10.minute}"
        : "${aheadToCurrentTime10.minute}";
    final tSec = "00";

    if (streamDate == "${checkDate.year}-$month-$day") {
      print("Yes Date match");
      print("Time : $tHours:$tMin:$tSec");
      final time1 =
          DateTime.parse("${checkDate.year}-$month-$day ${streamTime}");
      final time2 =
          DateTime.parse("${checkDate.year}-$month-$day $tHours:$tMin:$tSec");

      Duration diff = time2.difference(time1);

      print(diff.inMinutes);

      print("Diffrent $diff");

      if (streamTime == "$tHours:$tMin:$tSec") {
        print("10 Min Remaining");
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              startStream(id);
              print("Start stream");
            },
            child: Text("Start Stream"),
          ),
        );
      } else if (diff.inMinutes < 10 &&
          int.parse(diff.inMinutes.toString()) >= 0) {
        print("Bitween 10 Min");
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              startStream(id);
            },
            child: Text("Start Stream"),
          ),
        );
      } else if (time2.isAfter(time1)) {
        print("Agge Ka time");
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              startStream(id);
            },
            child: Text("Start Stream"),
          ),
        );
      } else {
        return SizedBox();
      }
    } else {
      return SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    AllInController provider = Provider.of(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      provider.getUpcomingStreamListData(context);
    });

    return Scaffold(
      backgroundColor: CommonTheme.appBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF1F222A),
        title: Image.asset(
          'assets/images/logo.png',
          width: MediaQuery.of(context).size.width / 3,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Video Library list',
                  style: GoogleFonts.urbanist(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/add_stream');
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: CommonTheme.buttonColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Consumer<AllInController>(
                  builder: ((context, value, child) => Column(
                        children: [
                          ...provider.upcomingStreamListData.map(
                            (e) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 15,
                                ),
                                margin: EdgeInsets.symmetric(vertical: 10),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: CommonTheme.commonContainerColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.network(
                                          "${provider.baseUrl}/${e['trailer_thumbnail_url']}",
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.8,
                                          height: 100,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Container(
                                              color: Colors.amber,
                                              alignment: Alignment.center,
                                              child: const Text(
                                                'Whoops!',
                                                style: TextStyle(fontSize: 30),
                                              ),
                                            );
                                          },
                                        ),
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  e['title'],
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: commonTextStyle,
                                                ),
                                                Text(
                                                  'Views - ${e['user_view']}k',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: commonTextStyle,
                                                ),
                                                // Text(
                                                //   e['plan_title'],
                                                //   maxLines: 1,
                                                //   overflow:
                                                //       TextOverflow.ellipsis,
                                                //   style: commonTextStyle,
                                                // ),
                                                // Text(
                                                //   e['avail_slots'].toString(),
                                                //   maxLines: 1,
                                                //   overflow:
                                                //       TextOverflow.ellipsis,
                                                //   style: commonTextStyle,
                                                // ),
                                                Text(
                                                  e['ppv'].toString(),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: commonTextStyle,
                                                ),
                                                // Text(
                                                //   e['svod'].toString(),
                                                //   maxLines: 1,
                                                //   overflow:
                                                //       TextOverflow.ellipsis,
                                                //   style: commonTextStyle,
                                                // )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Text(
                                          //   'Status',
                                          //   style: commonTextStyle,
                                          // ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 7,
                                              vertical: 1,
                                            ),
                                            decoration: BoxDecoration(
                                              // color: e.color,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text(
                                              e['svod'].toString(),
                                              style: commonTextStyle,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text(e['status'] == 0
                                            ? "pending"
                                            : e['status'] == 1
                                                ? "approved"
                                                : e['status'] == 1
                                                    ? "rejected"
                                                    : ""),
                                      ),
                                    ),
                                    updateStreamButton(
                                        e['date'], e['time'], e['id']),
                                  ],
                                ),
                              );
                            },
                          ).toList(),
                        ],
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
