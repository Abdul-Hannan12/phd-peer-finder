// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:phd_peer/core/constants/colors.dart';
import 'package:phd_peer/core/constants/strings.dart';
import 'package:phd_peer/core/constants/text_field_decoration.dart';
import 'package:phd_peer/core/constants/text_style.dart';
import 'package:phd_peer/core/enums/view_state.dart';
import 'package:phd_peer/core/helpers/helpers.dart';
import 'package:phd_peer/ui/custom_widgets/buttons/custom_button.dart';
import 'package:phd_peer/ui/screens/auth/sign_in/sign_in_view_model.dart';
import 'package:phd_peer/ui/screens/auth/sign_up/sign_up_screen.dart';
import 'package:phd_peer/ui/screens/root/root_screen.dart';
import 'package:provider/provider.dart';

import '../../../../data/services/auth_service/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: Consumer<LoginProvider>(builder: (context, model, child) {
        return ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: Form(
                  key: model.fmkey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              gradient: gradient1,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Image.asset(
                            '$logoIconsAssets/logo.png',
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Text(
                          "Welcome Back",
                          style: style25,
                        ),
                        Text(
                          "Let's get started byb filling out from below",
                          style: style14.copyWith(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 15),
                          child: TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              }
                              final emailRegex =
                                  RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                              if (!emailRegex.hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                            style: style14,
                            decoration:
                                authFieldDecoration.copyWith(hintText: 'Email'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 15),
                          child: TextFormField(
                            controller: passwordController,
                            validator: (value) {
                              final passwordRegex =
                                  RegExp(r'^(?=.*[A-Z])(?=.*\d).{8,}$');

                              if (value!.isEmpty) {
                                return 'Please enter a password';
                              } else if (!passwordRegex.hasMatch(value)) {
                                return 'Password too weak';
                              }
                              return null;
                            },
                            style: style14,
                            obscureText: model.isVisible,
                            decoration: authFieldDecoration.copyWith(
                                hintText: 'Password',
                                suffixIconColor: whiteColor,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    model.toggleVisibilty();
                                  },
                                  child: Icon(model.isVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                )),
                          ),
                        ),
                        CustomButton(
                          onPressed: () async {
                            if (model.fmkey.currentState!.validate()) {
                              AuthService authService = AuthService();
                              String email = emailController.text.trim();
                              String password = passwordController.text.trim();
                              showLoading(context);
                              bool success = await authService
                                  .loginWithEmailPassword(email, password);
                              Navigator.pop(context);
                              if (success) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RootScreen(),
                                  ),
                                );
                              }
                            }
                          },
                          text: 'Login',
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Expanded(
                              child: Divider(
                                thickness: 2,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "OR",
                              style: style18,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Expanded(
                              child: Divider(
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                        boxContainer(
                            onPressed: () async {
                              AuthService authService = AuthService();
                              bool success =
                                  await authService.loginWithGoogle();
                              if (success) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RootScreen(),
                                  ),
                                );
                              }
                            },
                            imageIcon: "google.png",
                            title: "Continue with google"),
                        boxContainer(
                            onPressed: () {},
                            imageIcon: "apple.png",
                            title: "Continue with Apple"),
                        SizedBox(
                          height: 30.h,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpScreen(),
                                ),
                              );
                            },
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: 'Don‘t have an account?',
                                      style: style14),
                                  WidgetSpan(
                                      child: SizedBox(
                                    width: 8.w,
                                  )),
                                  TextSpan(
                                    text: 'Create Account',
                                    style: style14.copyWith(
                                        color: primaryColor,
                                        fontWeight: FontWeight.w500),
                                  )
                                ])),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ]),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

remberMeCheckBox() {
  return CheckboxListTile(
    checkColor: primaryColor,
    activeColor: primaryColor,
    value: false,
    onChanged: (value) {},
    controlAffinity: ListTileControlAffinity.leading,
    contentPadding: const EdgeInsets.only(left: 0, top: 0),
    title: Text(
      "Remember Me",
      style: style12,
    ),
  );
}

boxContainer({onPressed, imageIcon, title}) {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0, top: 30),
    child: GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: gradient1,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "$logoIconsAssets/$imageIcon",
                scale: 3.5,
                color: whiteColor,
              ),
              SizedBox(
                width: 20.w,
              ),
              Text(
                "$title",
                style: style14.copyWith(fontWeight: FontWeight.w600),
              ),
            ]),
      ),
    ),
  );
}
