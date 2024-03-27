// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phd_peer/core/constants/text_style.dart';
import 'package:phd_peer/core/model/conference.dart';

class CustomConference extends StatelessWidget {
  final Conference? conference;
  const CustomConference({required this.conference});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 50.h,
          width: 50.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage("${conference!.imgUrl}"),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          height: 5.h,
        ),
        Flexible(
          // Wrap Text with Flexible
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.15,
            child: Text(
              textAlign: TextAlign.center,
              "${conference!.username}",
              style: style10.copyWith(fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis, // Add overflow property
            ),
          ),
        ),
      ],
    );
  }
}
