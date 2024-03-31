// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:phd_peer/core/constants/colors.dart';
import 'package:phd_peer/core/constants/controllers.dart';
import 'package:phd_peer/core/constants/strings.dart';
import 'package:phd_peer/core/constants/text_style.dart';
import 'package:phd_peer/ui/screens/main/main_view_model.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // late AnimationController _controller;

  String? agoraToken;

  @override
  void initState() {
    super.initState();
    callController.getCallToken();
  }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainViewModel(),
      child: Consumer<MainViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: _appBar(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Stack(
                //   alignment: Alignment.center,
                //   children: [
                //     SpinKitRing(
                //       size: 300,
                //       duration: Duration(seconds: 2),
                //       color: primaryColor,
                //       lineWidth: 20.0,
                //       controller: _controller,
                //     ),
                //     Image.asset(
                //       "$logoIconsAssets/logo.png",
                //     ),
                //   ],
                // ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 80.0),
                  child: TweenAnimationBuilder<double>(
                    duration: const Duration(
                        seconds:
                            6), // Increase the duration for slower rotation
                    tween: Tween(begin: 0.0, end: 1.0),
                    builder: (_, double value, __) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Transform.rotate(
                            angle: value * 2 * 10, // 2 * pi is a full rotation
                            child: CircularPercentIndicator(
                              startAngle: 100,
                              circularStrokeCap: CircularStrokeCap.round,
                              linearGradient: gradient1,
                              radius: 150.0,
                              lineWidth: 20.0,
                              animation: true,
                              percent: 0.80,
                              animationDuration: 1800,
                              backgroundColor: backgoundColor,
                            ),
                          ),
                          Image.asset(
                            "$logoIconsAssets/logo.png",
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Text(
                  '${model.elapsedTime.inMinutes}:${(model.elapsedTime.inSeconds % 60).toString().padLeft(2, '0')}',
                  style: style18,
                ),
                Text(
                  'Estimated Match Time: 08:47',
                  style: style18.copyWith(fontWeight: FontWeight.w500),
                ),
                button(
                  text: "Get a Boost",
                  onPressed: () {
                    model.startTimer();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

button({onPressed, text}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20.0),
    child: GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 200.w,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: gradient1, borderRadius: BorderRadius.circular(30)),
        child: Text(
          "$text",
          style:
              style18.copyWith(color: whiteColor, fontWeight: FontWeight.w600),
        ),
      ),
    ),
  );
}

_appBar() {
  return AppBar(
    centerTitle: true,
    title: GradientText(
      'Searching',
      style: style22,
      colors: const [
        Color(0xffDB5614),
        Color(0xffE27A17),
        Color(0xffE69219),
      ],
    ),
    actions: [
      TextButton(
          onPressed: () {},
          child: Text(
            "Leave",
            style: style18,
          ))
    ],
  );
}
