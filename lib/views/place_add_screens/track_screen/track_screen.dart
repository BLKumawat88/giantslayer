import 'package:flutter/material.dart';
import 'package:giantslayer/model/track_model.dart';
import 'package:giantslayer/theme/common_button.dart';
import 'package:giantslayer/theme/common_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class TrackScreen extends StatefulWidget {
  const TrackScreen({super.key});

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  String defaultRadiusValue = '';
  final List dropdownRadiusItems = [
    {'id': '1', 'item': ''},
    {'id': '2', 'item': ''},
    {'id': '3', 'item': ''},
  ];
  final hintTextStyle = GoogleFonts.urbanist(
    fontSize: 14,
    color: Color(0xFF9E9E9E),
    fontWeight: FontWeight.w400,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
                left: 20,
              ),
              child: Text(
                'Select Location Plan',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ...trackModel.map(
              (e) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 20,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
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
                            e.plan,
                            style: GoogleFonts.urbanist(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              '${e.location} Location',
                              style: GoogleFonts.urbanist(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '\$${e.price}',
                            style: GoogleFonts.urbanist(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
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
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: CommonTheme.commonContainerColor,
                  border: CommonTheme.border,
                  focusedBorder: CommonTheme.placeadfocusedBorder,
                  hintText: 'Enter Location',
                  hintStyle: hintTextStyle,
                ),
              ),
            ),
            // Container(
            //   padding: EdgeInsets.symmetric(
            //     horizontal: 20,
            //     vertical: 20,
            //   ),
            //   margin: EdgeInsets.symmetric(horizontal: 20),
            //   width: MediaQuery.of(context).size.width,
            //   decoration: BoxDecoration(
            //     color: Color(0xFF1F222A),
            //     borderRadius: BorderRadius.circular(15),
            //   ),
            //   child: Text(
            //     'Enter Loaction',
            //     style: hintTextStyle,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      'Add More',
                      style: GoogleFonts.urbanist(
                        fontSize: 14,
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
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CommonTheme.buttonColor,
                  ),
                ),
                child: Text(
                  'Price/user= \$1',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: CommonTheme.buttonColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 5,
              ),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: CommonTheme.commonContainerColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: DropdownButton<String>(
                underline: SizedBox(),
                value: defaultRadiusValue,
                isExpanded: true,
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Color(0xFF9E9E9E),
                ),
                items: [
                  DropdownMenuItem(
                    child: Text(
                      'Select Radius',
                      style: hintTextStyle,
                    ),
                    value: '',
                  ),
                  ...dropdownRadiusItems.map<DropdownMenuItem<String>>((e) {
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
                    defaultRadiusValue = value!;
                  });
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                maxLines: 2,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: CommonTheme.commonContainerColor,
                  border: CommonTheme.border,
                  focusedBorder: CommonTheme.placeadfocusedBorder,
                  hintText: 'Radius Message',
                  hintStyle: hintTextStyle,
                ),
              ),
            ),
            // Container(
            //   padding: EdgeInsets.symmetric(
            //     horizontal: 20,
            //     vertical: 25,
            //   ),
            //   margin: EdgeInsets.symmetric(horizontal: 20),
            //   width: MediaQuery.of(context).size.width,
            //   decoration: BoxDecoration(
            //     color: Color(0xFF1F222A),
            //     borderRadius: BorderRadius.circular(15),
            //   ),
            //   child: Text(
            //     'Radius Massage',
            //     style: hintTextStyle,
            //   ),
            // ),
            SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Please scan the QR CODE while entering',
                style: GoogleFonts.urbanist(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(
                  'assets/images/qrcode.png',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              margin: EdgeInsets.symmetric(horizontal: 100),
              decoration: BoxDecoration(
                border: Border.all(
                  color: CommonTheme.buttonColor,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.share,
                          color: CommonTheme.buttonColor,
                        ),
                      ),
                      Text(
                        'Share Code',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: CommonTheme.buttonColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      'Share with Store Manager',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: CommonTheme.commonContainerColor,
                  border: CommonTheme.border,
                  focusedBorder: CommonTheme.placeadfocusedBorder,
                  hintText: 'QR Code Message',
                  hintStyle: hintTextStyle,
                ),
              ),
            ),
            // Container(
            //   padding: EdgeInsets.symmetric(
            //     horizontal: 20,
            //     vertical: 20,
            //   ),
            //   margin: EdgeInsets.symmetric(horizontal: 20),
            //   width: MediaQuery.of(context).size.width,
            //   decoration: BoxDecoration(
            //     color: Color(0xFF1F222A),
            //     borderRadius: BorderRadius.circular(15),
            //   ),
            //   child: Text(
            //     'QR Code Massage',
            //     style: hintTextStyle,
            //   ),
            // ),
            SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Please scan the QR CODE purchase',
                style: GoogleFonts.urbanist(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(
                  'assets/images/qrcode.png',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              margin: EdgeInsets.symmetric(horizontal: 100),
              decoration: BoxDecoration(
                border: Border.all(
                  color: CommonTheme.buttonColor,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.share,
                          color: CommonTheme.buttonColor,
                        ),
                      ),
                      Text(
                        'Share Code',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: CommonTheme.buttonColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      'Share with Store Manager',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: CommonTheme.commonContainerColor,
                  border: CommonTheme.border,
                  focusedBorder: CommonTheme.placeadfocusedBorder,
                  hintText: 'QR Code Message',
                  hintStyle: hintTextStyle,
                ),
              ),
            ),
            // Container(
            //   padding: EdgeInsets.symmetric(
            //     horizontal: 20,
            //     vertical: 20,
            //   ),
            //   margin: EdgeInsets.symmetric(horizontal: 20),
            //   width: MediaQuery.of(context).size.width,
            //   decoration: BoxDecoration(
            //     color: Color(0xFF1F222A),
            //     borderRadius: BorderRadius.circular(15),
            //   ),
            //   child: Text(
            //     'QR Code Massage',
            //     style: hintTextStyle,
            //   ),
            // ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
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
    );
  }
}
