import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutputMessage extends StatefulWidget {
  const OutputMessage({
    super.key,
    required this.type,
    required this.message,
    this.showCloseButton = false,
    this.onClose,
  });

  final String type; //error, info, success, warning
  final String message;
  final bool showCloseButton;
  final Function()? onClose;

  @override
  State<OutputMessage> createState() => _OutputMessageState();
}

class _OutputMessageState extends State<OutputMessage> {
  @override
  Widget build(BuildContext context) {
    Color color;
    Icon icon;
    if (widget.type == "error") {
      color = Color(0xFFDC3545);
      icon = Icon(Icons.error, color: color);
    } else if (widget.type == "success") {
      color = Color(0xFF28A745);
      icon = Icon(Icons.check, color: color);
    } else if (widget.type == "warning") {
      color = Color(0xFFFFC107);
      icon = Icon(Icons.warning_amber_rounded, color: color);
    } else {
      color = Color(0xFF17A2B8);
      icon = Icon(Icons.info, color: color);
    }

    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withAlpha(80),
              border: Border.all(color: color, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                icon,
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    widget.message,
                    style: GoogleFonts.roboto(
                      fontSize: 10,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.showCloseButton,
                  child: GestureDetector( 
                    onTap: widget.onClose,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child:Container(
                        width: 22,
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.close, color: color, size: 20),
                      ),
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
