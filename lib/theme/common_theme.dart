import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonTheme {
  static final buttonColor = Color(0xFFFFB91D);
  static final appBackgroundColor = Colors.black;
  static final containerColor = Color(0xFF26292F);
  static final forgotPasswordText = Color(0xFFA5A7AA);
  static final commonContainerColor = Color(0xFF1F222A);

  static final appbarTitle = GoogleFonts.urbanist(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static final socialLoginText = GoogleFonts.urbanist(
    color: Colors.white,
    fontSize: 42,
    fontWeight: FontWeight.w700,
  );

  static final socialLoginButtonText = GoogleFonts.urbanist(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static final commonAuthText = GoogleFonts.urbanist(
    color: Colors.white,
    fontSize: 29,
    fontWeight: FontWeight.w700,
  );

  static final commonAuthButtonText = GoogleFonts.urbanist(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static final alreadyAcountText = GoogleFonts.urbanist(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );

  static final textHint = GoogleFonts.urbanist(
    color: Color(0xFF9E9E9E),
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static final textFormFieldTextStyle = GoogleFonts.urbanist(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
  );

  static OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderSide: BorderSide(color: CommonTheme.buttonColor),
    borderRadius: BorderRadius.circular(15),
  );
  static OutlineInputBorder errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
  );
  static OutlineInputBorder placeadfocusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
  );
}
