import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle poppinsStyle({
  double? fSize,
  FontWeight? fWeight,
  Color? fColor,
  double? lHeight,
  double? fontSpacing,
  TextDecoration? textDecoration,
}) {
  return GoogleFonts.poppins(
    fontSize: fSize,
    fontWeight: fWeight,
    color: fColor,
    height: lHeight,
    letterSpacing: fontSpacing,
    decoration: textDecoration,
  );
}
