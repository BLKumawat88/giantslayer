import 'package:flutter/material.dart';
import 'package:giantslayer/controller/all_in_controller.dart';
import 'package:giantslayer/theme/common_button.dart';
import 'package:giantslayer/theme/common_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:provider/provider.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String defaultNumberValue = '';
  final List dropdownNumberItems = [
    {'id': 'tv_show', 'item': 'Tv Shows'},
    {'id': 'movie', 'item': 'Movie'},
    {'id': 'network_tv', 'item': 'Network TV'},
  ];

  String defaultGenereValue = '';
  final List dropdownGenereItems = [
    {'id': '1', 'item': ''},
    {'id': '2', 'item': ''},
  ];
  final hintTextStyle = GoogleFonts.urbanist(
    fontSize: 14,
    color: Color(0xFF9E9E9E),
    fontWeight: FontWeight.w400,
  );
  void btnNext() {
    AllInController provider = Provider.of(context, listen: false);
    _formKey.currentState!.save();
    print("object ${provider.requiredDataToUplaodVideoAsStremer}");
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, '/upload_video_screen');
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    AllInController provider = Provider.of(context, listen: false);

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  bottom: 15,
                ),
                child: Text(
                  'Do You Want To Upload Network TV ( 12-24 Hours Pre Programing )',
                  style: GoogleFonts.urbanist(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CommonTheme.buttonColor,
                  shape: RoundedRectangleBorder(),
                  elevation: 6,
                  shadowColor: Colors.red,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/upload_video_screen');
                },
                child: Text(
                  'Upload Video',
                  style: GoogleFonts.urbanist(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
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
                  value: defaultNumberValue,
                  isExpanded: true,
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Color(0xFF9E9E9E),
                  ),
                  items: [
                    DropdownMenuItem(
                      child: Text(
                        'Select Item type',
                        style: hintTextStyle,
                      ),
                      value: '',
                    ),
                    ...dropdownNumberItems.map<DropdownMenuItem<String>>((e) {
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
                      defaultNumberValue = value!;
                      provider.requiredDataToUplaodVideoAsStremer['item_type'] =
                          defaultNumberValue;
                      print(
                          "${provider.requiredDataToUplaodVideoAsStremer['item_type']}");
                    });
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
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
                          width: MediaQuery.of(context).size.width / 2.65,
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
                                  color: CommonTheme.buttonColor.withAlpha(50),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.video_call,
                                  color: CommonTheme.buttonColor,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                          width: MediaQuery.of(context).size.width / 2.65,
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
                                  color: CommonTheme.buttonColor.withAlpha(50),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/thumbnail.png',
                                      width: 15,
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
                    Text(
                      'Upload Movie / TV Shows',
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
                          width: MediaQuery.of(context).size.width / 2.65,
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
                                  color: CommonTheme.buttonColor.withAlpha(50),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.video_call,
                                  color: CommonTheme.buttonColor,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                          width: MediaQuery.of(context).size.width / 2.65,
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
                                  color: CommonTheme.buttonColor.withAlpha(50),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/thumbnail.png',
                                      width: 15,
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
              SizedBox(
                height: 20,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        initialValue: provider
                            .requiredDataToUplaodVideoAsStremer['title'],
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: CommonTheme.commonContainerColor,
                          border: CommonTheme.border,
                          focusedBorder: CommonTheme.placeadfocusedBorder,
                          hintText: 'Enter Title',
                          hintStyle: hintTextStyle,
                        ),
                        onSaved: (value) {
                          provider.requiredDataToUplaodVideoAsStremer['title'] =
                              value.toString();
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Title';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        onSaved: (value) {
                          provider.requiredDataToUplaodVideoAsStremer[
                              'tagline'] = value.toString();
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: CommonTheme.commonContainerColor,
                          border: CommonTheme.border,
                          focusedBorder: CommonTheme.placeadfocusedBorder,
                          hintText: 'Enter Tagline',
                          hintStyle: hintTextStyle,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Tagline';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Container(
                      //   padding: EdgeInsets.symmetric(
                      //     horizontal: 12,
                      //     vertical: 5,
                      //   ),
                      //   decoration: BoxDecoration(
                      //     color: CommonTheme.commonContainerColor,
                      //     borderRadius: BorderRadius.circular(15),
                      //   ),
                      //   child: DropdownButton<String>(
                      //     dropdownColor: CommonTheme.commonContainerColor,
                      //     underline: SizedBox(),
                      //     value: defaultGenereValue,
                      //     isExpanded: true,
                      //     icon: Icon(
                      //       Icons.keyboard_arrow_down_rounded,
                      //       color: Color(0xFF9E9E9E),
                      //     ),
                      //     items: [
                      //       DropdownMenuItem(
                      //         child: Text(
                      //           'Enter Genre',
                      //           style: hintTextStyle,
                      //         ),
                      //         value: '',
                      //       ),
                      //       ...dropdownGenereItems
                      //           .map<DropdownMenuItem<String>>((e) {
                      //         return DropdownMenuItem(
                      //           child: Text(
                      //             e['item'],
                      //             style: TextStyle(color: Colors.black),
                      //           ),
                      //           value: e['id'],
                      //         );
                      //       }).toList(),
                      //     ],
                      //     onChanged: (value) {
                      //       setState(() {
                      //         defaultGenereValue = value!;
                      //       });
                      //     },
                      //   ),
                      // ),

                      MultiSelectDialogField(
                        items: provider.genreDataList,
                        title: Text("Select Genre"),
                        selectedColor: Colors.blue,
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: Colors.blue,
                            width: 2,
                          ),
                        ),
                        buttonIcon: Icon(
                          Icons.arrow_downward,
                          color: Colors.blue,
                        ),
                        buttonText: Text(
                          "Enter Genre",
                          style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: 16,
                          ),
                        ),
                        onConfirm: (results) {
                          provider.requiredDataToUplaodVideoAsStremer['genre'] =
                              results.toString();
                          print(results); //_selectedAnimals = results;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        onSaved: (value) {
                          provider.requiredDataToUplaodVideoAsStremer[
                              'description'] = value.toString();
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: CommonTheme.commonContainerColor,
                          border: CommonTheme.border,
                          focusedBorder: CommonTheme.placeadfocusedBorder,
                          hintText: 'Enter Description',
                          hintStyle: hintTextStyle,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Description';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  )),
              CommonButton(
                color: CommonTheme.buttonColor,
                text: 'Next',
                type: 'common',
                textColor: Colors.white,
                methodName: btnNext,
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
