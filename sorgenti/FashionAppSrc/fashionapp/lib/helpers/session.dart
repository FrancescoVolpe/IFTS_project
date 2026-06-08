import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Session {

  String appVersion = "";

  Color backgroundColor = Color(0xFFF1F7ED);
  Color foregroundColor = Color(0xFF1E212B);
  Color primaryColor = Color(0xFFB33951);
  Color accentColor = Color(0xFFE3D081);
  Color secondaryColor = Color(0xFF91C7B1);

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

  Future<void> init() async {
     final packageInfo = await PackageInfo.fromPlatform();
     appVersion = packageInfo.version;
  }

}

