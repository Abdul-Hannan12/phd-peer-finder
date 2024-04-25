import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:phd_peer/core/constants/colors.dart';
import 'package:phd_peer/core/constants/strings.dart';
import 'package:phd_peer/data/services/auth_service/auth_service.dart';
import 'package:phd_peer/ui/screens/home/home_view_model.dart';
import 'package:phd_peer/ui/screens/root/root_screen.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../core/constants/text_style.dart';
import '../auth/sign_in/sign_in_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
        child: Consumer<HomeViewModel>(
          builder: (context, model, child) => Scaffold(
            appBar: _appBar(context),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          gradient: gradient1,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Image.asset(
                        "$logoIconsAssets/logo.png",
                      )),

                  ///
                  /// Start Chat Button
                  ///
                  Container(
                    alignment: Alignment.center,
                    child: Column(children: [
                      Image.asset(
                        "$staticAssets/homeIcon.png",
                        scale: 5,
                      ),
                      button(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RootScreen(
                                          selectedScreen: 2,
                                        )));
                          },
                          text: "Start Chat"),
                    ]),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

_appBar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    title: GradientText(
      'Random Match',
      style: style22,
      // ignore: prefer_const_literals_to_create_immutables
      colors: [
        const Color(0xffDB5614),
        const Color(0xffE27A17),
        const Color(0xffE69219),
      ],
    ),
    actions: [
      IconButton(
        onPressed: () {
          AuthService authService = AuthService();
          authService.signOut();
          Get.offAll(() => const LoginScreen());
        },
        icon: const Icon(
          Icons.logout,
          color: primaryColor,
        ),
      ),
    ],
  );
}

button({onPressed, text}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: 250.w,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          gradient: gradient1, borderRadius: BorderRadius.circular(20)),
      child: Text(
        "$text",
        style: style18.copyWith(color: whiteColor, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
