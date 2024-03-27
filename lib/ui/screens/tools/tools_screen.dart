import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phd_peer/core/constants/colors.dart';
import 'package:phd_peer/core/constants/strings.dart';
import 'package:phd_peer/ui/custom_widgets/custom_conference.dart';
import 'package:phd_peer/ui/custom_widgets/custom_live_channel.dart';
import 'package:phd_peer/ui/custom_widgets/custom_study_partner.dart';
import 'package:phd_peer/ui/custom_widgets/gradient_text/custom_gradient_text.dart';
import 'package:phd_peer/ui/screens/tools/tools_view_model.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/text_style.dart';

class ToolsScreen extends StatelessWidget {
  const ToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ToolsViewModel(),
        child: Consumer<ToolsViewModel>(
          builder: (context, model, child) => Scaffold(
            ///
            /// App Bar
            ///
            appBar: _appBar(),

            ///
            /// START BODY
            ///
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),

                    ///
                    /// Search
                    ///

                    _textField(),

                    ///
                    /// Study Partner
                    ///

                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: const Color(0xff403936),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomGradientText(
                                  text: 'Study Partner',
                                  style: style22,
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "View all",
                                      style: style14.copyWith(
                                          fontWeight: FontWeight.w500),
                                    ))
                              ],
                            ),
                          ),

                          ///
                          /// users
                          ///
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: SizedBox(
                              height: 80,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: model.studyPartnerList.length,
                                itemBuilder: (context, index) {
                                  return CustomStudyPartner(
                                    studyPartner: model.studyPartnerList[index],
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    width: 10.w,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///
                    /// Research Tools
                    ///
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: const Color(0xff403936),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomGradientText(
                            text: 'Research Tools',
                            style: style22,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),

                          ///
                          /// 1ST
                          ///
                          Row(
                            children: [
                              resrachTools(
                                  image: "$logoIconsAssets/proofReading.png",
                                  scale: 6.0,
                                  text: "Proof Reading"),
                              SizedBox(
                                width: 10.w,
                              ),
                              resrachTools(
                                  image: "$logoIconsAssets/practice.png",
                                  scale: 6.0,
                                  text: "Practice Pitch"),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),

                          ///
                          /// 2ND
                          ///
                          Row(
                            children: [
                              resrachTools(
                                  image: "$logoIconsAssets/brainstorm.png",
                                  scale: 5.0,
                                  text: "Brainstorm      "),
                              SizedBox(
                                width: 10.w,
                              ),
                              resrachTools(
                                  image: "$logoIconsAssets/create_room.png",
                                  scale: 5.0,
                                  text: "create Room"),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),

                          ///
                          /// With Premium
                          ///
                          Row(
                            children: [
                              resrachToolsPremium(
                                  image: "$logoIconsAssets/co-read.png",
                                  scale: 5.0,
                                  text: "Co-Read Paper"),
                              SizedBox(
                                width: 20.w,
                              ),
                              resrachToolsPremium(
                                  image: "$logoIconsAssets/create_room.png",
                                  scale: 5.0,
                                  text: "Conference"),
                            ],
                          ),
                        ],
                      ),
                    ),

                    ///
                    /// Conference
                    ///
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: const Color(0xff403936),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    CustomGradientText(
                                      text: 'Conference',
                                      style: style22,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Image.asset(
                                      "$logoIconsAssets/live.png",
                                      scale: 4,
                                    ),
                                  ],
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "View all",
                                      style: style14.copyWith(
                                          fontWeight: FontWeight.w500),
                                    ))
                              ],
                            ),
                          ),

                          ///
                          /// users
                          ///
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: SizedBox(
                              height: 80,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: model.conferenceList.length,
                                itemBuilder: (context, index) {
                                  return CustomConference(
                                    conference: model.conferenceList[index],
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    width: 10.w,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///
                    /// Live Channel
                    ///
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: const Color(0xff403936),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomGradientText(
                                  text: 'Live Channel',
                                  style: style22,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "View all",
                                      style: style14.copyWith(
                                          fontWeight: FontWeight.w500),
                                    ))
                              ],
                            ),
                          ),

                          ///
                          /// users
                          ///
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: SizedBox(
                              height: 120,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: model.liveChannelList.length,
                                itemBuilder: (context, index) {
                                  return CustomLiveChannel(
                                    liveChannel: model.liveChannelList[index],
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    width: 10.w,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

_appBar() {
  return AppBar(
    centerTitle: true,
    title: CustomGradientText(
      text: 'Tools',
      style: style22,
    ),
    actions: [
      InkWell(
        onTap: () {},
        child: Container(
            margin: const EdgeInsets.only(right: 20),
            padding: const EdgeInsets.all(10),
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: greyColor),
            child: Image.asset(
              "$logoIconsAssets/message-circle.png",
              scale: 4,
            )),
      ),
    ],
  );
}

_textField() {
  return TextFormField(
    style: style14,
    onChanged: (val) {},
    textAlign: TextAlign.start,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.all(15),
      hintText: 'Search for a Tool',
      hintStyle: style14,
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Image.asset(
          "$logoIconsAssets/search.png",
          scale: 4,
        ),
      ),
      fillColor: const Color(0xff403936),
      filled: true,
      border: InputBorder.none,
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.r),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.r),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.r),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.r),
      ),
    ),
  );
}

resrachTools({image, text, scale}) {
  return Expanded(
    child: Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: gradient1,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "$image",
            scale: scale,
          ),
          SizedBox(
            width: 10.w,
          ),
          Flexible(
            // Wrap Text with Flexible
            child: Text(
              "$text",
              style: style14.copyWith(
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis, // Add overflow property
            ),
          ),
        ],
      ),
    ),
  );
}

resrachToolsPremium({image, text, scale}) {
  return Expanded(
    child: Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: whiteColor.withOpacity(0.10),
            // border: Border.all(width: 1, color: greyColor)
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: gradient1,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "$image",
                  scale: scale,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Flexible(
                  // Wrap Text with Flexible
                  child: Text(
                    "$text",
                    style: style14.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis, // Add overflow property
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
                color: Color(0xff403936),
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(10))),
            child: CustomGradientText(
              text: 'Premium',
              style: style10.copyWith(fontWeight: FontWeight.bold),
            ))
      ],
    ),
  );
}
