import 'package:flutter/material.dart';
import 'package:giantslayer/controller/all_in_controller.dart';
import 'package:giantslayer/dialog_loading/common_dialog.dart';
import 'package:giantslayer/theme/common_button.dart';
import 'package:giantslayer/theme/common_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  int currentIndex = 0;
  late bool _password;
  late bool _confirmPassword;
  @override
  void initState() {
    super.initState();
    _password = true;
    _confirmPassword = true;
  }

  String defaultValue = '';

  String verificationCode = 'phone';

  final List dropdownItems = [
    {'id': '1', 'item': 'Streamer'},
    {'id': '2', 'item': 'Advertiser'},
    {'id': '3', 'item': 'Viewer'},
  ];

  String defaultValueForStremerType = '';
  final List stremerType = [
    {'id': '1', 'item': 'Club'},
    {'id': '2', 'item': 'Restaurant'},
    {'id': '3', 'item': 'Cafe'},
  ];

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController c_password = TextEditingController();

  void signup() {
    AllInController provider = Provider.of(context, listen: false);
    if (_formKey.currentState!.validate()) {
      if (password.text != c_password.text) {
        CommanDialog.showSnakeBar('Password did not match', context);
      } else if (defaultValue == '') {
        CommanDialog.showSnakeBar('Required User Type', context);
      } else if (defaultValue == "1" && defaultValueForStremerType == '') {
        CommanDialog.showSnakeBar('Required Streamer Type', context);
      } else {
        print("Data $verificationCode");
        print("Submit the Form");

        Map requiredDataToSignUp = {
          "name": name.text,
          "email": email.text,
          "mobile": number.text,
          "verify": verificationCode,
          "user_type": defaultValue,
          "password": password.text,
          "social_login": 0,
          "verify_status": false
        };

        provider.signupUserDataToSendOTP(context, requiredDataToSignUp);
      }
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonTheme.appBackgroundColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Image.asset('assets/images/logo.png'),
              Text(
                'Sign Up',
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
                      style: CommonTheme.textFormFieldTextStyle,
                      controller: name,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: CommonTheme.containerColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: CommonTheme.buttonColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'User Name',
                        hintStyle: CommonTheme.textHint,
                        prefixIcon: Icon(
                          Icons.person_outline_rounded,
                          color: Color(0xFF9E9E9E),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is required ';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: email,
                      style: CommonTheme.textFormFieldTextStyle,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: CommonTheme.containerColor,
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
                      controller: number,
                      style: CommonTheme.textFormFieldTextStyle,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: CommonTheme.containerColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: CommonTheme.buttonColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Contact Number',
                        hintStyle: CommonTheme.textHint,
                        prefixIcon: Icon(
                          Icons.call_outlined,
                          color: Color(0xFF9E9E9E),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Phone is required ';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: CommonTheme.containerColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DropdownButton<String>(
                        underline: SizedBox(),
                        dropdownColor: CommonTheme.containerColor,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Color(0xFF9E9E9E),
                        ),
                        value: defaultValue,
                        isExpanded: true,
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              'User Type',
                              style: CommonTheme.textHint,
                            ),
                            value: '',
                          ),
                          ...dropdownItems.map<DropdownMenuItem<String>>((e) {
                            return DropdownMenuItem(
                              child: Text(
                                e['item'],
                                style: TextStyle(color: Colors.white),
                              ),
                              value: e['id'],
                            );
                          }).toList(),
                        ],
                        onChanged: (value) {
                          setState(() {
                            defaultValue = value!;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: password,
                      style: CommonTheme.textFormFieldTextStyle,
                      obscureText: _password,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: CommonTheme.containerColor,
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
                          color: Color(0xFF9E9E9E),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _password = !_password;
                            });
                          },
                          child: Icon(
                            _password ? Icons.visibility_off : Icons.visibility,
                            color: Color(0xFF9E9E9E),
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
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: c_password,
                      style: CommonTheme.textFormFieldTextStyle,
                      obscureText: _confirmPassword,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: CommonTheme.containerColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: CommonTheme.buttonColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Confirm Password',
                        hintStyle: CommonTheme.textHint,
                        prefixIcon: Icon(
                          Icons.lock_outline_rounded,
                          color: Color(0xFF9E9E9E),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _confirmPassword = !_confirmPassword;
                            });
                          },
                          child: Icon(
                            _confirmPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Color(0xFF9E9E9E),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Confirm Password is required ';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultValue == "1"
                        ? Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: CommonTheme.containerColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: DropdownButton<String>(
                              underline: SizedBox(),
                              dropdownColor: CommonTheme.containerColor,
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Color(0xFF9E9E9E),
                              ),
                              value: defaultValueForStremerType,
                              isExpanded: true,
                              items: [
                                DropdownMenuItem(
                                  child: Text(
                                    'Streamer Type',
                                    style: CommonTheme.textHint,
                                  ),
                                  value: '',
                                ),
                                ...stremerType
                                    .map<DropdownMenuItem<String>>((e) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      e['item'],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    value: e['id'],
                                  );
                                }).toList(),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  defaultValueForStremerType = value!;
                                });
                              },
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Send Verification code over',
                  style: GoogleFonts.urbanist(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: Radio(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          fillColor: MaterialStateProperty.all(
                              CommonTheme.buttonColor),
                          value: "phone",
                          groupValue: verificationCode,
                          onChanged: (value) {
                            setState(() {
                              verificationCode = value.toString();
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 13),
                        child: Text(
                          'Phone',
                          style: GoogleFonts.urbanist(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: Radio(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            fillColor: MaterialStateProperty.all(
                                CommonTheme.buttonColor),
                            value: "email",
                            groupValue: verificationCode,
                            onChanged: (value) {
                              setState(() {
                                verificationCode = value.toString();
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 13),
                          child: Text(
                            'Email',
                            style: GoogleFonts.urbanist(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
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
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: Text(
                      'I agree with the terms of use',
                      style: GoogleFonts.urbanist(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 35,
              ),
              CommonButton(
                color: CommonTheme.buttonColor,
                text: 'Sign up',
                type: 'common',
                textColor: Colors.white,
                methodName: signup,
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
                    '/login_screen',
                    (route) => false,
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: CommonTheme.alreadyAcountText,
                    children: [
                      TextSpan(
                        text: 'Log in',
                        style: TextStyle(color: CommonTheme.buttonColor),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
