import 'package:flutter/material.dart';
import 'package:giantslayer/theme/common_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});
  static const shadowColor = Color(0xFFCCCCCC);

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final tripleContainerText = GoogleFonts.inter(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
  final tripleContainerPriceText = GoogleFonts.inter(
    fontSize: 12,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );
  final commonTextStyle = GoogleFonts.inter(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
  final progressbarPercentage = GoogleFonts.inter(
    fontSize: 12,
    color: Color(0xFF999999),
    fontWeight: FontWeight.w400,
  );
  final progressbarText = GoogleFonts.inter(
    fontSize: 12,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );
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
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: CommonTheme.buttonColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'View Gender',
                      style: GoogleFonts.urbanist(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: CommonTheme.buttonColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Today',
                      style: GoogleFonts.urbanist(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFF1F222A),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        'assets/images/place_add.png',
                        width: MediaQuery.of(context).size.width / 3.5,
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              'Lost In Space',
                              style: commonTextStyle,
                            ),
                            Text(
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              'The mission to save Scarecrow takes an unexpected turn, '
                              'throwing the Resolute into chaos. Judy hatches a plan to '
                              'get a ship to Alpha Centauri.',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: Color(0xFF8E95A9),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3.5,
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF1F222A),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xFFD1991C),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            'assets/images/analytics_revenue.png',
                            width: 15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'Revenue',
                            style: tripleContainerText,
                          ),
                        ),
                        Text(
                          '\$ 13,500',
                          style: tripleContainerPriceText,
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3.5,
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF1F222A),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xFF61DEED),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            'assets/images/analytics_revenue.png',
                            width: 15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'No of viewer',
                            style: tripleContainerText,
                          ),
                        ),
                        Text(
                          '\$ 13,500',
                          style: tripleContainerPriceText,
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3.5,
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF1F222A),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xFF9267FF),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            'assets/images/analytics_revenue.png',
                            width: 15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'Revenue',
                            style: tripleContainerText,
                          ),
                        ),
                        Text(
                          '\$ 13,500',
                          style: tripleContainerPriceText,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFF1F222A),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Religion',
                      style: commonTextStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: CommonTheme.commonContainerColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gender',
                      style: commonTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Male',
                            style: progressbarText,
                          ),
                          Text(
                            '70%',
                            style: progressbarPercentage,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: LinearPercentIndicator(
                        padding: EdgeInsets.all(0),
                        barRadius: Radius.circular(5),
                        backgroundColor: Color(0xFFD9D9D9),
                        progressColor: Color(0xFF0277BD),
                        percent: .7,
                        animation: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Female',
                            style: progressbarText,
                          ),
                          Text(
                            '50%',
                            style: progressbarPercentage,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: LinearPercentIndicator(
                        padding: EdgeInsets.all(0),
                        barRadius: Radius.circular(5),
                        backgroundColor: Color(0xFFD9D9D9),
                        progressColor: Color(0xFF00AE48),
                        percent: .5,
                        animation: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Other Gender',
                            style: progressbarText,
                          ),
                          Text(
                            '30%',
                            style: progressbarPercentage,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: LinearPercentIndicator(
                        padding: EdgeInsets.all(0),
                        barRadius: Radius.circular(5),
                        backgroundColor: Color(0xFFD9D9D9),
                        progressColor: Colors.pink,
                        percent: .3,
                        animation: true,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: CommonTheme.commonContainerColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Marital Status',
                      style: commonTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Married',
                            style: progressbarText,
                          ),
                          Text(
                            '70%',
                            style: progressbarPercentage,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: LinearPercentIndicator(
                        padding: EdgeInsets.all(0),
                        barRadius: Radius.circular(5),
                        backgroundColor: Color(0xFFD9D9D9),
                        progressColor: Color(0xFF0277BD),
                        percent: .7,
                        animation: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Unmarried',
                            style: progressbarText,
                          ),
                          Text(
                            '50%',
                            style: progressbarPercentage,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: LinearPercentIndicator(
                        padding: EdgeInsets.all(0),
                        barRadius: Radius.circular(5),
                        backgroundColor: Color(0xFFD9D9D9),
                        progressColor: Color(0xFF00AE48),
                        percent: .5,
                        animation: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Other',
                            style: progressbarText,
                          ),
                          Text(
                            '30%',
                            style: progressbarPercentage,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: LinearPercentIndicator(
                        padding: EdgeInsets.all(0),
                        barRadius: Radius.circular(5),
                        backgroundColor: Color(0xFFD9D9D9),
                        progressColor: Colors.pink,
                        percent: .3,
                        animation: true,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: CommonTheme.commonContainerColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Salary',
                      style: commonTextStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: CommonTheme.commonContainerColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Age',
                      style: commonTextStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
