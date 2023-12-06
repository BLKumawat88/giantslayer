import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import '../dialog_loading/common_dialog.dart';
import '../services/services.dart';

class AllInController with ChangeNotifier {
  Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    "Authorization": ""
  };

  // String baseUrl = "http://192.168.29.172/giant-slayer/backend";
  String baseUrl = "http://giant-slayer.itworkshop.in/backend";

  Map userProfileData = {
    "name": "nikhil",
    "mobile": "1234567800",
    "user_type": 1,
    "role": "user",
    "country": "user",
    "state": "user",
    "total_earnings": "2323",
    "location": "user",
    "latitude": "user",
    "longitude": "user",
    "city": "user",
    "address": "user",
    "zip": "user",
  };

  String otp = "";

  Map signUpData = {};

  Future<void> signupUserDataToSendOTP(context, requiredData) async {
    signUpData.addAll(requiredData);
    print("Saved Data of signUP $signUpData");

    CommanDialog.showLoading(context, title: "Please Wait...");
    try {
      final response =
          await APICall().postRequest('/signup', headers, requiredData);
      CommanDialog.hideLoading(context);
      if (response['status'] == 200) {
        Codec<String, String> stringToBase64 = utf8.fuse(base64);
        otp = stringToBase64.decode(response['data']['otp'].toString());

        Navigator.pushNamed(context, '/pin_screen');
        print("OTP $otp");
      }
      if (response['status'] == 400) {
        print("400 ");
        CommanDialog.showErrorDialog(context, description: response['message']);
      }
    } catch (error) {
      CommanDialog.hideLoading(context);
      CommanDialog.showErrorDialog(context, description: error.toString());
    }
  }

  Future<void> registerUserAfterOTPVerify(context) async {
    signUpData['verify_status'] = true;
    print("Saved Data of signUP $signUpData");
    CommanDialog.showLoading(context, title: "Please Wait...");
    try {
      final response =
          await APICall().postRequest('/signup', headers, signUpData);
      CommanDialog.hideLoading(context);
      if (response['status'] == 200) {
        Navigator.pushNamed(context, '/login_screen');
      }
      if (response['status'] == 400) {
        print("400 ");
        CommanDialog.showErrorDialog(context, description: response['message']);
      }
    } catch (error) {
      CommanDialog.showErrorDialog(context, description: error.toString());
    }
  }

  String accessToken = "";
  int? user_id;
  Future<void> userLogin(context, requiredData) async {
    CommanDialog.showLoading(context, title: "Please Wait...");
    try {
      final response =
          await APICall().postRequest('/login', headers, requiredData);
      CommanDialog.hideLoading(context);
      if (response['status'] == 200) {
        accessToken = response['access_token'];
        headers['Authorization'] = "Bearer$accessToken";

        print("Heaser ${headers['Authorization']}");
        user_id = response['user']['id'];
        print("User token $accessToken,   $user_id");
        getBannerImageOfHomePage(context);
      }
      if (response['status'] == 400) {
        print("400 ");
        CommanDialog.showErrorDialog(context, description: response['message']);
      }
    } catch (error) {
      CommanDialog.showErrorDialog(context, description: error.toString());
    }
  }

  Map homePageTopBannerValue = {};
  Future<void> getBannerImageOfHomePage(context) async {
    CommanDialog.showLoading(context, title: "Please Wait...");
    try {
      final response = await APICall().getRequest('/banner_list', headers);
      CommanDialog.hideLoading(context);
      if (response['status'] == 200) {
        homePageTopBannerValue.addAll(response['data'][0]);
        getHomeScreenData(context);
      }
      if (response['status'] == 400) {
        print("400 ");
        CommanDialog.showErrorDialog(context, description: response['message']);
      }
    } catch (error) {
      CommanDialog.showErrorDialog(context, description: error.toString());
    }
  }

  List faqList = [];
  Future<void> getFaqList(context) async {
    faqList.clear();
    CommanDialog.showLoading(context, title: "Please Wait...");
    try {
      final response = await APICall().getRequest('/faqList', headers);

      print("response $response");

      CommanDialog.hideLoading(context);
      if (response['status'] == 200) {
        faqList.addAll(response['data']);
        Navigator.pushNamed(context, '/faq_screen');
      }
      if (response['status'] == 400) {
        print("400 ");
        CommanDialog.showErrorDialog(context, description: response['message']);
      }
    } catch (error) {
      CommanDialog.showErrorDialog(context, description: error.toString());
    }
  }

  List planList = [];
  Future<void> getSubscribePlan(context) async {
    planList.clear();
    CommanDialog.showLoading(context, title: "Please Wait...");
    try {
      final response =
          await APICall().getRequest('/plan_list/subscription', headers);

      print("response $response");

      CommanDialog.hideLoading(context);
      if (response['status'] == 200) {
        planList.addAll(response['data']);
        Navigator.pushNamed(context, '/payment_plan_screen');
      }
      if (response['status'] == 400) {
        print("400 ");
        CommanDialog.showErrorDialog(context, description: response['message']);
      }
    } catch (error) {
      CommanDialog.showErrorDialog(context, description: error.toString());
    }
  }

  List homeScreenData = [];
  Future<void> getHomeScreenData(context) async {
    homeScreenData.clear();
    CommanDialog.showLoading(context, title: "Please Wait...");

    try {
      final response =
          await APICall().getRequest('/viewer/video_library', headers);

      CommanDialog.hideLoading(context);
      if (response['status'] == 200) {
        homeScreenData.addAll(response['data']);
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/bottom_navigation_screen', (Route<dynamic> route) => false);
      }
      if (response['status'] == 400) {
        print("400 ");
        CommanDialog.showErrorDialog(context, description: response['message']);
      }
    } catch (error) {
      CommanDialog.showErrorDialog(context, description: error.toString());
    }
  }

  Future<void> viewerVideoDetails(context, id) async {
    CommanDialog.showLoading(context, title: "Please Wait...");
    try {
      final response =
          await APICall().getRequest('/viewer/video_details/$id', headers);
      CommanDialog.hideLoading(context);
      if (response['status'] == 200) {
        log("Response123 $response");

        if (response['data']['plan_type'] == "ppv") {
          if (response['data']['access']) {
            // video play
            print("Play The Video");
          } else {
            // ppv modal open
            print("open the ppv model");
            ppvModel(context, response['data']['trailer_thumbnail_url']);
          }
        } else if (response['data']['plan_type'] == "svod") {
          if (response['data']['access']) {
            // video play
            print("Play The Video");
          } else {
            // plan screen
            print("Open the plan screen");
            getSubscribePlan(context);
          }
        } else if (response['data']['plan_type'] == "avod") {
          print("type avod");
          // avod modal show
          // Navigator.pushNamed(context, '/show_poppup_and_play');
          aVODMOdel(context);
        }
      }
      if (response['status'] == 400) {
        print("400 ");
        CommanDialog.showErrorDialog(context, description: response['message']);
      }
    } catch (error) {
      CommanDialog.showErrorDialog(context, description: error.toString());
    }
  }

  aVODMOdel(context) async {
    await showDialog(
        context: context,
        builder: (_) => Dialog(
              child: Container(
                // width: MediaQuery.of(context).size.width / 3,
                width: 330,
                height: 350,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.cancel),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "You have not any active plan. Buy plan and Enjoy without ads",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Image.network(
                      "http://192.168.29.172/giant-slayer/backend/public/uploads/streamers/video/45/16691949821312.png",
                      height: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFFFB91D)),
                            onPressed: () {
                              Navigator.pop(context);
                              getSubscribePlan(context);
                            },
                            child: Text('Without Ads'),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFFFB91D)),
                            onPressed: () {},
                            child: Text('With Ads'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }

  ppvModel(context, link) async {
    await showDialog(
        context: context,
        builder: (_) => Dialog(
              child: Container(
                // width: MediaQuery.of(context).size.width / 3,
                width: 330,
                height: 350,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.cancel),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "PPV (Pay Per View)",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Image.network(
                      "$baseUrl/$link",
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Test Plan',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            '\$10 For One Time View',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFFB91D)),
                          onPressed: () {},
                          child: Text('Processed to pay'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }

//Streamer Section START
  List streamerVideoList = [];
  Future<void> getStreamerVideoList(context) async {
    streamerVideoList.clear();
    CommanDialog.showLoading(context, title: "Please Wait...");
    try {
      final response = await APICall().getRequest('/video_library', headers);
      print("response $response");
      CommanDialog.hideLoading(context);
      if (response['status'] == 200) {
        streamerVideoList.addAll(response['data']);
        notifyListeners();

        // Navigator.pushNamed(context, '/payment_plan_screen');
      }
      if (response['status'] == 400) {
        print("400 ");
        CommanDialog.showErrorDialog(context, description: response['message']);
      }
    } catch (error) {
      CommanDialog.showErrorDialog(context, description: error.toString());
    }
  }

  List upcomingStreamListData = [];
  Future<void> getUpcomingStreamListData(context) async {
    upcomingStreamListData.clear();
    CommanDialog.showLoading(context, title: "Please Wait...");
    try {
      final response = await APICall().getRequest('/stream_library', headers);
      print("response $response");
      CommanDialog.hideLoading(context);
      if (response['status'] == 200) {
        upcomingStreamListData.clear();
        upcomingStreamListData.addAll(response['data']);
        log("Upcominmg stream data $upcomingStreamListData");
        notifyListeners();
      }
      if (response['status'] == 400) {
        print("400 ");
        CommanDialog.showErrorDialog(context, description: response['message']);
      }
    } catch (error) {
      CommanDialog.showErrorDialog(context, description: error.toString());
    }
  }

  List genreDataListDummy = [];
  List<MultiSelectItem<Object?>> genreDataList = [];
  Future<void> getGenreDataList(context) async {
    genreDataListDummy.clear();
    CommanDialog.showLoading(context, title: "Please Wait...");
    try {
      headers['Authorization'] = "Bearer$accessToken";
      final response = await APICall().getRequest('/genre_list', headers);
      CommanDialog.hideLoading(context);
      if (response['status'] == 200) {
        genreDataListDummy.addAll(response['data']);
        genreDataList = genreDataListDummy
            .map((e) => MultiSelectItem(e['title'], e['title']))
            .toList();
        Navigator.pushNamed(
          context,
          '/streamer_bottom_navigation',
        );
      }
      if (response['status'] == 400) {
        print("400 ");
        CommanDialog.showErrorDialog(context, description: response['message']);
      }
    } catch (error) {
      CommanDialog.showErrorDialog(context, description: error.toString());
    }
  }

  //Upload stremer data
  Map<String, String> requiredDataToUplaodVideoAsStremer = {
    'item_type': '',
    'title': '',
    'tagline': '',
    'genre': '',
    'description': '',
    'ad_slots': '',
    'plan_type': '',
    'plan_title': '',
    'plan_price': '',
    'ppv_plan_type': '',
  };

  Future<void> uploadStremerData(context) async {
    log(json.encode(requiredDataToUplaodVideoAsStremer));
    return;
    CommanDialog.showLoading(context, title: "Please Wait...");
    try {
      final response = await APICall().multiformPostRequest(
          '/upload_video', headers, requiredDataToUplaodVideoAsStremer);
      print("response $response");
      CommanDialog.hideLoading(context);
      if (response['status'] == 200) {}
      if (response['status'] == 400) {
        print("400 ");
        CommanDialog.showErrorDialog(context, description: response['message']);
      }
    } catch (error) {
      CommanDialog.showErrorDialog(context, description: error.toString());
    }
  }

  Future<void> updateStreamStatus(context, requiredData) async {
    log("START");

    try {
      headers['Authorization'] = "Bearer$accessToken";
      final response = await APICall()
          .postRequest('/stream_status/$user_id', headers, requiredData);

      if (response['status'] == 200) {}
      if (response['status'] == 400) {
        print("400 ");
        CommanDialog.showErrorDialog(context, description: response['message']);
      }
    } catch (error) {
      CommanDialog.showErrorDialog(context, description: error.toString());
    }
  }

//Streamer Section END

}
