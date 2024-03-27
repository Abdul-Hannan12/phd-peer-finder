// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phd_peer/core/constants/colors.dart';
import 'package:phd_peer/core/constants/text_style.dart';

class CustomBottomNavigarBar extends StatelessWidget {
  final onTap;
  String? image;
  String? name;
  int currentIndex;
  final scale;
  int indexNumber;

  CustomBottomNavigarBar(
      {super.key,
      required this.image,
      required this.name,
      required this.onTap,
      this.scale,
      required this.currentIndex,
      required this.indexNumber});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Image.asset(
                  "$image",
                  scale: scale ?? 3.0,
                  // color: indexNumber == currentIndex ? gradient1 : gradient1,
                ),
                Text(
                  "$name",
                  style: style10.copyWith(color: primaryColor, fontSize: 9.sp),
                )
              ],
            )),
      ),
    );
  }
}
