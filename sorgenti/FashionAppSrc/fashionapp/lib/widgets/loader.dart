import 'package:flutter/material.dart';
import 'package:fashionapp/helpers/session.dart';

class Loader extends StatefulWidget {
  const Loader({super.key, required this.session, required this.width});

  final Session session;
  final double width;

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  @override
  Widget build(BuildContext context) {
  return SizedBox(
      width: widget.width,
      height: widget.width,
      child: CircularProgressIndicator(color: widget.session.primaryColor),
    );
  }
}