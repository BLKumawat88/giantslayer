import 'package:flutter/material.dart';
import 'package:giantslayer/theme/common_theme.dart';
import 'package:giantslayer/views/home_screen/home_screen.dart';
import 'package:giantslayer/views/profile_screen/profile_screen.dart';
import 'package:giantslayer/views/search_screen/search_screen.dart';
import 'package:giantslayer/views/tv_shows_screen/tv_shows_screen.dart';

class MyBottomNavigation extends StatefulWidget {
  const MyBottomNavigation({super.key});

  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  int selectedIndex = 0;
  List screens = [
    HomeScreen(),
    SearchScreen(),
    TvShowsScreen(),
    ProfileScreen(),
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
              label: 'Home',
              icon: ImageIcon(
                AssetImage('assets/images/home.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Search',
              icon: ImageIcon(
                AssetImage('assets/images/search.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Tv Shows',
              icon: ImageIcon(
                AssetImage('assets/images/broadcast.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: ImageIcon(
                AssetImage('assets/images/account.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
