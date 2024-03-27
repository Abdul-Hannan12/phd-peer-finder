import 'package:flutter/material.dart';
import 'package:phd_peer/core/constants/colors.dart';
import 'package:phd_peer/core/constants/text_style.dart';

final authFieldDecoration = InputDecoration(
  hintText: "",
  hintStyle: style18.copyWith(color: whiteColor, fontWeight: FontWeight.normal),
  focusColor: whiteColor,
  prefixIconColor: primaryColor,
  suffixIconColor: primaryColor,
  fillColor: blackColor,
  filled: true,
  border: InputBorder.none,
  enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: blackColor, width: 2.0),
      borderRadius: BorderRadius.circular(15)),
  focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: blackColor, width: 2.0),
      borderRadius: BorderRadius.circular(15)),
  errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: blackColor, width: 2.0),
      borderRadius: BorderRadius.circular(15)),
  disabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: blackColor, width: 2.0),
      borderRadius: BorderRadius.circular(15)),
  focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: blackColor, width: 2.0),
      borderRadius: BorderRadius.circular(15)),
);
