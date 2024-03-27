// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phd_peer/core/constants/colors.dart';
import 'package:phd_peer/core/constants/strings.dart';
import 'package:phd_peer/core/constants/text_style.dart';
import 'package:phd_peer/core/model/user_messages.dart';

class CustomUserMessages extends StatelessWidget {
  final onPressedCall;
  UserMessages userMessages;
  CustomUserMessages({required this.userMessages, required this.onPressedCall});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          foregroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          radius: 22.r,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              ///
              /// USER PROFILE
              ///

              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(
                          "${userMessages.userImgUrl}",
                        ),
                        fit: BoxFit.cover)),
              ),

              ///
              /// ONLINE AND OFFLINE STATUS
              ///
              userMessages.online == false
                  ? Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        radius: 5.r,
                        backgroundColor: Colors.green,
                      ),
                    )
                  : Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        radius: 5.r,
                        backgroundColor: Colors.red,
                      ),
                    ),
              userMessages.notification == false
                  ? Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          gradient: gradient1,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          "${userMessages.notficationNumbers}",
                          style: style10.copyWith(
                              fontSize: 12.sp,
                              color: blackColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          )),

      ///
      /// USER NAME
      ///
      title: Text(
        "${userMessages.userName}",
        style: style14.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        "Start the Chat with ${userMessages.userName}",
        style: style10,
      ),
      trailing: GestureDetector(
        onTap: onPressedCall,
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              gradient: gradient1, borderRadius: BorderRadius.circular(15.r)),
          child: Image.asset(
            "$logoIconsAssets/call.png",
            scale: 3,
          ),
        ),
      ),
    );
  }
}
