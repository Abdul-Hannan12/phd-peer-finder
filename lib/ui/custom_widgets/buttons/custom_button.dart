// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:phd_peer/core/constants/colors.dart';
import 'package:phd_peer/core/constants/text_style.dart';

class CustomButton extends StatelessWidget {
  final onPressed;
  String? text;
  Gradient? color;
  Color? textColor;
  CustomButton({this.onPressed, this.text, this.color, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              // color: primaryColor ?? color,
              gradient: gradient1,
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            "$text",
            style: style18.copyWith(
                color: whiteColor, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
