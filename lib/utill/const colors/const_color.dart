import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kPrimaryColor = Color(0xff1877F2);
const Color kTitleColor = Color(0xff050505);
const kSubTitleColor = Color(0xff4E4B66);
const Color kButtonColor = Color(0xffEEF1F4);
const Color kButtonTextColor = Color(0xff667080);
const kTextFieldBorderColor = Color(0xffA0A3BD);
const kWhiteColor=Color(0xffFFFFFF);
const kError=Color(0xffED2E7E);

final kTextStyle = GoogleFonts.poppins(
  color: kTitleColor,
);



BoxDecoration kContainerDecoration = const BoxDecoration(
  color: kButtonColor,
  borderRadius: BorderRadius.all(
    Radius.circular(6.0),
  ),
);

InputDecoration kInputDecoration = const InputDecoration(
  hintStyle: TextStyle(color: kTitleColor),
  prefixIconColor: kTextFieldBorderColor,
  labelStyle: TextStyle(color: kTitleColor),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(6.0),
    ),
    borderSide: BorderSide(color: kTextFieldBorderColor, width: 1),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(6.0),
    ),
    borderSide: BorderSide(color: kTextFieldBorderColor, width: 1),
  ),
);
