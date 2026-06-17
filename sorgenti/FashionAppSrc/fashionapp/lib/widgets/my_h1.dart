import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyH1 extends StatelessWidget {
  const MyH1({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left:10, right:10),
      child: Column(
        children: [
          Text(
            text, 
            style: GoogleFonts.roboto(fontSize:20, fontWeight: FontWeight.bold, color: Colors.black54),
          ),
          Divider(height:1, color: Colors.black12),
        ],
      ),
    );
  }
}