import 'package:flutter/material.dart';

class ComponentWidgetTextTopics extends StatelessWidget {
  const ComponentWidgetTextTopics({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.isBold,
    required this.paddingTop,
    required this.paddingBottom,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final bool isBold;
  final double paddingTop;
  final double paddingBottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: paddingTop,
        bottom: paddingBottom,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          fontSize: fontSize,
          color: Colors.white,
        ),
      ),
    );
  }
}
