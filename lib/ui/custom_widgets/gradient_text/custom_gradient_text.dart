// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class CustomGradientText extends StatelessWidget {
  TextStyle? style;
  String? text;
  CustomGradientText({this.style, this.text});
  @override
  Widget build(BuildContext context) {
    return GradientText(
      '$text',
      style: style,
      colors: const [
        Color(0xffDB5614),
        Color(0xffE27A17),
        Color(0xffE69219),
      ],
    );
  }
}
