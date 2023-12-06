import 'package:flutter/material.dart';
import 'package:giantslayer/auth/forgot_password_screens/create_password_screen.dart';
import 'package:giantslayer/auth/forgot_password_screens/forgot_password.dart';
import 'package:giantslayer/auth/login/login.dart';
import 'package:giantslayer/auth/forgot_password_screens/pin_screen.dart';
import 'package:giantslayer/auth/signup/signup.dart';
import 'package:giantslayer/auth/social_login.dart';
import 'package:giantslayer/controller/all_in_controller.dart';
import 'package:giantslayer/views/bottom_navigation.dart';
import 'package:giantslayer/views/choose_your_interest.dart';
import 'package:giantslayer/views/ifplantypeavod/show_popup_and_paly.dart';
import 'package:giantslayer/views/on_boarding_screen/on_boarding_screen.dart';
import 'package:giantslayer/views/payment_plan_screen.dart/payment_detail_screen.dart';
import 'package:giantslayer/views/payment_plan_screen.dart/plan_screen.dart';
import 'package:giantslayer/views/place_add_screens/list_of_played_new_ads.dart';
import 'package:giantslayer/views/place_add_screens/place_add_screens_bottom_navigation.dart';
import 'package:giantslayer/views/place_add_screens/survey_screen/survey_screen_one.dart';
import 'package:giantslayer/views/play_screen/play_screen.dart';
import 'package:giantslayer/views/profile_screen/edit_profile.dart';
import 'package:giantslayer/views/profile_screen/faq_screen.dart';
import 'package:giantslayer/views/profile_screen/profile_screen.dart';
import 'package:giantslayer/views/search_screen/search_screen.dart';
import 'package:giantslayer/views/streamer_screens/stream_screen/ask_for_approval_stream.dart';
import 'package:giantslayer/views/streamer_screens/stream_screen/stream_list_of_played_ads_new_ads.dart';
import 'package:giantslayer/views/streamer_screens/stream_screen/stream_screen.dart';
import 'package:giantslayer/views/streamer_screens/streamer_bottom_navigation.dart';
import 'package:giantslayer/views/streamer_screens/upcoming_stream_list/upcoming_stream_list.dart';
import 'package:giantslayer/views/streamer_screens/upload_screen/upload_video_screen.dart';
import 'package:provider/provider.dart';
import 'dart:io';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AllInController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => OnBoardingScreen(),
          '/login_screen': (context) => LoginScreen(),
          '/signup_screen': (context) => SignupScreen(),
          '/forgot_password_screen': (context) => ForgotPassword(),
          '/pin_screen': (context) => PinScreen(),
          '/create_password_screen': (context) => CreatePasswordScreen(),
          '/bottom_navigation_screen': (context) => MyBottomNavigation(),
          '/profile_screen': (context) => ProfileScreen(),
          '/edit_profile': (context) => EditProfile(),
          '/faq_screen': (context) => FaqScreen(),
          '/search_screen': (context) => SearchScreen(),
          '/payment_plan_screen': (context) => PaymentPlanScreen(),
          '/payment_detail_screen': (context) => PaymentDetailScreen(),
          '/choose_your_interest': (context) => ChooseYourInterest(),
          '/play_screen': (context) => PlayScreen(),
          '/place_add_screen_bottom_navigation': (context) =>
              PlaceAddScreensBottomNavigation(),
          '/list_of_played_new_ads_screen': (context) =>
              ListOfPlayedNewAdsScreen(),
          '/survey_screen_one': (context) => SurveyScreenOne(),
          '/streamer_bottom_navigation': (context) =>
              StreamerBottomNavigation(),
          '/ask_for_approval_stream': (context) => AskForApprovalStream(),
          '/upload_video_screen': (context) => UploadVideoScreen(),
          '/show_poppup_and_play': (context) => ShowPopupAndPlay(),
          '/stream_list_of_played_ads_new_ads': (context) =>
              StreamListOfPlayedAds(),
          '/upcoming_stream_list': (context) => UpcomingStreamListScreen(),
          '/add_stream': (context) => StreamScreen(),
        },
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
