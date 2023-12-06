import 'package:flutter/material.dart';
import 'package:giantslayer/controller/all_in_controller.dart';
import 'package:giantslayer/dialog_loading/common_dialog.dart';
import 'package:giantslayer/theme/common_button.dart';
import 'package:giantslayer/theme/common_theme.dart';
import 'package:giantslayer/views/streamer_screens/stream_screen/stream_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UploadVideoScreen extends StatefulWidget {
  const UploadVideoScreen({super.key});

  @override
  State<UploadVideoScreen> createState() => _UploadVideoScreenState();
}

class _UploadVideoScreenState extends State<UploadVideoScreen> {
  String defaultAdSlotsValue = '';
  final List dropdownAdSlotsItems = [
    {'id': '1', 'item': '1'},
    {'id': '2', 'item': '2'},
    {'id': '3', 'item': '3'},
    {'id': '4', 'item': '4'},
    {'id': '5', 'item': '5'},
  ];

  String defaultChoosePlanValue = '';
  final List dropdownChoosePlanItems = [
    {'id': 'ppv', 'item': 'PPV'},
  ];

  String defaultSelectPlanType = ''; //Select Plan Type
  final List dropdowndefaultSelectPlanType = [
    {'id': '1', 'item': 'One time view'},
    {'id': '2', 'item': 'Seven days'},
    {'id': '3', 'item': 'Monthly'},
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
  final price = GoogleFonts.urbanist(
    fontSize: 22,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );
  String selected = 'selected';
  void choosePlan() {}

  TextEditingController msgToViewer = TextEditingController();
  TextEditingController planPrice = TextEditingController();

  void askForApproval() {
    AllInController provider = Provider.of(context, listen: false);
    print("Ask for approval called $defaultChoosePlanValue");
    if (defaultAdSlotsValue == '') {
      CommanDialog.showSnakeBar("Please select no of ad slots", context);
    } else if (defaultChoosePlanValue == '') {
      CommanDialog.showSnakeBar("Please choose plan type", context);
    } else if (msgToViewer.text == '') {
      CommanDialog.showSnakeBar("Massage to viewer required", context);
    } else if (planPrice.text == '') {
      CommanDialog.showSnakeBar("Plan price required", context);
    } else if (defaultSelectPlanType == '') {
      CommanDialog.showSnakeBar("Select Type required", context);
    } else {
      provider.requiredDataToUplaodVideoAsStremer['ad_slots'] =
          defaultAdSlotsValue;

      provider.requiredDataToUplaodVideoAsStremer['plan_type'] =
          defaultChoosePlanValue;
      provider.requiredDataToUplaodVideoAsStremer['plan_title'] =
          msgToViewer.text;
      provider.requiredDataToUplaodVideoAsStremer['plan_price'] =
          planPrice.text;
      provider.requiredDataToUplaodVideoAsStremer['ppv_plan_type'] =
          defaultSelectPlanType;

      provider.uploadStremerData(context);
    }

    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return AlertDialog(
    //       backgroundColor: CommonTheme.commonContainerColor,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(36),
    //       ),
    //       actions: [
    //         Column(
    //           children: [
    //             Padding(
    //               padding: const EdgeInsets.only(top: 10),
    //               child: Text(
    //                 'Choose Plans',
    //                 style: GoogleFonts.inter(
    //                   fontSize: 20,
    //                   color: Colors.white,
    //                   fontWeight: FontWeight.w700,
    //                 ),
    //               ),
    //             ),
    //             Container(
    //               padding: EdgeInsets.symmetric(
    //                 horizontal: 25,
    //                 vertical: 20,
    //               ),
    //               margin: EdgeInsets.symmetric(
    //                 vertical: 10,
    //               ),
    //               width: MediaQuery.of(context).size.width,
    //               decoration: BoxDecoration(
    //                 image: DecorationImage(
    //                   image: AssetImage(
    //                     'assets/images/play_container.png',
    //                   ),
    //                 ),
    //               ),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Text(
    //                         '5',
    //                         style: GoogleFonts.urbanist(
    //                           fontSize: 18,
    //                           color: Colors.white,
    //                           fontWeight: FontWeight.w700,
    //                         ),
    //                       ),
    //                       Padding(
    //                         padding: const EdgeInsets.only(top: 4),
    //                         child: Text(
    //                           'Days',
    //                           style: GoogleFonts.urbanist(
    //                             fontSize: 16,
    //                             color: Colors.white,
    //                             fontWeight: FontWeight.w500,
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                   Row(
    //                     children: [
    //                       Text(
    //                         '\$10',
    //                         style: GoogleFonts.urbanist(
    //                           fontSize: 22,
    //                           color: Colors.white,
    //                           fontWeight: FontWeight.w700,
    //                         ),
    //                       ),
    //                       Radio(
    //                         materialTapTargetSize:
    //                             MaterialTapTargetSize.shrinkWrap,
    //                         fillColor: MaterialStateProperty.all(
    //                           CommonTheme.buttonColor,
    //                         ),
    //                         toggleable: true,
    //                         value: 'unselected',
    //                         groupValue: selected,
    //                         onChanged: (value) {
    //                           setState(() {
    //                             selected = value.toString();
    //                           });
    //                           print(value);
    //                         },
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Container(
    //               padding: EdgeInsets.symmetric(
    //                 horizontal: 25,
    //                 vertical: 20,
    //               ),
    //               width: MediaQuery.of(context).size.width,
    //               decoration: BoxDecoration(
    //                 image: DecorationImage(
    //                   image: AssetImage(
    //                     'assets/images/play_container.png',
    //                   ),
    //                 ),
    //               ),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Text(
    //                         '10',
    //                         style: GoogleFonts.urbanist(
    //                           fontSize: 18,
    //                           color: Colors.white,
    //                           fontWeight: FontWeight.w700,
    //                         ),
    //                       ),
    //                       Padding(
    //                         padding: const EdgeInsets.only(top: 4),
    //                         child: Text(
    //                           'Days',
    //                           style: GoogleFonts.urbanist(
    //                             fontSize: 16,
    //                             color: Colors.white,
    //                             fontWeight: FontWeight.w500,
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                   Row(
    //                     children: [
    //                       Text(
    //                         '\$10',
    //                         style: GoogleFonts.urbanist(
    //                           fontSize: 22,
    //                           color: Colors.white,
    //                           fontWeight: FontWeight.w700,
    //                         ),
    //                       ),
    //                       Radio(
    //                         materialTapTargetSize:
    //                             MaterialTapTargetSize.shrinkWrap,
    //                         fillColor: MaterialStateProperty.all(
    //                           CommonTheme.buttonColor,
    //                         ),
    //                         toggleable: true,
    //                         value: 'unselected',
    //                         groupValue: selected,
    //                         onChanged: (value) {
    //                           setState(() {
    //                             selected = value.toString();
    //                           });
    //                           print(value);
    //                         },
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.only(
    //                 top: 50,
    //                 left: 20,
    //                 right: 20,
    //                 bottom: 20,
    //               ),
    //               child: CommonButton(
    //                 color: CommonTheme.buttonColor,
    //                 text: 'Choose Plan',
    //                 type: 'common',
    //                 textColor: Colors.white,
    //                 methodName: choosePlan,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ],
    //     );
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonTheme.appBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF1F222A),
        title: Text('Upload Video'),
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
                    horizontal: 10,
                    vertical: 20,
                  ),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: CommonTheme.commonContainerColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: CommonTheme.buttonColor,
                              shape: BoxShape.circle,
                            ),
                            child: ImageIcon(
                              color: Colors.white,
                              AssetImage('assets/images/edit.png'),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/images/place_add.png',
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width / 2.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Lost In Space',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 5,
                          right: 5,
                        ),
                        child: Text(
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          'The mission to save Scarecrow takes an unexpected turn, '
                          'throwing the Resolute into chaos. Judy hatches a plan to get a ship to Alpha Centauri.',
                          style: GoogleFonts.urbanist(
                            fontSize: 14,
                            color: Color(0xFF9E9E9E),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                          left: 5,
                          right: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Type',
                                  style: GoogleFonts.urbanist(
                                    fontSize: 14,
                                    color: Color(0xFF9E9E9E),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    'Tv Shows',
                                    style: GoogleFonts.urbanist(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Episode Runtime',
                                  style: GoogleFonts.urbanist(
                                    fontSize: 14,
                                    color: Color(0xFF9E9E9E),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    '56 min',
                                    style: GoogleFonts.urbanist(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 20,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Genre',
                            style: GoogleFonts.urbanist(
                              fontSize: 14,
                              color: Color(0xFF9E9E9E),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 20,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            'Action & Adventure, Sci-Fi & Fantasy, Drama',
                            style: GoogleFonts.urbanist(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                  value: defaultAdSlotsValue,
                  isExpanded: true,
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Color(0xFF9E9E9E),
                  ),
                  items: [
                    DropdownMenuItem(
                      child: Text(
                        'Select Ad Slots',
                        style: CommonTheme.textHint,
                      ),
                      value: '',
                    ),
                    ...dropdownAdSlotsItems.map<DropdownMenuItem<String>>((e) {
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
                  value: defaultChoosePlanValue,
                  isExpanded: true,
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Color(0xFF9E9E9E),
                  ),
                  items: [
                    DropdownMenuItem(
                      child: Text(
                        'Choose Plans',
                        style: CommonTheme.textHint,
                      ),
                      value: '',
                    ),
                    ...dropdownChoosePlanItems
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
                      defaultChoosePlanValue = value!;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),

              defaultChoosePlanValue != ''
                  ? Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Create Plan',
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
                        TextFormField(
                          controller: msgToViewer,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: CommonTheme.commonContainerColor,
                            border: CommonTheme.border,
                            focusedBorder: CommonTheme.placeadfocusedBorder,
                            hintText: 'Message to Viewer',
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
                          height: 20,
                        ),
                        TextFormField(
                          controller: planPrice,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: CommonTheme.commonContainerColor,
                            border: CommonTheme.border,
                            focusedBorder: CommonTheme.placeadfocusedBorder,
                            hintText: 'Price',
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
                            value: defaultSelectPlanType,
                            isExpanded: true,
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Color(0xFF9E9E9E),
                            ),
                            items: [
                              DropdownMenuItem(
                                child: Text(
                                  'Select Plan Type',
                                  style: CommonTheme.textHint,
                                ),
                                value: '',
                              ),
                              ...dropdowndefaultSelectPlanType
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
                                defaultSelectPlanType = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    )
                  : SizedBox(),

              // ...uploadVideo.map(
              //   (e) {
              //     return Container(
              //       padding: EdgeInsets.symmetric(
              //         horizontal: 25,
              //       ),
              //       margin: EdgeInsets.symmetric(
              //         vertical: 10,
              //       ),
              //       width: MediaQuery.of(context).size.width,
              //       decoration: BoxDecoration(
              //         image: DecorationImage(
              //           image: AssetImage(
              //             'assets/images/tracks.png',
              //           ),
              //         ),
              //       ),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Padding(
              //             padding: const EdgeInsets.symmetric(vertical: 4),
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text(
              //                   'Plan 1',
              //                   style: title,
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsets.only(top: 1),
              //                   child: Text(
              //                     e.plan,
              //                     style: subtitle,
              //                   ),
              //                 ),
              //                 SizedBox(
              //                   height: 5,
              //                 ),
              //                 Text(
              //                   'Users',
              //                   style: title,
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsets.only(top: 1),
              //                   child: Text(
              //                     e.users,
              //                     style: subtitle,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //           Column(
              //             children: [
              //               Text(
              //                 '\$${e.price}',
              //                 style: price,
              //               ),
              //               Radio(
              //                 materialTapTargetSize:
              //                     MaterialTapTargetSize.shrinkWrap,
              //                 fillColor: MaterialStateProperty.all(
              //                   CommonTheme.buttonColor,
              //                 ),
              //                 toggleable: true,
              //                 value: 'selected',
              //                 groupValue: e.radioButtonValue,
              //                 onChanged: (value) {
              //                   setState(() {
              //                     e.radioButtonValue = value.toString();
              //                   });
              //                   print(value);
              //                 },
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     );
              //   },
              // ).toList(),
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
    );
  }
}
