import 'package:flutter/material.dart';
import 'package:giantslayer/model/blast_model.dart';
import 'package:giantslayer/theme/common_button.dart';
import 'package:giantslayer/theme/common_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class BlastScreen extends StatefulWidget {
  const BlastScreen({super.key});

  @override
  State<BlastScreen> createState() => _BlastScreenState();
}

class _BlastScreenState extends State<BlastScreen> {
  final formKey = GlobalKey<FormState>();
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
  final hintTextStyle = GoogleFonts.urbanist(
    fontSize: 14,
    color: Color(0xFF9E9E9E),
    fontWeight: FontWeight.w400,
  );
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
  final price = GoogleFonts.urbanist(
    fontSize: 22,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );
  void playAndShare() {}
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 70),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: CommonTheme.commonContainerColor,
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
                  height: 20,
                ),
                TextFormField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: CommonTheme.commonContainerColor,
                    border: CommonTheme.border,
                    focusedBorder: CommonTheme.placeadfocusedBorder,
                    hintText: 'Enter Text Message',
                    hintStyle: hintTextStyle,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Select target audiance',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
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
                    color: CommonTheme.commonContainerColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton<String>(
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
                    color: CommonTheme.commonContainerColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton<String>(
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
                      ...dropdownGenderItems.map<DropdownMenuItem<String>>((e) {
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
                    color: CommonTheme.commonContainerColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton<String>(
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
                    color: CommonTheme.commonContainerColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton<String>(
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
                    color: CommonTheme.commonContainerColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton<String>(
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
                          fillColor: CommonTheme.commonContainerColor,
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
                          fillColor: CommonTheme.commonContainerColor,
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
                Text(
                  'Based on selection, number will seen here',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
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
                    color: CommonTheme.commonContainerColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton<String>(
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
                      ...dropdownNumberItems.map<DropdownMenuItem<String>>((e) {
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
                SizedBox(
                  height: 20,
                ),
                ...blastModel.map(
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
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Column(
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
                                  'Users',
                                  style: title,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 1),
                                  child: Text(
                                    e.users,
                                    style: subtitle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                '\$${e.price}',
                                style: price,
                              ),
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
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: CommonButton(
                    color: CommonTheme.buttonColor,
                    text: 'Pay Now & Share',
                    type: 'common',
                    textColor: Colors.white,
                    methodName: playAndShare,
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
