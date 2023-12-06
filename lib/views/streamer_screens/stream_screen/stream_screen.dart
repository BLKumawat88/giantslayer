import 'package:flutter/material.dart';
import 'package:giantslayer/theme/common_button.dart';
import 'package:giantslayer/theme/common_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class StreamScreen extends StatefulWidget {
  const StreamScreen({super.key});

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

final hintTextStyle = GoogleFonts.urbanist(
  fontSize: 14,
  color: Color(0xFF9E9E9E),
  fontWeight: FontWeight.w400,
);
final textStyle = GoogleFonts.urbanist(
  fontSize: 14,
  color: Colors.white,
  fontWeight: FontWeight.w500,
);
String defaultGenereValue = '';
final List dropdownGenereItems = [
  {'id': '1', 'item': ''},
];
String defaultAdSlotsValue = '';
final List dropdownAdSlotsItems = [
  {'id': '1', 'item': ''},
];
String defaultPlansValue = '';
final List dropdownPlansItems = [
  {'id': '1', 'item': ''},
];

final formKey = GlobalKey<FormState>();
TextEditingController title = TextEditingController();
TextEditingController tagline = TextEditingController();
TextEditingController chooseDate = TextEditingController();
TextEditingController description = TextEditingController();
TextEditingController planTitle = TextEditingController();
TextEditingController price = TextEditingController();

class _StreamScreenState extends State<StreamScreen> {
  DateTime currentDate = DateTime.now();
  DateTime firstDate = DateTime(1900);
  DateTime lastDate = DateTime.now();

  void datePicker(context) async {
    DateTime? userSelectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (userSelectedDate == null) {
      return;
    } else {
      setState(() {
        currentDate = userSelectedDate;
        var dob = '${currentDate.day}/${currentDate.month}/${currentDate.year}';
        chooseDate.text = dob;
      });
    }
  }

  void askForApproval() {
    Navigator.pushNamed(context, '/ask_for_approval_stream');
    return;
    if (formKey.currentState!.validate()) {
      Map streamData = {
        'title': title.text,
        'tagline': tagline.text,
        'chooseDate': chooseDate.text,
        'description': description.text,
        'planTitle': planTitle.text,
        'price': price.text,
      };
      print('streamData $streamData');
    }
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
                  padding: EdgeInsets.only(top: 3, bottom: 3),
                  decoration: BoxDecoration(
                    color: CommonTheme.buttonColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: CommonTheme.commonContainerColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Upload Trailer',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 45),
                              width: MediaQuery.of(context).size.width / 2.7,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    margin: EdgeInsets.only(
                                      bottom: 15,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          CommonTheme.buttonColor.withAlpha(50),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Icon(
                                      Icons.video_call,
                                      color: CommonTheme.buttonColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 15,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/thumbnail.png',
                                          width: 15,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Upload video',
                                          style: GoogleFonts.urbanist(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 45),
                              width: MediaQuery.of(context).size.width / 2.7,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    margin: EdgeInsets.only(
                                      bottom: 15,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          CommonTheme.buttonColor.withAlpha(50),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Icon(
                                      Icons.image_outlined,
                                      color: CommonTheme.buttonColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/thumbnail.png',
                                          width: 15,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Upload Thumbnail',
                                          style: GoogleFonts.urbanist(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: textStyle,
                  controller: title,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: CommonTheme.commonContainerColor,
                    border: CommonTheme.border,
                    focusedBorder: CommonTheme.placeadfocusedBorder,
                    errorBorder: CommonTheme.errorBorder,
                    hintText: 'Enter Title',
                    hintStyle: hintTextStyle,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter title';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: textStyle,
                  controller: tagline,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: CommonTheme.commonContainerColor,
                    border: CommonTheme.border,
                    focusedBorder: CommonTheme.placeadfocusedBorder,
                    errorBorder: CommonTheme.errorBorder,
                    hintText: 'Enter Tagline',
                    hintStyle: hintTextStyle,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter tagline';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
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
                    dropdownColor: CommonTheme.commonContainerColor,
                    underline: SizedBox(),
                    value: defaultGenereValue,
                    isExpanded: true,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Color(0xFF9E9E9E),
                    ),
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          'Enter Genre',
                          style: hintTextStyle,
                        ),
                        value: '',
                      ),
                      ...dropdownGenereItems.map<DropdownMenuItem<String>>((e) {
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
                        defaultGenereValue = value!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    datePicker(context);
                  },
                  child: Container(
                    child: TextFormField(
                      style: textStyle,
                      enabled: false,
                      controller: chooseDate,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: CommonTheme.commonContainerColor,
                        border: CommonTheme.border,
                        focusedBorder: CommonTheme.placeadfocusedBorder,
                        hintText: 'Chosse Date',
                        hintStyle: hintTextStyle,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: CommonTheme.commonContainerColor,
                    border: CommonTheme.border,
                    focusedBorder: CommonTheme.placeadfocusedBorder,
                    hintText: 'Chosse Time',
                    hintStyle: hintTextStyle,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: description,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: CommonTheme.commonContainerColor,
                    border: CommonTheme.border,
                    focusedBorder: CommonTheme.placeadfocusedBorder,
                    errorBorder: CommonTheme.errorBorder,
                    hintText: 'Description',
                    hintStyle: hintTextStyle,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter description';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
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
                    dropdownColor: CommonTheme.commonContainerColor,
                    underline: SizedBox(),
                    value: defaultAdSlotsValue,
                    isExpanded: true,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Color(0xFF9E9E9E),
                    ),
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          'Select ad slots',
                          style: hintTextStyle,
                        ),
                        value: '',
                      ),
                      ...dropdownAdSlotsItems
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
                        defaultAdSlotsValue = value!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
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
                    dropdownColor: CommonTheme.commonContainerColor,
                    underline: SizedBox(),
                    value: defaultPlansValue,
                    isExpanded: true,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Color(0xFF9E9E9E),
                    ),
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          'Choose Plans',
                          style: hintTextStyle,
                        ),
                        value: '',
                      ),
                      ...dropdownPlansItems.map<DropdownMenuItem<String>>((e) {
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
                        defaultPlansValue = value!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Create Plan',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: planTitle,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: CommonTheme.commonContainerColor,
                    border: CommonTheme.border,
                    focusedBorder: CommonTheme.placeadfocusedBorder,
                    errorBorder: CommonTheme.errorBorder,
                    hintText: 'Plan Title',
                    hintStyle: hintTextStyle,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter plan title';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: price,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: CommonTheme.commonContainerColor,
                    border: CommonTheme.border,
                    focusedBorder: CommonTheme.placeadfocusedBorder,
                    errorBorder: CommonTheme.errorBorder,
                    hintText: 'Price',
                    hintStyle: hintTextStyle,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter price';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                    bottom: 40,
                  ),
                  child: CommonButton(
                    color: CommonTheme.buttonColor,
                    text: 'Ask For Approval',
                    type: 'common',
                    textColor: Colors.white,
                    methodName: askForApproval,
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
