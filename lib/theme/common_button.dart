import 'package:flutter/material.dart';
import 'package:giantslayer/theme/common_theme.dart';

class CommonButton extends StatelessWidget {
  final Color color;
  final String text;
  final String type;
  final Color textColor;

  final Function methodName;

  const CommonButton(
      {super.key,
      required this.color,
      required this.text,
      required this.type,
      required this.textColor,
      required this.methodName});

  @override
  Widget build(BuildContext context) {
    return type == 'common'
        ? GestureDetector(
            onTap: () {
              methodName();
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  100,
                ),
              ),
              elevation: 6,
              shadowColor: Colors.red,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    100,
                  ),
                  color: color,
                ),
                height: 55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: CommonTheme.commonAuthButtonText,
                      textAlign: TextAlign.center,
                    ),
                    //myIcon,
                  ],
                ),
              ),
            ),
          )
        : Center(
            child: GestureDetector(
              onTap: () {
                methodName();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    100,
                  ),
                  color: color,
                ),
                height: 55,
                child: Row(
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    //myIcon,
                  ],
                ),
              ),
            ),
          );
  }
}
