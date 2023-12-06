import 'package:flutter/material.dart';

class CommonIconButton extends StatelessWidget {
  final Color color;
  final String text;
  final Icon myIcon;
  final String type;
  final Color textColor;

  final Function methodName;

  const CommonIconButton(
      {super.key,
      required this.color,
      required this.text,
      required this.myIcon,
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
                  100,
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
          )
        : Center(
            child: InkWell(
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
