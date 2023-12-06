import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List pages = [
    {
      "image": 'assets/images/onboarding.png',
      "title": 'Welcome to Giant Slayer',
      "description":
          'The best movie streaming app of the century to make your days great!',
    },
    {
      "image": 'assets/images/onboarding.png',
      "title": 'Welcome to Giant Slayer',
      "description":
          'The best movie streaming app of the century to make your days great!',
    },
    {
      "image": 'assets/images/onboarding.png',
      "title": 'Welcome to Giant Slayer',
      "description":
          'The best movie streaming app of the century to make your days great!',
    },
  ];

  int currentPage = 0;
  PageController pageController = PageController();

  onChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  void continueMethod() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            itemCount: pages.length,
            onPageChanged: onChanged,
            itemBuilder: (context, index) {
              return Image.asset(
                pages[index]['image'],
                fit: BoxFit.cover,
              );
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Welcome to Giant Slayer',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                textAlign: TextAlign.center,
                'The best movie streaming app of the century to make your days great!',
                style: TextStyle(color: Colors.white),
              ),
              // (currentPage == pages.length)
              //     ? Container(
              //         margin: const EdgeInsets.only(
              //           bottom: 60,
              //         ),
              //         padding: const EdgeInsets.symmetric(
              //           horizontal: 20,
              //         ),
              //         child: Center(
              //           child: CommonButton(
              //             methodName: continueMethod,
              //             color: CommonTheme.buttonColor,
              //             text: 'Get Started',
              //             type: 'common',
              //             textColor: Colors.white,
              //           ),
              //         ),
              //       )
              //     : Row(
              //         children: [
              //           Expanded(
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children:
              // List<Widget>.generate(
              //                 pages.length,
              //                 (index) {
              //                   return AnimatedContainer(
              //                     duration: const Duration(
              //                       milliseconds: 200,
              //                     ),
              //                     height: 10,
              //                     width: (index == currentPage) ? 32 : 10,
              //                     margin: const EdgeInsets.symmetric(
              //                       horizontal: 5,
              //                       vertical: 100,
              //                     ),
              //                     decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(5),
              //                       gradient: (index == currentPage)
              //                           ? LinearGradient(
              //                               colors: [
              //                                 Colors.black,
              //                                 CommonTheme.buttonColor,
              //                               ],
              //                             )
              //                           : LinearGradient(
              //                               colors: [
              //                                 Colors.white,
              //                                 Colors.white,
              //                               ],
              //                             ),
              //                     ),
              //                   );
              //                 },
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
            ],
          )
        ],
      ),
    );
  }
}
