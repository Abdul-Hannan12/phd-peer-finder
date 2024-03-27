// ignore_for_file: unnecessary_brace_in_string_interps, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phd_peer/core/constants/strings.dart';
import 'package:phd_peer/core/constants/text_style.dart';
import 'package:phd_peer/ui/custom_widgets/gradient_text/custom_gradient_text.dart';
import 'package:phd_peer/ui/screens/active_call/active_call_view_model.dart';
import 'package:phd_peer/ui/screens/root/root_screen.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

class ActiveCallScreen extends StatelessWidget {
  String? userImg;
  String? userName;

  ActiveCallScreen({super.key, this.userImg, this.userName});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ActiveCallViewModel(),
      child: Consumer<ActiveCallViewModel>(
        builder: (context, model, child) => Scaffold(
          ///
          /// App Bar
          ///
          appBar: AppBar(
              centerTitle: true,
              title: CustomGradientText(
                text: 'Active Call',
                style: style22,
              )),

          ///
          /// Start Body
          ///

          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 120.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60.r,
                        backgroundImage: AssetImage("$userImg"),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "$userName",
                        style: style18.copyWith(fontSize: 16.sp),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    children: [
                      model.isCorrectClicked
                          ? Text(
                              model.getRemainingTime(),
                              style:
                                  style14.copyWith(fontWeight: FontWeight.w600),
                            )
                          : Text(
                              '00.00',
                              style:
                                  style14.copyWith(fontWeight: FontWeight.w600),
                            ),
                      Text(
                        "Time Remaining",
                        style: style18.copyWith(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      model.isCorrectClicked
                          ? const SizedBox()
                          : Text(
                              "Connect?",
                              style: style22,
                            ),
                      SizedBox(
                        height: 30.h,
                      ),
                      model.isCorrectClicked
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                callDetail(
                                    scale: 4.0,
                                    onPressed: () {},
                                    img: "volume",
                                    text: 'Volume'),
                                callDetail(
                                    onPressed: () {},
                                    img: "voice",
                                    scale: 4.0,
                                    text: 'Mute'),
                                callDetail(
                                    onPressed: () {},
                                    img: "block",
                                    scale: 4.0,
                                    text: 'Report/Block'),
                                callDetail(
                                    onPressed: () {
                                      model.updateCorrectClicked(false);
                                    },
                                    img: "phoneCall",
                                    scale: 5.5,
                                    text: 'End Call')
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const RootScreen(
                                                  selectedScreen: 0,
                                                )));
                                  },
                                  child: CircleAvatar(
                                    radius: 35.r,
                                    backgroundColor: Colors.red,
                                    child: Center(
                                      child: Image.asset(
                                        "$logoIconsAssets/uncorrect.png",
                                        scale: 4,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const RootScreen(
                                                  selectedScreen: 4,
                                                )));
                                  },
                                  child: CircleAvatar(
                                    radius: 35.r,
                                    backgroundColor: Colors.green,
                                    child: Center(
                                      child: Image.asset(
                                        "$logoIconsAssets/correct.png",
                                        scale: 4,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

callDetail({onPressed, img, text, scale}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0),
    child: InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff403936),
            ),
            child: Image.asset(
              "$logoIconsAssets/$img.png",
              scale: scale,
            ),
          ),
          Text(
            "$text",
            style: style12.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    ),
  );
}