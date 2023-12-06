import 'package:flutter/material.dart';
import 'package:giantslayer/theme/common_button.dart';
import 'package:giantslayer/theme/common_image_button.dart';
import 'package:giantslayer/theme/common_theme.dart';

class SocialLogin extends StatefulWidget {
  const SocialLogin({super.key});

  @override
  State<SocialLogin> createState() => _SocialLoginState();
}

class _SocialLoginState extends State<SocialLogin> {
  loginWithFacebook() {}
  loginWithGoogle() {}

  signinWithPassword() {
    Navigator.pushNamed(context, '/login_screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonTheme.appBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/socialloginscreen.png',
                  width: 200,
                  height: 200,
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Let’s You in',
                  style: CommonTheme.socialLoginText,
                ),
                SizedBox(
                  height: 50,
                ),
                CommonImageButton(
                  color: CommonTheme.commonContainerColor,
                  text: 'Login with Facebook',
                  image: 'assets/images/facebook.png',
                  type: 'common',
                  textColor: Colors.white,
                  methodName: loginWithFacebook,
                ),
                SizedBox(
                  height: 20,
                ),
                CommonImageButton(
                  color: CommonTheme.commonContainerColor,
                  text: 'Login with Google',
                  image: 'assets/images/google.png',
                  type: 'common',
                  textColor: Colors.white,
                  methodName: loginWithGoogle,
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width / 2.8,
                      color: Color(0xFF26292F),
                    ),
                    Text(
                      '  or  ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width / 2.8,
                      color: Color(0xFF26292F),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                CommonButton(
                  color: CommonTheme.buttonColor,
                  text: 'Sign in with password',
                  type: 'common',
                  textColor: Colors.white,
                  methodName: signinWithPassword,
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/signup_screen');
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
      ),
    );
  }
}
