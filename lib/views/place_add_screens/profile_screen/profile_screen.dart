import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:giantslayer/theme/common_button.dart';
import 'package:giantslayer/theme/common_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class PlaceAdProfileScreen extends StatefulWidget {
  const PlaceAdProfileScreen({super.key});

  @override
  State<PlaceAdProfileScreen> createState() => _PlaceAdProfileScreenState();
}

class _PlaceAdProfileScreenState extends State<PlaceAdProfileScreen> {
  File? selectedImage;
  String base64Image = "";

  Future<void> chooseImage(type) async {
    Navigator.pop(context);
    // ignore: prefer_typing_uninitialized_variables
    var image;
    if (type == "camera") {
      image = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 10);
    } else {
      image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 25);
    }
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
        base64Image = base64Encode(selectedImage!.readAsBytesSync());
        // won't have any error now
      });
    }
  }

  void bottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              InkWell(
                onTap: () {
                  chooseImage("camera");
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: CommonTheme.buttonColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Image From Camera",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  chooseImage("Gallery");
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: CommonTheme.buttonColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Image From Gallery",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String defaultCountryValue = '';
  final List dropdownCountryItems = [
    {'id': '1', 'item': 'India'},
    {'id': '2', 'item': 'England'},
    {'id': '3', 'item': 'Newzeland'},
  ];
  String defaultStateValue = '';
  final List dropdownStateItems = [
    {'id': '1', 'item': 'Rajasthan'},
  ];
  final hintTextStyle = GoogleFonts.urbanist(
    fontSize: 14,
    color: Color(0xFF9E9E9E),
    fontWeight: FontWeight.w400,
  );
  void save() {}
  final formKey = GlobalKey<FormState>();
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
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CommonTheme.buttonColor,
                            border: Border.all(
                              color: CommonTheme.buttonColor,
                            ),
                          ),
                          width: 100,
                          child: ClipOval(
                            child: selectedImage != null
                                ? Image.file(
                                    selectedImage!,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  )
                                : Center(
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/images/girl.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            bottomSheet();
                          },
                          child: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: CommonTheme.buttonColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(Icons.edit),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: CommonTheme.commonContainerColor,
                    border: CommonTheme.border,
                    focusedBorder: CommonTheme.placeadfocusedBorder,
                    hintText: 'Enter Business Name',
                    hintStyle: hintTextStyle,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: CommonTheme.commonContainerColor,
                    border: CommonTheme.border,
                    focusedBorder: CommonTheme.placeadfocusedBorder,
                    hintText: 'Contact Number',
                    hintStyle: hintTextStyle,
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
                    value: defaultCountryValue,
                    isExpanded: true,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Color(0xFF9E9E9E),
                    ),
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          'Country',
                          style: hintTextStyle,
                        ),
                        value: '',
                      ),
                      ...dropdownCountryItems
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
                        defaultCountryValue = value!;
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
                    value: defaultStateValue,
                    isExpanded: true,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Color(0xFF9E9E9E),
                    ),
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          'State',
                          style: hintTextStyle,
                        ),
                        value: '',
                      ),
                      ...dropdownStateItems.map<DropdownMenuItem<String>>((e) {
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
                        defaultStateValue = value!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: CommonTheme.commonContainerColor,
                    border: CommonTheme.border,
                    focusedBorder: CommonTheme.placeadfocusedBorder,
                    hintText: 'Location',
                    hintStyle: hintTextStyle,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: CommonTheme.commonContainerColor,
                    border: CommonTheme.border,
                    focusedBorder: CommonTheme.placeadfocusedBorder,
                    hintText: 'Business Description',
                    hintStyle: hintTextStyle,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: CommonTheme.commonContainerColor,
                    border: CommonTheme.border,
                    focusedBorder: CommonTheme.placeadfocusedBorder,
                    hintText: 'Business Address',
                    hintStyle: hintTextStyle,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: CommonButton(
                    color: CommonTheme.buttonColor,
                    text: 'Save',
                    type: 'common',
                    textColor: Colors.white,
                    methodName: save,
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
