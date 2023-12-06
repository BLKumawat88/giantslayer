import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:giantslayer/controller/all_in_controller.dart';
import 'package:giantslayer/model/live_events_model.dart';
import 'package:giantslayer/model/network_tv_model.dart';
import 'package:giantslayer/model/nightlife_model.dart';
import 'package:giantslayer/model/tvshows_model.dart';
import 'package:giantslayer/model/upcoming_live_events.dart';
import 'package:giantslayer/theme/common_theme.dart';
import 'package:giantslayer/views/side_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<String> imageList = [
  'assets/images/slider.png',
  'assets/images/slider.png',
  'assets/images/slider.png',
];

class _HomeScreenState extends State<HomeScreen> {
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  final List<Widget> imageSliders = imageList
      .map(
        (item) => SizedBox(
          child: Stack(
            children: <Widget>[
              Image.asset(
                item,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ],
          ),
        ),
      )
      .toList();

  final title = GoogleFonts.inter(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  final more = GoogleFonts.inter(
    color: CommonTheme.buttonColor,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    AllInController provider = Provider.of(context, listen: false);
    return Scaffold(
      drawer: SideDrawer(),
      backgroundColor: CommonTheme.appBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF212121),
        title: Image.asset(
          'assets/images/logo.png',
          width: MediaQuery.of(context).size.width / 3,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ),
          ),
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

          Container(
            width: double.infinity,
            height: 200,
            child: Image.network(
              "${provider.homePageTopBannerValue['media_base_url']}/${provider.homePageTopBannerValue['bannerData']['main_image']}",
              fit: BoxFit.cover,
            ),
          ),

          // Container(
          //   width: double.infinity,
          //   child: Stack(
          //     children: [
          //       CarouselSlider(
          //         items: imageSliders,
          //         carouselController: carouselController,
          //         options: CarouselOptions(
          //           scrollPhysics: const BouncingScrollPhysics(),
          //           autoPlay: true,
          //           aspectRatio: 1.5,
          //           viewportFraction: 1,
          //           onPageChanged: (index, reason) {
          //             setState(() {
          //               currentIndex = index;
          //             });
          //           },
          //         ),
          //       ),
          //       Positioned(
          //         bottom: 15,
          //         left: 0,
          //         right: 0,
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: imageList.asMap().entries.map((entry) {
          //             return GestureDetector(
          //               onTap: () =>
          //                   carouselController.animateToPage(entry.key),
          //               child: Container(
          //                 width: 8.0,
          //                 height: 8.0,
          //                 margin: const EdgeInsets.symmetric(
          //                   horizontal: 6.0,
          //                 ),
          //                 decoration: BoxDecoration(
          //                   shape: BoxShape.circle,
          //                   // color: currentIndex == entry.key
          //                   //     ? CommonTheme.buttonColor
          //                   //     : CommonTheme.buttonColor,
          //                   color: CommonTheme.buttonColor,
          //                 ),
          //               ),
          //             );
          //           }).toList(),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Movie',
                          style: title,
                        ),
                        Text(
                          'More',
                          style: more,
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 20,
                        right: 5,
                      ),
                      child: Row(
                        children: [
                          ...provider.homeScreenData.map(
                            (e) {
                              return e['item_type'] == "movie"
                                  ? Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: InkWell(
                                        onTap: () {
                                          provider.viewerVideoDetails(
                                              context, e['id']);
                                        },
                                        child: Stack(
                                          children: [
                                            Image.network(
                                              "${provider.baseUrl}/${e['trailer_thumbnail_url']}",
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.8,
                                            ),
                                            Positioned(
                                              top: 5,
                                              right: 5,
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 3,
                                                ),
                                                decoration: BoxDecoration(
                                                  color:
                                                      CommonTheme.buttonColor,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Text(
                                                  'Free',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : SizedBox();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tv Shows',
                          style: title,
                        ),
                        Text(
                          'More',
                          style: more,
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 20,
                        right: 5,
                      ),
                      child: Row(
                        children: [
                          ...provider.homeScreenData.map(
                            (e) {
                              return e['item_type'] == "tv_show"
                                  ? Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: InkWell(
                                        onTap: () {
                                          provider.viewerVideoDetails(
                                              context, e['id']);
                                        },
                                        child: Stack(
                                          children: [
                                            Image.network(
                                              "${provider.baseUrl}/${e['trailer_thumbnail_url']}",
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.8,
                                            ),
                                            Positioned(
                                              top: 5,
                                              right: 5,
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 3,
                                                ),
                                                decoration: BoxDecoration(
                                                  color:
                                                      CommonTheme.buttonColor,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Text(
                                                  'Free',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : SizedBox();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 30,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         'Live Events',
                  //         style: title,
                  //       ),
                  //       Text(
                  //         'More',
                  //         style: more,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   physics: BouncingScrollPhysics(),
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(
                  //       top: 10,
                  //       left: 20,
                  //       right: 5,
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         ...liveEventsModel.map(
                  //           (e) {
                  //             return Padding(
                  //               padding: const EdgeInsets.only(right: 15),
                  //               child: Stack(
                  //                 children: [
                  //                   Image.asset(
                  //                     e.image,
                  //                     width: MediaQuery.of(context).size.width /
                  //                         2.8,
                  //                   ),
                  //                   Positioned(
                  //                     top: 5,
                  //                     right: 5,
                  //                     child: Container(
                  //                       padding: EdgeInsets.symmetric(
                  //                         horizontal: 3,
                  //                       ),
                  //                       decoration: BoxDecoration(
                  //                         color: CommonTheme.buttonColor,
                  //                         borderRadius:
                  //                             BorderRadius.circular(10),
                  //                       ),
                  //                       child: Text(
                  //                         'Free',
                  //                         style: TextStyle(
                  //                           color: Colors.black,
                  //                           fontSize: 10,
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             );
                  //           },
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 30,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         'Upcoming Live Events',
                  //         style: title,
                  //       ),
                  //       Text(
                  //         'More',
                  //         style: more,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   physics: BouncingScrollPhysics(),
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(
                  //       top: 10,
                  //       left: 20,
                  //       right: 5,
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         ...upcomingLiveEventsModel.map(
                  //           (e) {
                  //             return Padding(
                  //               padding: const EdgeInsets.only(right: 15),
                  //               child: Stack(
                  //                 children: [
                  //                   Image.asset(
                  //                     e.image,
                  //                     width: MediaQuery.of(context).size.width /
                  //                         2.8,
                  //                   ),
                  //                   Positioned(
                  //                     top: 5,
                  //                     right: 5,
                  //                     child: Container(
                  //                       padding: EdgeInsets.symmetric(
                  //                         horizontal: 3,
                  //                       ),
                  //                       decoration: BoxDecoration(
                  //                         color: CommonTheme.buttonColor,
                  //                         borderRadius:
                  //                             BorderRadius.circular(10),
                  //                       ),
                  //                       child: Text(
                  //                         'Free',
                  //                         style: TextStyle(
                  //                           color: Colors.black,
                  //                           fontSize: 10,
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             );
                  //           },
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Network TV',
                          style: title,
                        ),
                        Text(
                          'More',
                          style: more,
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 20,
                        right: 5,
                      ),
                      child: Row(
                        children: [
                          ...provider.homeScreenData.map(
                            (e) {
                              return e['item_type'] == "network_tv"
                                  ? Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: InkWell(
                                        onTap: () {
                                          provider.viewerVideoDetails(
                                              context, e['id']);
                                        },
                                        child: Stack(
                                          children: [
                                            Image.network(
                                              "${provider.baseUrl}/${e['trailer_thumbnail_url']}",
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.8,
                                            ),
                                            Positioned(
                                              top: 5,
                                              right: 5,
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 3,
                                                ),
                                                decoration: BoxDecoration(
                                                  color:
                                                      CommonTheme.buttonColor,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Text(
                                                  'Free',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : SizedBox();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 30,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         'Nightlife',
                  //         style: title,
                  //       ),
                  //       Text(
                  //         'More',
                  //         style: more,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   physics: BouncingScrollPhysics(),
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(
                  //       top: 10,
                  //       left: 20,
                  //       right: 5,
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         ...nightlifeModel.map(
                  //           (e) {
                  //             return Padding(
                  //               padding: const EdgeInsets.only(right: 15),
                  //               child: Stack(
                  //                 children: [
                  //                   Image.asset(
                  //                     e.image,
                  //                     width: MediaQuery.of(context).size.width /
                  //                         2.8,
                  //                   ),
                  //                   Positioned(
                  //                     top: 5,
                  //                     right: 5,
                  //                     child: Container(
                  //                       padding: EdgeInsets.symmetric(
                  //                         horizontal: 3,
                  //                       ),
                  //                       decoration: BoxDecoration(
                  //                         color: CommonTheme.buttonColor,
                  //                         borderRadius:
                  //                             BorderRadius.circular(10),
                  //                       ),
                  //                       child: Text(
                  //                         'Free',
                  //                         style: GoogleFonts.inter(
                  //                           color: Colors.black,
                  //                           fontSize: 10,
                  //                           fontWeight: FontWeight.w500,
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             );
                  //           },
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 30,
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
