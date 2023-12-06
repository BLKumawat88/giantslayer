import 'package:flutter/material.dart';
import 'package:giantslayer/controller/all_in_controller.dart';
import 'package:giantslayer/theme/common_button.dart';
import 'package:giantslayer/theme/common_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// Stream import start
import 'dart:io';
import 'dart:async';
import 'dart:math';
import '../../call_sample.dart';

//Stream Import End

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int currentIndex = 0;
  late bool _password;
  bool rememberPassword = false;
  bool isOnline = false;

  @override
  void initState() {
    super.initState();
    _password = true;

    // Live stream work start
    _liveConn();
  }

  Future<void> _liveConn() async {
    await _checkOnline();
    Timer.periodic(Duration(seconds: 5), (timer) async {
      await _checkOnline();
    });
  }

  Future<void> _checkOnline() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        if (!isOnline) {
          isOnline = true;
          setState(() {});
          print('Online..');
        }
      }
    } on SocketException catch (_) {
      if (isOnline) {
        isOnline = false;
        setState(() {});
        print('..Offline');
      }
    }
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void signin() {
    //Stream Work Start

    // if (isOnline) {
    //   print("Yes you are ready to connect");

    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) {
    //         return CallSampleWidget(
    //             server:
    //                 'ec2-35-74-244-232.ap-northeast-1.compute.amazonaws.com/openvidu',
    //             sessionName: 'bl',
    //             userName: 'FlutterUser${Random().nextInt(1000)}',
    //             secret: 'giantslayer',
    //             iceServer: 'stun.l.google.com:19302');
    //       },
    //     ),
    //   );
    // } else {
    //   print("You are in offline mode");
    // }

    //Stream work End

    AllInController provider = Provider.of(context, listen: false);
    if (_formKey.currentState!.validate()) {
      Map loginData = {
        "apiKey": "34c5c311ac13d8712863d508d7b61fed",
        "email": email.text,
        "password": password.text,
        "device_type": "Test Api",
        "device_token": "Test api"
      };
      print("User Login Data $loginData");
      provider.userLogin(context, loginData);
    }

    // provider.userLogin(context, requiredData);
    // Navigator.pushNamedAndRemoveUntil(
    //   context,
    //   '/bottom_navigation_screen',
    //   (route) => false,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonTheme.appBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Image.asset('assets/images/logo.png'),
              Text(
                'Login to Your Account',
                style: CommonTheme.commonAuthText,
              ),
              SizedBox(
                height: 40,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: email,
                        style: CommonTheme.textFormFieldTextStyle,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: CommonTheme.commonContainerColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: CommonTheme.buttonColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: 'Email',
                          hintStyle: CommonTheme.textHint,
                          prefixIcon: Icon(
                            Icons.mail_outline_rounded,
                            color: Color(0xFF9E9E9E),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required ';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: password,
                        style: CommonTheme.textFormFieldTextStyle,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _password,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: CommonTheme.commonContainerColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: CommonTheme.buttonColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: 'Password',
                          hintStyle: CommonTheme.textHint,
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            color: currentIndex == 1
                                ? CommonTheme.buttonColor
                                : Color(0xFF9E9E9E),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _password = !_password;
                              });
                            },
                            child: Icon(
                              _password
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: currentIndex == 1
                                  ? CommonTheme.buttonColor
                                  : Color(0xFF9E9E9E),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required ';
                          }
                          return null;
                        },
                      ),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 22,
                        width: 22,
                        child: Checkbox(
                          fillColor: MaterialStateProperty.all(
                            CommonTheme.buttonColor,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          value: rememberPassword,
                          onChanged: (value) {
                            setState(() {
                              rememberPassword = value!;
                              print(rememberPassword);
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 13),
                        child: Text(
                          'Remember me',
                          style: GoogleFonts.urbanist(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/forgot_password_screen');
                    },
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.urbanist(
                        color: CommonTheme.buttonColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              CommonButton(
                color: CommonTheme.buttonColor,
                text: 'Sign in',
                type: 'common',
                textColor: Colors.white,
                methodName: signin,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width / 5,
                    color: Color(0xFF26292F),
                  ),
                  Text(
                    '  or continue with  ',
                    style: GoogleFonts.urbanist(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width / 5,
                    color: Color(0xFF26292F),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 15,
                      left: 30,
                      right: 30,
                      bottom: 15,
                    ),
                    decoration: BoxDecoration(
                      color: CommonTheme.containerColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.asset(
                      'assets/images/facebook.png',
                      width: 30,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 15,
                      left: 30,
                      right: 30,
                      bottom: 15,
                    ),
                    decoration: BoxDecoration(
                      color: CommonTheme.containerColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.asset(
                      'assets/images/google.png',
                      width: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/signup_screen',
                    (route) => false,
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: CommonTheme.alreadyAcountText,
                    children: [
                      TextSpan(
                        text: 'Sign up',
                        style: TextStyle(color: CommonTheme.buttonColor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
