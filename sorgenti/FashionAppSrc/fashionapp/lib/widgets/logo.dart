import 'package:flutter/material.dart';

class Logo extends StatefulWidget {
  const Logo({super.key, required this.width});

  final double width;

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/logo.png", width: widget.width);
  }
}