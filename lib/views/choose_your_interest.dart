import 'package:flutter/material.dart';
import 'package:giantslayer/model/choose_your_interest_model.dart';
import 'package:giantslayer/theme/common_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseYourInterest extends StatefulWidget {
  ChooseYourInterest({super.key});

  @override
  State<ChooseYourInterest> createState() => _ChooseYourInterestState();
}

class _ChooseYourInterestState extends State<ChooseYourInterest> {
  final choiceText = GoogleFonts.urbanist(
    fontSize: 18,
    color: CommonTheme.buttonColor,
    fontWeight: FontWeight.w700,
  );

  int? _value = 1;
  String selectedChoice = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonTheme.appBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CommonTheme.appBackgroundColor,
        title: Text(
          'Choose Your Interest',
          style: CommonTheme.appbarTitle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Text(
                      'Choose your interests and get the best movie recommendations. '
                      'Don\'t worry, you can always change it later.',
                      style: TextStyle(color: Colors.white),
                    ),
                    Wrap(
                      children: [
                        ...chooseYourInterest.map(
                          (e) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                right: 10,
                                top: 20,
                              ),
                              child: ChoiceChip(
                                onSelected: (bool selected) {
                                  setState(() {
                                    _value = selected
                                        ? chooseYourInterest.indexOf(e)
                                        : null;
                                  });
                                },
                                labelPadding: EdgeInsets.only(
                                  top: 5,
                                  bottom: 5,
                                  left: 10,
                                  right: 10,
                                ),
                                side: BorderSide(
                                  color: CommonTheme.buttonColor,
                                ),
                                backgroundColor: Colors.black,
                                selected:
                                    _value == chooseYourInterest.indexOf(e),
                                label: Text(
                                  e.title,
                                ),
                                labelStyle: choiceText,
                                selectedColor: CommonTheme.buttonColor,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          width: MediaQuery.of(context).size.width / 2.3,
                          decoration: BoxDecoration(
                            color: Color(0xFF35383F),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Skip',
                              style: CommonTheme.commonAuthButtonText,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          width: MediaQuery.of(context).size.width / 2.3,
                          decoration: BoxDecoration(
                            color: CommonTheme.buttonColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Continue',
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
            // SizedBox(
            //   height: 20,
            // ),
          ],
        ),
      ),
    );
  }
}
