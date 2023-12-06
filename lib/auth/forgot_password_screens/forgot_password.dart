import 'package:flutter/material.dart';
import 'package:giantslayer/theme/common_button.dart';
import 'package:giantslayer/theme/common_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  int currentIndex = 0;
  void continues() {
    Navigator.pushNamed(context, '/pin_screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonTheme.appBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Forgot Password',
          style: CommonTheme.appbarTitle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Image.asset(
                'assets/images/forgotpassword.png',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Select which contact details should we use to reset your password',
                style: GoogleFonts.urbanist(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: CommonTheme.commonContainerColor,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: currentIndex == 0
                          ? CommonTheme.buttonColor
                          : CommonTheme.containerColor,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(25),
                        margin: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          color: CommonTheme.buttonColor.withOpacity(.2),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/images/sms.png',
                          width: 25,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'via SMS',
                              style: GoogleFonts.urbanist(
                                color: CommonTheme.forgotPasswordText,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '+1 111 ******99',
                              style: GoogleFonts.urbanist(
                                color: CommonTheme.forgotPasswordText,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: CommonTheme.commonContainerColor,
                    border: Border.all(
                      color: currentIndex == 1
                          ? CommonTheme.buttonColor
                          : CommonTheme.containerColor,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(25),
                        margin: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          color: CommonTheme.buttonColor.withOpacity(.2),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/images/sms.png',
                          width: 25,
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'via Email',
                                style: GoogleFonts.urbanist(
                                  color: CommonTheme.forgotPasswordText,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                'giant*******er@gmail.com',
                                style: GoogleFonts.urbanist(
                                  color: CommonTheme.forgotPasswordText,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              CommonButton(
                color: CommonTheme.buttonColor,
                text: 'Continue',
                type: 'common',
                textColor: Colors.white,
                methodName: continues,
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
