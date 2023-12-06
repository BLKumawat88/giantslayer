import 'package:flutter/material.dart';
import 'package:giantslayer/theme/common_theme.dart';
import 'package:giantslayer/views/place_add_screens/analytics_screen/analytics_screen.dart';
import 'package:giantslayer/views/place_add_screens/blast_screen/blast_screen.dart';
import 'package:giantslayer/views/place_add_screens/place_add_screen/place_add_screen.dart';
import 'package:giantslayer/views/place_add_screens/profile_screen/profile_screen.dart';
import 'package:giantslayer/views/place_add_screens/track_screen/track_screen.dart';

class PlaceAddScreensBottomNavigation extends StatefulWidget {
  const PlaceAddScreensBottomNavigation({super.key});

  @override
  State<PlaceAddScreensBottomNavigation> createState() =>
      _PlaceAddScreensBottomNavigationState();
}

class _PlaceAddScreensBottomNavigationState
    extends State<PlaceAddScreensBottomNavigation> {
  int selectedIndex = 0;
  List screens = [
    AnalyticsScreen(),
    PlaceAddScreen(),
    BlastScreen(),
    TrackScreen(),
    PlaceAdProfileScreen(),
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
              label: 'Analytics',
              icon: ImageIcon(
                AssetImage('assets/images/analytics.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Place Ad',
              icon: ImageIcon(
                AssetImage('assets/images/place_ad.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Blast',
              icon: ImageIcon(
                AssetImage('assets/images/blast.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Track',
              icon: ImageIcon(
                AssetImage('assets/images/track.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: ImageIcon(
                AssetImage('assets/images/profile.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
