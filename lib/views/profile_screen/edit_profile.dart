import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:giantslayer/theme/common_button.dart';
import 'package:giantslayer/theme/common_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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

  String defaultCountry = '';
  final List country = [
    {'id': '1', 'item': 'India'},
    {'id': '2', 'item': 'China'},
    {'id': '3', 'item': 'England'},
  ];

  String defaultStates = '';
  final List states = [
    {'id': '1', 'item': 'States'},
    {'id': '2', 'item': 'States'},
    {'id': '3', 'item': 'States'},
  ];

  String defaultGender = '';
  final List gender = [
    {'id': '1', 'item': 'Male'},
    {'id': '2', 'item': 'Female'},
    {'id': '3', 'item': 'Other'},
  ];

  String defaultMaritalStatus = '';
  final List maritalStatus = [
    {'id': '1', 'item': 'Married'},
    {'id': '2', 'item': 'Un-Married'},
  ];

  String defaultReligion = '';

  final List religion = [
    {'id': '1', 'item': 'Buddhism'},
    {'id': '2', 'item': 'Christianity'},
    {'id': '3', 'item': 'Hinduism'},
    {'id': '4', 'item': 'Islam'},
    {'id': '5', 'item': 'Jainism'},
  ];

  var address = 'Address';
  void getAddressFromLongitudeLatitude(context) async {
    bool serviceEnabled;
    LocationPermission permission;
    print('Get location');
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Padding(
            padding: const EdgeInsets.all(0.0),
            child: SizedBox(
              height: 35,
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Center(
                    child: CircularProgressIndicator.adaptive(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                        Color(0xFFF903E3),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Please wait...',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    var result = await Geolocator.getCurrentPosition();
    print('Result $result');

    var latitude = result.latitude;
    print('Latitude is $latitude');

    var longitude = result.longitude;
    print('Longitude is $longitude');

    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);

    var city = placemarks[0].locality;
    var state = placemarks[0].administrativeArea;
    var country = placemarks[0].country;
    // postcode = placemarks[0].postalCode;
    setState(() {
      address = '$city, $state, $country';
    });

    Navigator.pop(context);
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController totalEarning = TextEditingController();
  TextEditingController contactNumber = TextEditingController();
  TextEditingController enableLocation = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController occupation = TextEditingController();
  TextEditingController salary = TextEditingController();
  TextEditingController addresses = TextEditingController();
  void saveProfile() {
    if (formKey.currentState!.validate()) {
      Map userEditProfileData = {
        'name': name.text,
        'lastName': lastName.text,
        'country': defaultCountry,
        'state': defaultStates,
        'totalEarning': totalEarning.text,
        'contactNumber': contactNumber.text,
        'enableLocation': enableLocation.text,
        'age': age.text,
        'gender': defaultGender,
        'maritalStatus': defaultMaritalStatus,
        'occupation': occupation.text,
        'salary': salary.text,
        'religion': defaultReligion,
        'address': address,
      };
      print('userEditProfileData $userEditProfileData');
    }
  }

  bool saveAd = false;
  bool earnMoney = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonTheme.appBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Edit Profile'),
      ),
      body: Column(
        children: [
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
                                    image: AssetImage('assets/images/girl.png'),
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
          Text(
            'James',
            style: GoogleFonts.urbanist(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Form(
            key: formKey,
            child: Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      TextFormField(
                        style: CommonTheme.textHint,
                        controller: name,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: CommonTheme.commonContainerColor,
                          border: CommonTheme.border,
                          focusedBorder: CommonTheme.focusedBorder,
                          errorBorder: CommonTheme.errorBorder,
                          hintText: 'Name',
                          hintStyle: CommonTheme.textHint,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: CommonTheme.textHint,
                        controller: lastName,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: CommonTheme.commonContainerColor,
                          border: CommonTheme.border,
                          focusedBorder: CommonTheme.focusedBorder,
                          errorBorder: CommonTheme.errorBorder,
                          hintText: 'Last Name',
                          hintStyle: CommonTheme.textHint,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
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
                          color: CommonTheme.commonContainerColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: DropdownButton<String>(
                          underline: SizedBox(),
                          value: defaultCountry,
                          icon: Icon(Icons.keyboard_arrow_down_rounded),
                          isExpanded: true,
                          dropdownColor: CommonTheme.commonContainerColor,
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                'Select Country',
                                style: CommonTheme.textHint,
                              ),
                              value: '',
                            ),
                            ...country.map<DropdownMenuItem<String>>((e) {
                              return DropdownMenuItem(
                                child: Text(
                                  e['item'],
                                  style: GoogleFonts.urbanist(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                value: e['id'],
                              );
                            }).toList(),
                          ],
                          onChanged: (value) {
                            setState(() {
                              defaultCountry = value!;
                            });
                          },
                        ),
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
                          color: CommonTheme.commonContainerColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: DropdownButton<String>(
                          underline: SizedBox(),
                          value: defaultStates,
                          icon: Icon(Icons.keyboard_arrow_down_rounded),
                          isExpanded: true,
                          dropdownColor: CommonTheme.commonContainerColor,
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                'Select State',
                                style: CommonTheme.textHint,
                              ),
                              value: '',
                            ),
                            ...states.map<DropdownMenuItem<String>>((e) {
                              return DropdownMenuItem(
                                child: Text(
                                  e['item'],
                                  style: GoogleFonts.urbanist(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                value: e['id'],
                              );
                            }).toList(),
                          ],
                          onChanged: (value) {
                            setState(() {
                              defaultStates = value!;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: CommonTheme.textHint,
                        controller: totalEarning,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: CommonTheme.commonContainerColor,
                          border: CommonTheme.border,
                          focusedBorder: CommonTheme.focusedBorder,
                          errorBorder: CommonTheme.errorBorder,
                          hintText: 'Total Earning',
                          hintStyle: CommonTheme.textHint,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your total earning';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: CommonTheme.textHint,
                        controller: contactNumber,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: CommonTheme.commonContainerColor,
                          border: CommonTheme.border,
                          focusedBorder: CommonTheme.focusedBorder,
                          errorBorder: CommonTheme.errorBorder,
                          hintText: 'Contact Number',
                          hintStyle: CommonTheme.textHint,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your contact number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          child: TextFormField(
                            style: CommonTheme.textHint,
                            enabled: false,
                            controller: enableLocation,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: CommonTheme.commonContainerColor,
                              border: CommonTheme.border,
                              focusedBorder: CommonTheme.focusedBorder,
                              hintText: 'Enable Location',
                              hintStyle: CommonTheme.textHint,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: CommonTheme.textHint,
                        controller: age,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: CommonTheme.commonContainerColor,
                          border: CommonTheme.border,
                          focusedBorder: CommonTheme.focusedBorder,
                          errorBorder: CommonTheme.errorBorder,
                          hintText: 'Enter Age',
                          hintStyle: CommonTheme.textHint,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your age';
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
                          color: CommonTheme.commonContainerColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: DropdownButton<String>(
                          underline: SizedBox(),
                          value: defaultGender,
                          icon: Icon(Icons.keyboard_arrow_down_rounded),
                          isExpanded: true,
                          dropdownColor: CommonTheme.commonContainerColor,
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                'Select Gender',
                                style: CommonTheme.textHint,
                              ),
                              value: '',
                            ),
                            ...gender.map<DropdownMenuItem<String>>((e) {
                              return DropdownMenuItem(
                                child: Text(
                                  e['item'],
                                  style: GoogleFonts.urbanist(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                value: e['id'],
                              );
                            }).toList(),
                          ],
                          onChanged: (value) {
                            setState(() {
                              defaultGender = value!;
                            });
                          },
                        ),
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
                          color: CommonTheme.commonContainerColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: DropdownButton<String>(
                          underline: SizedBox(),
                          value: defaultMaritalStatus,
                          icon: Icon(Icons.keyboard_arrow_down_rounded),
                          isExpanded: true,
                          dropdownColor: CommonTheme.commonContainerColor,
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                'Select Marital Status',
                                style: CommonTheme.textHint,
                              ),
                              value: '',
                            ),
                            ...maritalStatus.map<DropdownMenuItem<String>>((e) {
                              return DropdownMenuItem(
                                child: Text(
                                  e['item'],
                                  style: GoogleFonts.urbanist(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                value: e['id'],
                              );
                            }).toList(),
                          ],
                          onChanged: (value) {
                            setState(() {
                              defaultMaritalStatus = value!;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: CommonTheme.textHint,
                        controller: occupation,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: CommonTheme.commonContainerColor,
                          border: CommonTheme.border,
                          focusedBorder: CommonTheme.focusedBorder,
                          errorBorder: CommonTheme.errorBorder,
                          hintText: 'Student/ Working',
                          hintStyle: CommonTheme.textHint,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your occupation';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: CommonTheme.textHint,
                        controller: salary,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: CommonTheme.commonContainerColor,
                          border: CommonTheme.border,
                          focusedBorder: CommonTheme.focusedBorder,
                          errorBorder: CommonTheme.errorBorder,
                          hintText: 'Salary',
                          hintStyle: CommonTheme.textHint,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your salary';
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
                          color: CommonTheme.commonContainerColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: DropdownButton<String>(
                          underline: SizedBox(),
                          value: defaultReligion,
                          icon: Icon(Icons.keyboard_arrow_down_rounded),
                          isExpanded: true,
                          dropdownColor: CommonTheme.commonContainerColor,
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                'Religion',
                                style: CommonTheme.textHint,
                              ),
                              value: '',
                            ),
                            ...religion.map<DropdownMenuItem<String>>((e) {
                              return DropdownMenuItem(
                                child: Text(
                                  e['item'],
                                  style: GoogleFonts.urbanist(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                value: e['id'],
                              );
                            }).toList(),
                          ],
                          onChanged: (value) {
                            setState(() {
                              defaultReligion = value!;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     getAddressFromLongitudeLatitude(context);
                      //   },
                      //   child: Container(
                      //     child: TextFormField(
                      //       style: CommonTheme.textHint,
                      //       controller: addresses,
                      //       enabled: false,
                      //       decoration: InputDecoration(
                      //         filled: true,
                      //         fillColor: CommonTheme.commonContainerColor,
                      //         border: CommonTheme.border,
                      //         focusedBorder: CommonTheme.focusedBorder,
                      //         hintText: 'Address',
                      //         hintStyle: CommonTheme.textFieldHintText,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      GestureDetector(
                        onTap: () {
                          getAddressFromLongitudeLatitude(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 20,
                          ),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: CommonTheme.commonContainerColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            address,
                            style: address == 'Address'
                                ? CommonTheme.textHint
                                : GoogleFonts.urbanist(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Text(
                            'Saved Ads',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Switch(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            activeColor: Colors.white,
                            inactiveTrackColor:
                                CommonTheme.commonContainerColor,
                            activeTrackColor: CommonTheme.buttonColor,
                            value: saveAd,
                            onChanged: (value) {
                              setState(() {
                                saveAd = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Want to earn money',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Switch(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            activeColor: Colors.white,
                            inactiveTrackColor:
                                CommonTheme.commonContainerColor,
                            activeTrackColor: CommonTheme.buttonColor,
                            value: earnMoney,
                            onChanged: (value) {
                              setState(() {
                                earnMoney = value;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      CommonButton(
                        color: CommonTheme.buttonColor,
                        text: 'Save',
                        type: 'common',
                        textColor: Colors.white,
                        methodName: saveProfile,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
