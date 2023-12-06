import 'package:flutter/material.dart';
import 'package:giantslayer/model/streamer_approved_list_model.dart';
import 'package:giantslayer/model/streamer_paid_list_model.dart';
import 'package:giantslayer/model/streamer_unapproved_list_model.dart';
import 'package:giantslayer/theme/common_button.dart';
import 'package:giantslayer/theme/common_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class AskForApprovalStream extends StatefulWidget {
  const AskForApprovalStream({super.key});

  @override
  State<AskForApprovalStream> createState() => _AskForApprovalStreamState();
}

class _AskForApprovalStreamState extends State<AskForApprovalStream> {
  final textStyle = GoogleFonts.urbanist(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  void payNowForPaidList() {}
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        backgroundColor: CommonTheme.appBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFF1F222A),
          title: Text('Stream'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
              ),
            ),
          ],
          bottom: TabBar(
            indicatorColor: CommonTheme.buttonColor,
            isScrollable: true,
            tabs: [
              Tab(
                text: 'Approved List',
              ),
              Tab(
                text: 'Unapproved List',
              ),
              Tab(
                text: 'Paid List',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          ...streamerApprovedList.map(
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          e.image,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.8,
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
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  e.videoName,
                                                  style: textStyle,
                                                ),
                                                Text(
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  'Date - ${e.date}',
                                                  style: textStyle,
                                                ),
                                                Text(
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  'Time - ${e.time}',
                                                  style: textStyle,
                                                ),
                                                Text(
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  e.planChoosen,
                                                  style: textStyle,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          '/stream_list_of_played_ads_new_ads',
                                        );
                                      },
                                      child: Container(
                                        width: 100,
                                        padding: EdgeInsets.symmetric(
                                          // horizontal: 12,
                                          vertical: 1,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(0xFF166534),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          'Play Now',
                                          style: textStyle,
                                        ),
                                      ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CommonButton(
                        color: CommonTheme.buttonColor,
                        text: 'Pay Now And Share',
                        type: 'common',
                        textColor: Colors.white,
                        methodName: payNowForPaidList,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          ...streamerUnapprovedList.map(
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          'assets/images/place_add.png',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.8,
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
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  'Lost in Space',
                                                  style: textStyle,
                                                ),
                                                Text(
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  'Date -',
                                                  style: textStyle,
                                                ),
                                                Text(
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  'Time -',
                                                  style: textStyle,
                                                ),
                                                Text(
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  'Plan Chossen',
                                                  style: textStyle,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 100,
                                      padding: EdgeInsets.symmetric(
                                        // horizontal: 12,
                                        vertical: 1,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFF0000),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        'Unapproved',
                                        style: textStyle,
                                      ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CommonButton(
                        color: CommonTheme.buttonColor,
                        text: 'Pay Now And Share',
                        type: 'common',
                        textColor: Colors.white,
                        methodName: payNowForPaidList,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          ...streamerPaidList.map(
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          'assets/images/place_add.png',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.8,
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
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  'Lost in Space',
                                                  style: textStyle,
                                                ),
                                                Text(
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  'Date -',
                                                  style: textStyle,
                                                ),
                                                Text(
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  'Time -',
                                                  style: textStyle,
                                                ),
                                                Text(
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  'Plan Chossen',
                                                  style: textStyle,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 100,
                                      padding: EdgeInsets.symmetric(
                                        // horizontal: 12,
                                        vertical: 1,
                                      ),
                                      decoration: BoxDecoration(
                                        color: CommonTheme.buttonColor,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        'Paid',
                                        style: textStyle,
                                      ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CommonButton(
                        color: CommonTheme.buttonColor,
                        text: 'Pay Now And Share',
                        type: 'common',
                        textColor: Colors.white,
                        methodName: payNowForPaidList,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
