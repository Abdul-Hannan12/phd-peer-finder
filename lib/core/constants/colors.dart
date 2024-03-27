import 'package:flutter/material.dart';

///
/// Update the colors below according to your use case.
///
const Color blackColor = Colors.black;
const Color backgoundColor = Color(0xff121212);
const Color primaryColor = Color(0xffE69219);
const Color whiteColor = Colors.white;
const Color greyColor = Color(0xff403936);
const Color lightGreyColor = Color(0xffD9D9D9);
const Color borderColor = Color(0xff777777);

/// Gradients
LinearGradient gradient1 = const LinearGradient(
  colors: [
    Color(0xffDB5614),
    Color(0xffE27A17),
    Color(0xffE69219),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
LinearGradient gradientTransparent = const LinearGradient(
  colors: [
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
LinearGradient gradient2 = const LinearGradient(
  colors: [
    Color(0xffE69219),
    Color(0xffE27A17),
    Color(0xffDB5614),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

LinearGradient gradientMessage = const LinearGradient(
  colors: [Color(0xff4A4A4A), Color(0xff4A4A4A), Color(0xff4A4A4A)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
