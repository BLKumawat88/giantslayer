import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommanDialog {
  static showLoading(context, {String title = 'Loading...'}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularProgressIndicator.adaptive(
                  // backgroundColor: CommonTheme.buttonBackgrooundCommonColor,
                  ),
              Text(
                title,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        );
      },
    );
  }

  static hideLoading(context) {
    Navigator.pop(context);
  }

  static showErrorDialog(
    context, {
    String title = "Oops Error",
    String description = "Something went wrong ",
  }) {
    showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Center(
              child: Text(
                description,
                style: GoogleFonts.rubik(
                    fontSize: 18, fontWeight: FontWeight.normal),
              ),
            ),
            actions: <Widget>[
              Center(
                child: Container(
                  width: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text(
                      'Okay',
                      style: GoogleFonts.rubik(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ],
          );
        });
  }

  static showSnakeBar(String title, context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        behavior: SnackBarBehavior.fixed,
        dismissDirection: DismissDirection.down,
      ),
    );
  }
}
