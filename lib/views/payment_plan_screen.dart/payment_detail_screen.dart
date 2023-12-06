import 'package:flutter/material.dart';
import 'package:giantslayer/theme/common_button.dart';
import 'package:giantslayer/theme/common_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentDetailScreen extends StatelessWidget {
  const PaymentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final offerText = GoogleFonts.urbanist(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    );
    final commonAmountText = GoogleFonts.urbanist(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    );
    void dialogBox() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.only(
              top: 30,
              bottom: 30,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(36),
            ),
            backgroundColor: Color(0xFF1F222A),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/confirm_payment.png',
                  width: 150,
                  height: 150,
                ),
                Text(
                  'Congratulations!',
                  style: GoogleFonts.urbanist(
                    color: CommonTheme.buttonColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                textAlign: TextAlign.center,
                'Your account is ready to use you will be redirected to the Home Page in a few sconds',
                style: GoogleFonts.urbanist(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          );
        },
      );
    }

    void confirmPayment() {
      dialogBox();
    }

    return Scaffold(
      backgroundColor: CommonTheme.appBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CommonTheme.appBackgroundColor,
        title: Text(
          'Payment Details',
          style: CommonTheme.appbarTitle,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
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
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 28),
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: CommonTheme.commonContainerColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Amount',
                                style: commonAmountText,
                              ),
                              Text(
                                '\$9.99',
                                style: commonAmountText,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Tax',
                                style: commonAmountText,
                              ),
                              Text(
                                '\$1.99',
                                style: commonAmountText,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Color(0xFF35383F),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: commonAmountText,
                              ),
                              Text(
                                '\$9.99',
                                style: commonAmountText,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CommonButton(
                  color: CommonTheme.buttonColor,
                  text: 'Confirm Payment',
                  type: 'common',
                  textColor: Colors.white,
                  methodName: confirmPayment,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
