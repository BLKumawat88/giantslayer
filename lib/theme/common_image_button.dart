import 'package:flutter/material.dart';
import 'package:giantslayer/theme/common_theme.dart';

class CommonImageButton extends StatelessWidget {
  final Color color;
  final String text;
  final String image;
  final String type;
  final Color textColor;

  final Function methodName;

  const CommonImageButton(
      {super.key,
      required this.color,
      required this.text,
      required this.image,
      required this.type,
      required this.textColor,
      required this.methodName});

  @override
  Widget build(BuildContext context) {
    return type == 'common'
        ? InkWell(
            onTap: () {
              methodName();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  16,
                ),
                color: color,
              ),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    image,
                    width: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: Text(
                      text,
                      style: CommonTheme.socialLoginButtonText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  //myIcon,
                ],
              ),
            ),
          )
        : Center(
            child: InkWell(
              onTap: () {
                methodName();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  color: color,
                ),
                height: 55,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        text,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    //myIcon,
                  ],
                ),
              ),
            ),
          );
  }
}
