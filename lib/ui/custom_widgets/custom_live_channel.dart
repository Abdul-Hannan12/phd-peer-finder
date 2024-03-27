// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phd_peer/core/constants/text_style.dart';
import 'package:phd_peer/core/model/live_channel.dart';

class CustomLiveChannel extends StatelessWidget {
  final LiveChannel? liveChannel;
  const CustomLiveChannel({required this.liveChannel});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 80.h,
          width: 80.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              image: DecorationImage(
                  image: AssetImage("${liveChannel!.imgUrl}"),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          height: 5.h,
        ),
        Flexible(
          // Wrap Text with Flexible
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.20,
            child: Text(
              textAlign: TextAlign.center,
              "${liveChannel!.username}",
              style: style10.copyWith(fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis, // Add overflow property
            ),
          ),
        ),
      ],
    );
  }
}
