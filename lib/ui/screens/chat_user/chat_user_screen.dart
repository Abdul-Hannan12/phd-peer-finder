// ignore_for_file: unnecessary_brace_in_string_interps, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phd_peer/core/constants/colors.dart';
import 'package:phd_peer/core/constants/text_style.dart';
import 'package:phd_peer/core/model/messages.dart';
import 'package:phd_peer/ui/custom_widgets/gradient_text/custom_gradient_text.dart';
import 'package:phd_peer/ui/screens/chat_user/chat_user_view_model.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

class ChatUserScreen extends StatelessWidget {
  String? userImg;
  String? userName;

  ChatUserScreen({super.key, this.userImg, this.userName});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatUserViewModel(),
      child: Consumer<ChatUserViewModel>(
        builder: (context, model, child) => Scaffold(
          ///
          /// App Bar
          ///
          appBar: AppBar(
              centerTitle: true,
              title: CustomGradientText(
                text: '$userName',
                style: style22,
              )),

          ///
          /// Start Body
          ///

          body: Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 90),
            child: model.messages.isNotEmpty
                ? ListView.builder(
                    reverse: true,
                    shrinkWrap: true,
                    itemCount: model.messages.length,
                    itemBuilder: (context, index) {
                      return ChatContainer(
                        userImage: userImg,
                        message: model.messages[index],
                      );
                    })
                : Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Start Chat with $userName",
                      style: style18,
                    )),
          ),

          ///
          ///
          /// Bottom app bar with TextField
          ///
          // /
          // / Bottom app bar
          // /
          bottomSheet: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              style: style14,
              controller: model.messageController,
              onChanged: (val) {},
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.send,
                      color: primaryColor,
                      size: 16.sp,
                    )),
                contentPadding: const EdgeInsets.all(20),
                hintText: 'Message....',
                hintStyle: style14,
                fillColor: blackColor,
                filled: true,
                border: InputBorder.none,
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.r),
                    borderSide: const BorderSide(width: 1, color: whiteColor)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.r),
                    borderSide: const BorderSide(width: 1, color: whiteColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.r),
                    borderSide: const BorderSide(width: 1, color: whiteColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.r),
                    borderSide: const BorderSide(width: 1, color: whiteColor)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.r),
                    borderSide: const BorderSide(width: 1, color: whiteColor)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ChatContainer extends StatelessWidget {
  final Message? message;
  final String? userImage;

  const ChatContainer({super.key, this.message, this.userImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Row(
        mainAxisAlignment: message!.fromUserId == "1"
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (message!.fromUserId == "1")
            CircleAvatar(
              radius: 20.r,
              foregroundImage: AssetImage(
                "${userImage}",
              ),
            )
          else
            const SizedBox(width: 0), // Adjust based on your logic

          SizedBox(width: 10.w),

          Flexible(
            child: Padding(
              padding: message!.fromUserId == "1"
                  ? const EdgeInsets.only(top: 10.0, right: 100)
                  : const EdgeInsets.only(top: 10.0, left: 100),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  gradient:
                      message!.fromUserId == "1" ? gradient1 : gradientMessage,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text(
                  message!.textMessage.toString(),
                  style: message!.fromUserId == "1"
                      ? style10.copyWith(
                          fontSize: 11.sp, fontWeight: FontWeight.w400)
                      : style10.copyWith(
                          fontSize: 11.sp,
                          color: whiteColor,
                          fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),

          SizedBox(width: 10.w),
        ],
      ),
    );
  }
}







// class ChatBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ChatViewModel>(builder: (context, value, child) {
//       return Expanded(
//         child: ListView(
//           reverse: true,
//           children: [
//             MessageBubble(isMe: true, message: 'Yeah!'),
//             MessageBubble(isMe: false, message: ' Hope you like it'),
//             MessageBubble(isMe: false, message: 'Have a great working week!!'),
//             MessageBubble(isMe: true, message: 'You did your job well!'),
//             MessageBubble(isMe: false, message: 'Hello ! Nazrul How are you?'),
//             MessageBubble(isMe: true, message: 'Hello! Jhon abraham!'),
//           ],
//         ),
//       );
//     });
//   }
// }

// Widget _buildMessageComposer() {
//   return Container(
//     padding: EdgeInsets.all(8.0),
//     color: Colors.grey[200],
//     child: Row(
//       children: [
//         Expanded(
//           child: TextField(
//             decoration: InputDecoration(
//               hintText: 'Type a message...',
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(25.0),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(width: 8.0),
//         IconButton(
//           icon: Icon(Icons.send),
//           onPressed: () {
//             // Implement sending message functionality
//           },
//         ),
//       ],
//     ),
//   );
// }

// class MessageBubble extends StatelessWidget {
//   final bool isMe;
//   final String message;

//   const MessageBubble({required this.isMe, required this.message});

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       isMe == false
//           ? Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   height: 40.h,
//                   width: 40.w,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                   ),
//                   child: Image.asset(
//                     "$images/profile.png",
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 SizedBox(
//                   width: 10.w,
//                 ),
//                 Text(
//                   "Jhon Abraham",
//                   style: headingTextStyleRegular.copyWith(fontSize: 14.sp),
//                 ),
//               ],
//             )
//           : SizedBox(),
//       ListView.builder(
//           reverse: true,
//           physics: NeverScrollableScrollPhysics(),
//           itemCount: 1,
//           shrinkWrap: true,
//           itemBuilder: (context, index) {
//             return Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                       vertical: isMe ? 4.0 : 4.0,
//                       horizontal: isMe ? 8.0 : 50.0),
//                   child: Align(
//                     alignment:
//                         isMe ? Alignment.centerRight : Alignment.centerLeft,
//                     child: Container(
//                       decoration: BoxDecoration(
//                           color: isMe ? Colors.blue : Colors.grey[300],
//                           borderRadius: isMe
//                               ? BorderRadius.only(
//                                   topLeft: Radius.circular(12),
//                                   bottomLeft: Radius.circular(12),
//                                   bottomRight: Radius.circular(12))
//                               : BorderRadius.only(
//                                   topRight: Radius.circular(12),
//                                   bottomLeft: Radius.circular(12),
//                                   bottomRight: Radius.circular(12))),
//                       padding: EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           Text(
//                             message,
//                             style: TextStyle(
//                                 color: isMe ? Colors.white : Colors.black),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           }),
//     ]);
//   }
// }



// // ignore_for_file: must_be_immutable, use_key_in_widget_constructors

// import 'package:flutter/material.dart';
// import 'package:phd_peer/core/constants/text_style.dart';
// import 'package:phd_peer/ui/screens/chat_user/chat_user_view_model.dart';
// import 'package:provider/provider.dart';
// import 'package:simple_gradient_text/simple_gradient_text.dart';

// class ChatUserScreen extends StatelessWidget {
//   String? userImg;
//   String? userName;

//   ChatUserScreen({required this.userImg, required this.userName});
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//         create: (context) => ChatUserViewModel(),
//         child: Consumer<ChatUserViewModel>(
//           builder: (context, model, child) => Scaffold(
//             ///
//             /// App Bar
//             ///
//             appBar: AppBar(
//               centerTitle: true,
//               title: GradientText(
//                 '$userName',
//                 style: style22,
//                 colors: const [
//                   Color(0xffDB5614),
//                   Color(0xffE27A17),
//                   Color(0xffE69219),
//                 ],
//               ),
//             ),

//             ///
//             /// START BODY
//             ///
//             body: Column(
//               children: [
//                 Text(
//                   "Chatting",
//                   style: style22,
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }
