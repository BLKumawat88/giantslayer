import 'package:flutter/material.dart';
import 'package:giantslayer/controller/all_in_controller.dart';
import 'package:giantslayer/theme/common_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaymentPlanScreen extends StatefulWidget {
  const PaymentPlanScreen({super.key});

  @override
  State<PaymentPlanScreen> createState() => _PaymentPlanScreenState();
}

class _PaymentPlanScreenState extends State<PaymentPlanScreen> {
  int currentIndex = 0;
  final subscribeText = GoogleFonts.urbanist(
    fontSize: 32,
    color: CommonTheme.buttonColor,
    fontWeight: FontWeight.w700,
  );
  final subscribeSubText = GoogleFonts.urbanist(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
  final planText = GoogleFonts.urbanist(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
  final offerText = GoogleFonts.urbanist(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
  @override
  Widget build(BuildContext context) {
    AllInController provider = Provider.of(context, listen: false);
    return Scaffold(
      backgroundColor: CommonTheme.appBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CommonTheme.appBackgroundColor,
      ),
      body: Column(
        children: [
          Text(
            'Subscribe to Premium',
            style: subscribeText,
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              textAlign: TextAlign.center,
              'Enjoy watching Full-HD movies, without restrictions and without ads',
              style: subscribeSubText,
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                  child: Text(
                    'Basic Plan',
                    style: planText,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 1;
                    });
                  },
                  child: Text(
                    'Premium Plan',
                    style: planText,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width / 2,
                color: currentIndex == 0
                    ? CommonTheme.buttonColor
                    : Color(0xFF1F222A),
              ),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width / 2,
                color: currentIndex == 1
                    ? CommonTheme.buttonColor
                    : Color(0xFF1F222A),
              ),
            ],
          ),
          currentIndex == 0
              ? Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        ...provider.planList
                            .map(
                              (data) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Container(
                                  padding: EdgeInsets.only(
                                    top: 25,
                                    bottom: 25,
                                  ),
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: CommonTheme.commonContainerColor,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: CommonTheme.buttonColor,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/tv.png',
                                        width: 50,
                                      ),
                                      Text(
                                        '${data['title']}',
                                        style: GoogleFonts.libreCaslonText(
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: '\$ ${data['price']}',
                                          style: GoogleFonts.urbanist(
                                            fontSize: 32,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: ' /${data['time_type']}',
                                              style: GoogleFonts.urbanist(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Divider(
                                        thickness: 1,
                                        indent: 25,
                                        endIndent: 25,
                                        color: Color(0xFF35383F),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 30),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 20),
                                              child: Icon(
                                                Icons.check,
                                                color: CommonTheme.buttonColor,
                                              ),
                                            ),
                                            Text(
                                              'Watch all you want. Ad-free.',
                                              style: offerText,
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 30),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 20),
                                              child: Icon(
                                                Icons.check,
                                                color: CommonTheme.buttonColor,
                                              ),
                                            ),
                                            Text(
                                              'Allows streaming of 4K.',
                                              style: offerText,
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 30),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 20),
                                              child: Icon(
                                                Icons.check,
                                                color: CommonTheme.buttonColor,
                                              ),
                                            ),
                                            Text(
                                              'Video & Audio Quality is Better.',
                                              style: offerText,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  ),
                )
              : Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 25,
                            bottom: 25,
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: CommonTheme.commonContainerColor,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: CommonTheme.buttonColor,
                            ),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/tv.png',
                                width: 50,
                              ),
                              Text(
                                'FREETV',
                                style: GoogleFonts.libreCaslonText(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: '\$9.99',
                                  style: GoogleFonts.urbanist(
                                    fontSize: 32,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ' /month',
                                      style: GoogleFonts.urbanist(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(
                                thickness: 1,
                                indent: 25,
                                endIndent: 25,
                                color: Color(0xFF35383F),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.check,
                                        color: CommonTheme.buttonColor,
                                      ),
                                    ),
                                    Text(
                                      'Watch all you want. Ad-free.',
                                      style: offerText,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.check,
                                        color: CommonTheme.buttonColor,
                                      ),
                                    ),
                                    Text(
                                      'Allows streaming of 4K.',
                                      style: offerText,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.check,
                                        color: CommonTheme.buttonColor,
                                      ),
                                    ),
                                    Text(
                                      'Video & Audio Quality is Better.',
                                      style: offerText,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 25,
                            bottom: 25,
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: CommonTheme.commonContainerColor,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: CommonTheme.buttonColor,
                            ),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/tv.png',
                                width: 50,
                              ),
                              Text(
                                'FREETV',
                                style: GoogleFonts.libreCaslonText(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: '\$9.99',
                                  style: GoogleFonts.urbanist(
                                    fontSize: 32,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ' /month',
                                      style: GoogleFonts.urbanist(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(
                                thickness: 1,
                                indent: 25,
                                endIndent: 25,
                                color: Color(0xFF35383F),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.check,
                                        color: CommonTheme.buttonColor,
                                      ),
                                    ),
                                    Text(
                                      'Watch all you want. Ad-free.',
                                      style: offerText,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.check,
                                        color: CommonTheme.buttonColor,
                                      ),
                                    ),
                                    Text(
                                      'Allows streaming of 4K.',
                                      style: offerText,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.check,
                                        color: CommonTheme.buttonColor,
                                      ),
                                    ),
                                    Text(
                                      'Video & Audio Quality is Better.',
                                      style: offerText,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 25,
                            bottom: 25,
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: CommonTheme.commonContainerColor,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: CommonTheme.buttonColor,
                            ),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/tv.png',
                                width: 50,
                              ),
                              Text(
                                'FREETV',
                                style: GoogleFonts.libreCaslonText(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: '\$9.99',
                                  style: GoogleFonts.urbanist(
                                    fontSize: 32,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ' /month',
                                      style: GoogleFonts.urbanist(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(
                                thickness: 1,
                                indent: 25,
                                endIndent: 25,
                                color: Color(0xFF35383F),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.check,
                                        color: CommonTheme.buttonColor,
                                      ),
                                    ),
                                    Text(
                                      'Watch all you want. Ad-free.',
                                      style: offerText,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.check,
                                        color: CommonTheme.buttonColor,
                                      ),
                                    ),
                                    Text(
                                      'Allows streaming of 4K.',
                                      style: offerText,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.check,
                                        color: CommonTheme.buttonColor,
                                      ),
                                    ),
                                    Text(
                                      'Video & Audio Quality is Better.',
                                      style: offerText,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
