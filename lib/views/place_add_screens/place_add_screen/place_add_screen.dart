import 'package:flutter/material.dart';
import 'package:giantslayer/model/place_ad_screen_model.dart';
import 'package:giantslayer/theme/common_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaceAddScreen extends StatefulWidget {
  const PlaceAddScreen({super.key});

  @override
  State<PlaceAddScreen> createState() => _PlaceAddScreenState();
}

class _PlaceAddScreenState extends State<PlaceAddScreen> {
  final subtitles = GoogleFonts.inter(
    fontSize: 12,
    color: Color(0xFFCECECE),
    fontWeight: FontWeight.w500,
  );

  final title = GoogleFonts.inter(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );
  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'List of Played Ads/New ads',
                  style: GoogleFonts.urbanist(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  height: 30,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CommonTheme.buttonColor,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Add place Ads',
                      style: GoogleFonts.urbanist(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
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
                child: Column(
                  children: [
                    ...placeAdScreen.map(
                      (e) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Color(0xFF1F222A),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    e.image,
                                    width:
                                        MediaQuery.of(context).size.width / 3.5,
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            e.title,
                                            style: title,
                                          ),
                                          Text(
                                            'Viewed : ${e.viewed}',
                                            style: subtitles,
                                          ),
                                          Text(
                                            'Impressions : ${e.impressions}',
                                            style: subtitles,
                                          ),
                                          Text(
                                            'Thumpsup : ${e.thumpsup}',
                                            style: subtitles,
                                          ),
                                          Text(
                                            'Clicks : ${e.clicks}',
                                            style: subtitles,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Survey : ${e.survey}',
                                                style: subtitles,
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 2,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: e.color,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Text(
                                                  e.status,
                                                  style: GoogleFonts.inter(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      PopupMenuButton(
                                        icon: Icon(
                                          Icons.more_vert_rounded,
                                          color: Colors.white,
                                        ),
                                        itemBuilder: (context) {
                                          return <PopupMenuEntry>[
                                            PopupMenuItem(
                                              value: 'Delete',
                                              child: Text(
                                                'Delete',
                                              ),
                                            ),
                                          ];
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(
                                color: Color(0xFF34363A),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/images/place_add.png',
                                    width:
                                        MediaQuery.of(context).size.width / 3.5,
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            e.title,
                                            style: title,
                                          ),
                                          Text(
                                            'Viewed : ${e.viewed}',
                                            style: subtitles,
                                          ),
                                          Text(
                                            'Impressions : ${e.impressions}',
                                            style: subtitles,
                                          ),
                                          Text(
                                            'Thumpsup : ${e.thumpsup}',
                                            style: subtitles,
                                          ),
                                          Text(
                                            'Clicks : ${e.clicks}',
                                            style: subtitles,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Survey : ${e.survey}',
                                                style: subtitles,
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 2,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: e.color,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Text(
                                                  e.status,
                                                  style: GoogleFonts.inter(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      PopupMenuButton(
                                        icon: Icon(
                                          Icons.more_vert_rounded,
                                          color: Colors.white,
                                        ),
                                        itemBuilder: (context) {
                                          return <PopupMenuEntry>[
                                            PopupMenuItem(
                                              value: 'Delete',
                                              child: Text(
                                                'Delete',
                                              ),
                                            ),
                                          ];
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ).toList(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
