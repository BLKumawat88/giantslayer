import 'package:flutter/material.dart';
import 'package:giantslayer/model/stepper_place_ad_model.dart';
import 'package:giantslayer/theme/common_button.dart';
import 'package:giantslayer/theme/common_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class SurveyScreenOne extends StatefulWidget {
  const SurveyScreenOne({super.key});

  @override
  State<SurveyScreenOne> createState() => _SurveyScreenOneState();
}

class _SurveyScreenOneState extends State<SurveyScreenOne> {
  int _index = 0;
  bool _share = false;
  bool _views = false;
  String good = 'Good';
  String better = 'Better';
  String best = 'Best';
  String excellent = 'Excellent';
  String defaultLocationValue = '';
  final List dropdownLocationItems = [
    {'id': '1', 'item': ''},
    {'id': '2', 'item': ''},
    {'id': '3', 'item': ''},
  ];

  String defaultGenderValue = '';
  final List dropdownGenderItems = [
    {'id': '1', 'item': 'Male'},
    {'id': '2', 'item': 'Female'},
    {'id': '3', 'item': 'Other'},
  ];

  String defaultMaritalValue = '';
  final List dropdownMaritalItems = [
    {'id': '1', 'item': 'Married'},
    {'id': '2', 'item': 'Unmarried'},
  ];

  String defaultReligionValue = '';
  final List dropdownReligionItems = [
    {'id': '1', 'item': 'Buddhism'},
    {'id': '2', 'item': 'Christianity'},
    {'id': '3', 'item': 'Hinduism'},
    {'id': '4', 'item': 'Islam'},
    {'id': '5', 'item': 'Jainism'},
    {'id': '6', 'item': 'Sikhism'},
  ];

  String defaultOccupationValue = '';
  final List dropdownOccupationItems = [
    {'id': '1', 'item': 'Student'},
    {'id': '2', 'item': 'Working'},
  ];

