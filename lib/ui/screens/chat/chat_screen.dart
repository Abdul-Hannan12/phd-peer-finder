import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phd_peer/core/constants/colors.dart';
import 'package:phd_peer/core/constants/text_style.dart';
import 'package:phd_peer/ui/custom_widgets/custom_user_messages.dart';
import 'package:phd_peer/ui/screens/chat/chat_view_model.dart';
import 'package:phd_peer/ui/screens/chat_user/chat_user_screen.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ChattingScreen extends StatelessWidget {
  const ChattingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ChattingViewModel(),
        child: Consumer<ChattingViewModel>(
          builder: (context, model, child) => Scaffold(
            ///
            /// App Bar
            ///
            appBar: _appBar(),

            ///
            /// START BODY
            ///
            body: Column(
              children: [
                ///
                /// HEADER
                ///
                Container(
                  padding: const EdgeInsets.all(10),
                  color: greyColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      button(
                        onPressed: () {
                          model.onCallLive();
                        },
                        title: "Call Live Member Directly",
                        boxColor:
                            model.callLive ? gradient1 : gradientTransparent,
                      ),
                      // button(
                      //   onPressed: () {
                      //     model.onPremium();
                      //   },
                      //   title: "Go Premium",
                      //   boxColor:
                      //       model.goPremium ? gradient1 : gradientTransparent,
                      // ),
                    ],
                  ),
                ),

                ///
                /// CHATTING SCREENS
                ///
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        // Your other content goes here
                        ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: model.userMessageList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChatUserScreen(
                                              userImg: model
                                                  .userMessageList[index]
                                                  .userImgUrl,
                                              userName: model
                                                  .userMessageList[index]
                                                  .userName,
                                            )));
                              },
                              child: CustomUserMessages(
                                userMessages: model.userMessageList[index],
                                onPressedCall: () {},
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 10.h,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

button({title, onPressed, boxColor}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            gradient: boxColor, borderRadius: BorderRadius.circular(10.r)),
        child: Text(
          "$title",
          style: style14.copyWith(
            fontSize: 18.sp,
          ),
        )),
  );
}

_appBar() {
  return AppBar(
    centerTitle: true,
    title: GradientText(
      'Messages',
      style: style22,
      colors: const [
        Color(0xffDB5614),
        Color(0xffE27A17),
        Color(0xffE69219),
      ],
    ),
  );
}
