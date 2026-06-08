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
  });

  final Session session;
  final String label;
  final IconData icon;
  final Function() onPressed;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.session.accentColor,
        foregroundColor: widget.session.primaryColor,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: SizedBox(
        width: 100,
        child: Row(
          children: [
            Icon(widget.icon, color: widget.session.primaryColor),
            const SizedBox(width: 8),
            Text(
              widget.label, 
              style: GoogleFonts.roboto(
                color: widget.session.primaryColor,
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