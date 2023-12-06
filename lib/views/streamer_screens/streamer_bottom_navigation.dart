import 'package:flutter/material.dart';
import 'package:giantslayer/theme/common_theme.dart';
import 'package:giantslayer/views/streamer_screens/profile_screen/profile_screen.dart';
import 'package:giantslayer/views/streamer_screens/upcoming_stream_list/upcoming_stream_list.dart';
import 'package:giantslayer/views/streamer_screens/upload_screen/upload_screen.dart';
import 'package:giantslayer/views/streamer_screens/video_list_screen/video_list_screen.dart';

class StreamerBottomNavigation extends StatefulWidget {
  const StreamerBottomNavigation({super.key});

  @override
  State<StreamerBottomNavigation> createState() =>
      _StreamerBottomNavigationState();
}

class _StreamerBottomNavigationState extends State<StreamerBottomNavigation> {
  int selectedIndex = 0;
  List screens = [
    UploadScreen(),
    VideoListScreen(),
    // StreamScreen(),
    UpcomingStreamListScreen(),
    StreamerProfileScreen(),
  ];
  void updateScreens(int index) {
    print('index $index');
    print('selected index $selectedIndex');
    // if (index == 3) {
    //   Navigator.pushNamed(context, '/profile_screen');
    // }
    // else if (index == 1) {
    //   Navigator.pushNamed(context, '/search_screen');
    // }

    setState(() {
      selectedIndex = index;
      print('object $index');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonTheme.appBackgroundColor,
      body: screens[selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xFF212121),
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: updateScreens,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: CommonTheme.buttonColor,
          unselectedItemColor: Colors.white,
          elevation: 0,
          backgroundColor: Colors.transparent,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: 'Upload',
              icon: ImageIcon(
                AssetImage('assets/images/supload.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Video List',
              icon: ImageIcon(
                AssetImage('assets/images/svideolist.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Stream',
              icon: ImageIcon(
                AssetImage('assets/images/stream.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: ImageIcon(
                AssetImage('assets/images/sprofile.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