  String defaultNumberValue = '';
  final List dropdownNumberItems = [
    {'id': '1', 'item': ''},
    {'id': '2', 'item': ''},
  ];
  final title = GoogleFonts.urbanist(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );
  final subtitle = GoogleFonts.roboto(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );
  final hintTextStyle = GoogleFonts.urbanist(
    fontSize: 14,
    color: Color(0xFF9E9E9E),
    fontWeight: FontWeight.w400,
  );
  final radioButtonText = GoogleFonts.inter(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
  String selected = 'selected';
  String surveyValue = 'selected';

  void askForApproval() {
    surveyDialog();
  }

  void uploadAdvertisement() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xFF1F222A),
          title: Text(
            textAlign: TextAlign.center,
            'Upload An Advertiesment',
            style: GoogleFonts.inter(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 35),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xFF0A0909),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: CommonTheme.buttonColor.withAlpha(50),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.video_call,
                            color: CommonTheme.buttonColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                            'Upload video',
                            style: GoogleFonts.urbanist(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 40,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        filled: true,
                        fillColor: Color(0xFF0A0909),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: CommonTheme.buttonColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: CommonTheme.buttonColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: CommonTheme.buttonColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Tittle of the advertiesment here',
                        hintStyle: GoogleFonts.urbanist(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        filled: true,
                        fillColor: Color(0xFF0A0909),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: CommonTheme.buttonColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: CommonTheme.buttonColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: CommonTheme.buttonColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Thumbnail',
                        hintStyle: GoogleFonts.urbanist(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CommonButton(
                      color: CommonTheme.buttonColor,
                      text: 'Ask For Approval',
                      type: 'common',
                      textColor: Colors.white,
                      methodName: askForApproval,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void surveyDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          backgroundColor: Color(0xFF1F222A),
          title: Text(
            textAlign: TextAlign.center,
            'Add Survey Quesrtions',
            style: GoogleFonts.inter(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          content: Text(
            textAlign: TextAlign.center,
            'How Would You like to our survey',
            style: GoogleFonts.inter(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: [
            Column(
              children: [
                Row(
                  children: [
                    Radio(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      fillColor: MaterialStateProperty.all(
                        CommonTheme.buttonColor,
                      ),
                      value: 'unselected',
                      groupValue: surveyValue,
                      onChanged: (value) {
                        setState(() {
                          selected = value.toString();
                        });
                        print(value);
                      },
                    ),
                    Text(
                      'Good',
                      style: radioButtonText,
                    )
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      fillColor: MaterialStateProperty.all(
                        CommonTheme.buttonColor,
                      ),
                      value: 'unselected',
                      groupValue: surveyValue,
                      onChanged: (value) {
                        setState(() {
                          selected = value.toString();
                        });
                        print(value);
                      },
                    ),
                    Text(
                      'Best',
                      style: radioButtonText,
                    )
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      fillColor: MaterialStateProperty.all(
                        CommonTheme.buttonColor,
                      ),
                      value: 'unselected',
                      groupValue: surveyValue,
                      onChanged: (value) {
                        setState(() {
                          selected = value.toString();
                        });
                        print(value);
                      },
                    ),
                    Text(
                      'Better',
                      style: radioButtonText,
                    )
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      fillColor: MaterialStateProperty.all(
                        CommonTheme.buttonColor,
                      ),
                      value: 'selected',
                      groupValue: surveyValue,
                      onChanged: (value) {
                        setState(() {
                          selected = value.toString();
                        });
                        print(value);
                      },
                    ),
                    Text(
                      'Excellent',
                      style: radioButtonText,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: TextButton(
                    onPressed: () {
                      addMore();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Add More',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            color: CommonTheme.buttonColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Icon(
                          Icons.add,
                          color: CommonTheme.buttonColor,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: Card(
                      elevation: 6,
                      shadowColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                          color: CommonTheme.buttonColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Save',
                            style: CommonTheme.commonAuthButtonText,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void addMore() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36),
          ),
          backgroundColor: Color(0xFF1F222A),
          title: Text(
            textAlign: TextAlign.center,
            'Play Ad on live streming',
            style: GoogleFonts.inter(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Upcoming Streamer',
                    style: GoogleFonts.urbanist(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF1F222A),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: CommonTheme.buttonColor,
                      ),
                    ),
                    child: DropdownButton<String>(
                      dropdownColor: Colors.white,
                      underline: SizedBox(),
                      value: defaultNumberValue,
                      isExpanded: true,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color(0xFF9E9E9E),
                      ),
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            'Select',
                            style: GoogleFonts.urbanist(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          value: '',
                        ),
                        ...dropdownNumberItems
                            .map<DropdownMenuItem<String>>((e) {
                          return DropdownMenuItem(
                            child: Text(
                              e['item'],
                              style: TextStyle(color: Colors.black),
                            ),
                            value: e['id'],
                          );
                        }).toList(),
                      ],
                      onChanged: (value) {
                        setState(() {
                          defaultNumberValue = value!;
                        });
                      },
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 45,
                        bottom: 20,
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Card(
                          elevation: 6,
                          shadowColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: BoxDecoration(
                              color: CommonTheme.buttonColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Ask Admin for Slots',
                                style: CommonTheme.commonAuthButtonText,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

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
      body: Theme(
        data: ThemeData(
          canvasColor: Colors.transparent,
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: Colors.amber,
                background: Colors.red,
                secondary: Colors.green,
              ),
        ),
        child: Stepper(
          controlsBuilder: (context, details) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                ),
                _index == 0
                    ? InkWell(
                        onTap: () {
                          if (_index < 2) {
                            print('This is index value $_index');
                            setState(() {
                              _index++;
                            });
                          } else {
                            print('Step complete');
                          }
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              100,
                            ),
                          ),
                          elevation: 6,
                          shadowColor: Colors.red,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
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
                                'Next',
                                style: CommonTheme.commonAuthButtonText,
                              ),
                            ),
                          ),
                        ),
                      )
                    : _index == 1
                        ? InkWell(
                            onTap: () {
                              if (_index < 2) {
                                print('This is index value $_index');
                                setState(() {
                                  _index++;
                                });
                              } else {
                                print('Step complete');
                              }
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  100,
                                ),
                              ),
                              elevation: 6,
                              shadowColor: Colors.red,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
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
                                    'Next',
                                    style: CommonTheme.commonAuthButtonText,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : _index == 2
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (_index < 2) {
                                        print('This is index value $_index');
                                        setState(() {
                                          _index++;
                                        });
                                      } else {
                                        print('Step complete');
                                      }
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          100,
                                        ),
                                      ),
                                      elevation: 6,
                                      shadowColor: Colors.red,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
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
                                            'Submit',
                                            style: CommonTheme
                                                .commonAuthButtonText,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Want To Place Ad ?',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 10,
                                      shadowColor: Colors.red,
                                      shape: RoundedRectangleBorder(),
                                    ),
                                    onPressed: () {
                                      uploadAdvertisement();
                                    },
                                    child: Text(
                                      'Click Here',
                                      style: GoogleFonts.urbanist(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox()
              ],
            );
          },
          onStepTapped: (int index) {
            setState(() {
              _index = index;
            });
          },
          currentStep: _index,
          elevation: 0,
          type: StepperType.horizontal,
          physics: BouncingScrollPhysics(),
          steps: [
            Step(
              isActive: _index >= 0,
              state: StepState.indexed,
              title: SizedBox(),
              content: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 40,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF0A0909),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Image.asset(
                            'assets/images/the_patient.png',
                            width: 250,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Image.asset(
                          'assets/images/link.png',
                          width: 40,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Image.asset(
                          'assets/images/comment.png',
                          width: 40,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: Image.asset(
                          'assets/images/shares.png',
                          width: 40,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Image.asset(
                          'assets/images/like.png',
                          width: 40,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bookmark_border,
                          color: Colors.white,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: CommonTheme.buttonColor,
                            ),
                          ),
                          child: Text(
                            'Submit and save to make extra money',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 20,
                        ),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color(0xFF1F222A),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          'Link of the website',
                          style: hintTextStyle,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Image.asset(
                          'assets/images/link.png',
                          width: 40,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SwitchListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      'Do you want users to share your ad',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    activeColor: Colors.white,
                    activeTrackColor: CommonTheme.buttonColor,
                    inactiveTrackColor: Color(0xFF1F222A),
                    contentPadding: EdgeInsets.all(0),
                    value: _share,
                    onChanged: (value) {
                      setState(() {
                        _share = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      'Do you want users to confirm thier views',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    activeColor: Colors.white,
                    activeTrackColor: CommonTheme.buttonColor,
                    inactiveTrackColor: Color(0xFF1F222A),
                    contentPadding: EdgeInsets.all(0),
                    value: _views,
                    onChanged: (value) {
                      setState(() {
                        _views = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 20,
                        ),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color(0xFF1F222A),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              'How Would You like to our survey?',
                              style: GoogleFonts.inter(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: RadioListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    toggleable: true,
                                    activeColor: CommonTheme.buttonColor,
                                    value: 'Good',
                                    groupValue: good,
                                    title: Text(
                                      'Good',
                                      style: GoogleFonts.inter(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        good = value.toString();
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    toggleable: true,
                                    activeColor: CommonTheme.buttonColor,
                                    value: 'Better',
                                    groupValue: good,
                                    title: Text(
                                      'Better',
                                      style: GoogleFonts.inter(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        good = value.toString();
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: RadioListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    toggleable: true,
                                    activeColor: CommonTheme.buttonColor,
                                    value: 'Best',
                                    groupValue: good,
                                    title: Text(
                                      'Best',
                                      style: GoogleFonts.inter(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        good = value.toString();
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    toggleable: true,
                                    activeColor: CommonTheme.buttonColor,
                                    value: 'Excellent',
                                    groupValue: good,
                                    title: Text(
                                      'Excellent',
                                      style: GoogleFonts.inter(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        good = value.toString();
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: CommonTheme.buttonColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/edit.png',
                                    width: 17,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFED1D24),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/delete.png',
                                    width: 17,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Image.asset(
                          'assets/images/comment_left.png',
                          width: 40,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xFF1F222A),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Select video on which you want to place Ad',
                            style: GoogleFonts.urbanist(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Text(
                          'Add',
                          style: GoogleFonts.urbanist(
                            fontSize: 14,
                            color: CommonTheme.buttonColor,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Step(
              isActive: _index >= 1,
              state: StepState.indexed,
              title: SizedBox(),
              content: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 40,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF0A0909),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Image.asset(
                            'assets/images/the_patient.png',
                            width: 250,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Image.asset(
                          'assets/images/link.png',
                          width: 40,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Image.asset(
                          'assets/images/comment.png',
                          width: 40,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: Image.asset(
                          'assets/images/shares.png',
                          width: 40,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Image.asset(
                          'assets/images/like.png',
                          width: 40,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bookmark_border,
                          color: Colors.white,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: CommonTheme.buttonColor,
                            ),
                          ),
                          child: Text(
                            'Submit and save to make extra money',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Select Target Audiance',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF1F222A),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: DropdownButton<String>(
                      dropdownColor: Colors.white,
                      underline: SizedBox(),
                      value: defaultLocationValue,
                      isExpanded: true,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color(0xFF9E9E9E),
                      ),
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            'Location',
                            style: hintTextStyle,
                          ),
                          value: '',
                        ),
                        ...dropdownLocationItems
                            .map<DropdownMenuItem<String>>((e) {
                          return DropdownMenuItem(
                            child: Text(
                              e['item'],
                              style: TextStyle(color: Colors.black),
                            ),
                            value: e['id'],
                          );
                        }).toList(),
                      ],
                      onChanged: (value) {
                        setState(() {
                          defaultLocationValue = value!;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF1F222A),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: DropdownButton<String>(
                      dropdownColor: Colors.white,
                      underline: SizedBox(),
                      value: defaultGenderValue,
                      isExpanded: true,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color(0xFF9E9E9E),
                      ),
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            'Gender',
                            style: hintTextStyle,
                          ),
                          value: '',
                        ),
                        ...dropdownGenderItems
                            .map<DropdownMenuItem<String>>((e) {
                          return DropdownMenuItem(
                            child: Text(
                              e['item'],
                              style: TextStyle(color: Colors.black),
                            ),
                            value: e['id'],
                          );
                        }).toList(),
                      ],
                      onChanged: (value) {
                        setState(() {
                          defaultGenderValue = value!;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF1F222A),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: DropdownButton<String>(
                      dropdownColor: Colors.white,
                      underline: SizedBox(),
                      value: defaultMaritalValue,
                      isExpanded: true,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color(0xFF9E9E9E),
                      ),
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            'Marital Status',
                            style: hintTextStyle,
                          ),
                          value: '',
                        ),
                        ...dropdownMaritalItems
                            .map<DropdownMenuItem<String>>((e) {
                          return DropdownMenuItem(
                            child: Text(
                              e['item'],
                              style: TextStyle(color: Colors.black),
                            ),
                            value: e['id'],
                          );
                        }).toList(),
                      ],
                      onChanged: (value) {
                        setState(() {
                          defaultMaritalValue = value!;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF1F222A),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: DropdownButton<String>(
                      dropdownColor: Colors.white,
                      underline: SizedBox(),
                      value: defaultReligionValue,
                      isExpanded: true,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color(0xFF9E9E9E),
                      ),
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            'Religion Status',
                            style: hintTextStyle,
                          ),
                          value: '',
                        ),
                        ...dropdownReligionItems
                            .map<DropdownMenuItem<String>>((e) {
                          return DropdownMenuItem(
                            child: Text(
                              e['item'],
                              style: TextStyle(color: Colors.black),
                            ),
                            value: e['id'],
                          );
                        }).toList(),
                      ],
                      onChanged: (value) {
                        setState(() {
                          defaultReligionValue = value!;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF1F222A),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: DropdownButton<String>(
                      dropdownColor: Colors.white,
                      underline: SizedBox(),
                      value: defaultOccupationValue,
                      isExpanded: true,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color(0xFF9E9E9E),
                      ),
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            'Student/ Working',
                            style: hintTextStyle,
                          ),
                          value: '',
                        ),
                        ...dropdownOccupationItems
                            .map<DropdownMenuItem<String>>((e) {
                          return DropdownMenuItem(
                            child: Text(
                              e['item'],
                              style: TextStyle(color: Colors.black),
                            ),
                            value: e['id'],
                          );
                        }).toList(),
                      ],
                      onChanged: (value) {
                        setState(() {
                          defaultOccupationValue = value!;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: CommonTheme.border,
                            focusedBorder: CommonTheme.placeadfocusedBorder,
                            filled: true,
                            fillColor: Color(0xFF1F222A),
                            hintText: 'Salary',
                            hintStyle: hintTextStyle,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: CommonTheme.border,
                            focusedBorder: CommonTheme.placeadfocusedBorder,
                            filled: true,
                            fillColor: Color(0xFF1F222A),
                            hintText: 'Age',
                            hintStyle: hintTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'List of video on the basis of filters',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF1F222A),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: DropdownButton<String>(
                      dropdownColor: Colors.white,
                      underline: SizedBox(),
                      value: defaultNumberValue,
                      isExpanded: true,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color(0xFF9E9E9E),
                      ),
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            'Select',
                            style: hintTextStyle,
                          ),
                          value: '',
                        ),
                        ...dropdownNumberItems
                            .map<DropdownMenuItem<String>>((e) {
                          return DropdownMenuItem(
                            child: Text(
                              e['item'],
                              style: TextStyle(color: Colors.black),
                            ),
                            value: e['id'],
                          );
                        }).toList(),
                      ],
                      onChanged: (value) {
                        setState(() {
                          defaultNumberValue = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Step(
              isActive: _index >= 2,
              state: StepState.indexed,
              title: SizedBox(),
              content: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 40,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF0A0909),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Image.asset(
                            'assets/images/the_patient.png',
                            width: 250,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Image.asset(
                          'assets/images/link.png',
                          width: 40,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Image.asset(
                          'assets/images/comment.png',
                          width: 40,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: Image.asset(
                          'assets/images/shares.png',
                          width: 40,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Image.asset(
                          'assets/images/like.png',
                          width: 40,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Select Plan',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ...stepperPlaceAd.map(
                    (e) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/tracks.png',
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Plan 1',
                                  style: title,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 1),
                                  child: Text(
                                    e.plan,
                                    style: subtitle,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'CPM',
                                  style: title,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 1,
                                  ),
                                  child: Text(
                                    e.cpm,
                                    style: subtitle,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Radio(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  fillColor: MaterialStateProperty.all(
                                    CommonTheme.buttonColor,
                                  ),
                                  toggleable: true,
                                  value: 'selected',
                                  groupValue: e.radioButtonValue,
                                  onChanged: (value) {
                                    setState(() {
                                      e.radioButtonValue = value.toString();
                                    });
                                    print(value);
                                  },
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
          ],
        ),
      ),
    );
  }
}
