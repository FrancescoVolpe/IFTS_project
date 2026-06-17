import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fashionapp/helpers/session.dart';

class MyButton extends StatefulWidget {
  const MyButton({
    super.key, 
    required this.session,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.width = 100,
    this.type = "normal",
  });

  final Session session;
  final String label;
  final IconData icon;
  final Function() onPressed;
  final double width;
  final String type;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {

    Color? bgColor;
    Color? fgColor;
    if (widget.type == "normal") {
      bgColor = widget.session.accentColor;
      fgColor = widget.session.primaryColor;
    } else if (widget.type == "cancel") {
      bgColor = Color(0xFFDC3545);
      fgColor = Colors.black87;
    }

    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: SizedBox(
        width: widget.width,
        child: Row(
          children: [
            Icon(widget.icon, color: fgColor),
            const SizedBox(width: 8),
            Text(
              widget.label, 
              style: GoogleFonts.roboto(
                color: fgColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              )
            ),
          ],
        )
      ),
    );
  }
}