import 'package:flutter/material.dart';
import 'package:giantslayer/theme/common_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class StreamListOfPlayedAds extends StatefulWidget {
  const StreamListOfPlayedAds({super.key});

  @override
  State<StreamListOfPlayedAds> createState() => _StreamListOfPlayedAdsState();
}

class _StreamListOfPlayedAdsState extends State<StreamListOfPlayedAds> {
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
  void playAd() {}
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
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
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: CommonTheme.buttonColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Add place Ads',
                      style: GoogleFonts.urbanist(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
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
                                'assets/images/place_add.png',
                                width: MediaQuery.of(context).size.width / 3.5,
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
                                        'Lost in Space',
                                        style: title,
                                      ),
                                      Text(
                                        'Date : 19/09/2022',
                                        style: subtitles,
                                      ),
                                      Text(
                                        'Time : 8:56 PM',
                                        style: subtitles,
                                      ),
                                      Text(
                                        'Plan Choosen : PPV',
                                        style: subtitles,
                                      ),
                                      Text(
                                        'Clicks : 2',
                                        style: subtitles,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Survey : 2',
                                            style: subtitles,
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFFB91D),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text(
                                              'Paid',
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
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'assets/images/movie_image.png',
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2.5,
                          height: 55,
                          decoration: BoxDecoration(
                            color: Color(0xFF35383F),
                            borderRadius: BorderRadius.circular(
                              100,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Start Stream',
                              style: CommonTheme.commonAuthButtonText,
                            ),
                          ),
                        ),
                        Card(
                          elevation: 6,
                          shadowColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              100,
                            ),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            height: 55,
                            decoration: BoxDecoration(
                              color: CommonTheme.buttonColor,
                              borderRadius: BorderRadius.circular(
                                100,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Play Ad',
                                style: CommonTheme.commonAuthButtonText,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
