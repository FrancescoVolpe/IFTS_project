import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fashionapp/helpers/session.dart';

class MyTextfield extends StatefulWidget {
  const MyTextfield({
    super.key, 
    required this.session, 
    this.controller, 
    required this.labelText, 
    required this.hintText, 
    required this.prefixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  }
  );

  final Session session;
  final TextEditingController? controller;
  final String labelText;
  final String hintText;
  final Icon prefixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;

  @override
  State<MyTextfield> createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      textInputAction: TextInputAction.next,
      style: widget.session.fieldStyle,
      cursorColor: widget.session.primaryColor,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        prefixIconColor: widget.session.primaryColor,

        labelStyle: widget.session.labelStyle,

        floatingLabelStyle: GoogleFonts.roboto(
          color:  widget.session.primaryColor,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),

        hintStyle: GoogleFonts.roboto(color:  widget.session.primaryColor, fontSize: 14),

        filled: true,
        fillColor: Colors.white,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:  BorderSide(
            color:  widget.session.primaryColor,
            width: 2,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}