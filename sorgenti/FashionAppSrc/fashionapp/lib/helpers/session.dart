import 'dart:ui';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class Session {
  Color backgroundColor = const Color(0xFFEFEFEF);
  Color primaryColor = const Color(0xFF000000);
  Color secondaryColor = const Color.fromARGB(255, 138, 72, 18);
  Color accentColor = const Color(0xFFFFC107);
  Color foregroundColor = const Color(0xFF03A9F4);

  TextStyle get fieldStyle => GoogleFonts.roboto(
    fontSize: 12,
    color: foregroundColor,
    fontWeight: FontWeight.w300,
  );

  TextStyle get labelStyle => GoogleFonts.roboto(
    color: primaryColor,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
}