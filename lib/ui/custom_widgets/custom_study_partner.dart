import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phd_peer/core/constants/text_style.dart';
import 'package:phd_peer/core/model/study_partner.dart';

class CustomStudyPartner extends StatelessWidget {
  final StudyPartner? studyPartner;
  const CustomStudyPartner({super.key, required this.studyPartner});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              height: 50.h,
              width: 50.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("${studyPartner!.imgUrl}"),
                      fit: BoxFit.cover)),
            ),
            CircleAvatar(
              radius: 6.r,
              backgroundColor:
                  studyPartner!.online == false ? Colors.green : Colors.red,
            ),
          ],
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
              "${studyPartner!.username}",
              style: style10.copyWith(fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis, // Add overflow property
            ),
          ),
        ),
      ],
    );
  }
}
