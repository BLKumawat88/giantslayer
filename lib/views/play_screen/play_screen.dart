import 'package:flutter/material.dart';
import 'package:giantslayer/model/pay_per_view_model.dart';
import 'package:giantslayer/model/play_model.dart';
import 'package:giantslayer/theme/common_button.dart';
import 'package:giantslayer/theme/common_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class PlayScreen extends StatefulWidget {
  PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  final movieName = GoogleFonts.inter(
    fontSize: 22,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  final genereTitle = GoogleFonts.inter(
    fontSize: 12,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  final description = GoogleFonts.inter(
    fontSize: 12,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );

  final youMayAlsoLike = GoogleFonts.inter(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  final more = GoogleFonts.inter(
    fontSize: 14,
    color: CommonTheme.buttonColor,
    fontWeight: FontWeight.w600,
  );
  final radioButtonText = GoogleFonts.inter(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  final String share = 'GiantSlayer';
  String selected = 'selected';
  String surveyValue = 'selected';

  void play() {
    showModalBottomSheet(
      backgroundColor: Color(0xFF1F222A),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      enableDrag: true,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height / 1.5,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                width: 35,
                height: 2,
                color: Color(0xFF35383F),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          'PPV (Pay per view)',
                          style: GoogleFonts.urbanist(
                            fontSize: 22,
                            color: CommonTheme.buttonColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        indent: 20,
                        endIndent: 20,
                        color: Color(0xFF35383F),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        'assets/images/avenger.png',
                        width: MediaQuery.of(context).size.width / 2.8,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Avengers Infinty War',
                        style: GoogleFonts.urbanist(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ...payPerViewModel.map(
                        (e) {
                          return InkWell(
                            onTap: () {
                              advertisementDialog();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 10,
                              ),
                              margin: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/images/play_container.png',
                                  ),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.days,
                                    style: GoogleFonts.urbanist(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          e.description,
                                          style: GoogleFonts.roboto(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
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
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            fillColor:
                                                MaterialStateProperty.all(
                                              CommonTheme.buttonColor,
                                            ),
                                            toggleable: true,
                                            value: 'selected',
                                            groupValue: selected,
                                            onChanged: (value) {
                                              setState(() {
                                                selected = value.toString();
                                              });
                                              print(value);
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ).toList(),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void advertisementDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          backgroundColor: Color(0xFF1F222A),
          title: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Image.asset(
              'assets/images/advertisement.png',
              width: MediaQuery.of(context).size.width / 2.5,
            ),
          ),
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 30,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CommonTheme.buttonColor,
                  ),
                  onPressed: () {
                    surveyDialog();
                  },
                  child: Text(
                    'Advertisement Start',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  String value = 'selected';
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
            'Start Survey',
            style: GoogleFonts.inter(
              fontSize: 22,
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
              padding: const EdgeInsets.only(
                top: 30,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                        color: Color(0xFF35383F),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Close',
                          style: CommonTheme.commonAuthButtonText,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                        color: CommonTheme.buttonColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Submit',
                          style: CommonTheme.commonAuthButtonText,
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
      extendBodyBehindAppBar: true,
      backgroundColor: CommonTheme.appBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/avengers.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Avengers Infinty war',
                        style: movieName,
                      ),
                      IconButton(
                        onPressed: () {
                          Share.share(
                            share,
                            subject: 'GiantSlayer',
                          );
                        },
                        icon: Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CommonButton(
                  color: CommonTheme.buttonColor,
                  text: 'Play',
                  type: 'common',
                  textColor: Colors.white,
                  methodName: play,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    'Genre Action, Superhero, Science Fiction, Romance, Thriller asdasdads',
                    style: genereTitle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: RichText(
                    text: TextSpan(
                      text:
                          'Lorem ipsum, or lipsum as it is sometimes known, is dummy '
                          'text used in laying out print, graphic or web designs. The passage is attributed to an unknown ',
                      style: description,
                      children: [
                        TextSpan(
                          text: 'View More',
                          style: TextStyle(
                            fontSize: 12,
                            color: CommonTheme.buttonColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'You May Also Like',
                  style: youMayAlsoLike,
                ),
                Text(
                  'More',
                  style: more,
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 15,
                  right: 5,
                ),
                child: Wrap(
                  children: [
                    ...playModel.map(
                      (e) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            right: 10,
                            bottom: 15,
                          ),
                          child: Stack(
                            children: [
                              Image.asset(
                                e.image,
                                width: MediaQuery.of(context).size.width / 3.5,
                              ),
                              Positioned(
                                top: 5,
                                right: 5,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    color: CommonTheme.buttonColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    'Free',
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ).toList(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
