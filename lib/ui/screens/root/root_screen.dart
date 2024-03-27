import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phd_peer/core/constants/colors.dart';
import 'package:phd_peer/core/constants/strings.dart';
import 'package:phd_peer/ui/custom_widgets/bottom_navigator_bar.dart';
import 'package:phd_peer/ui/screens/root/root_view_model.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatelessWidget {
  final int? selectedScreen;

  const RootScreen({super.key, this.selectedScreen = 0});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RootScreenViewModel(selectedScreen),
      child: Consumer<RootScreenViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: backgoundColor,
          body: model.allScreen[model.selectedScreen],
          //  /
          /// Bottom Bar
          //    /
          bottomNavigationBar: _bottomAppbar(model),
        ),
      ),
    );
  }
}

Widget _bottomAppbar(RootScreenViewModel model) {
  return BottomAppBar(
    height: 120.h,
    elevation: 0.0,
    color: backgoundColor,
    // shape: const CircularNotchedRectangle(),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "$staticAssets/navigator.png",
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ///
                    /// Home Image
                    ///
                    ///

                    CustomBottomNavigarBar(
                        image: "$staticAssets/home.png",
                        name: 'Home',
                        onTap: () {
                          model.updatedScreen(0);
                        },
                        currentIndex: model.selectedScreen,
                        indexNumber: 0),

                    ///
                    /// tools Image
                    ///
                    CustomBottomNavigarBar(
                        image: "$staticAssets/chat.png",
                        name: 'Chat',
                        onTap: () {
                          model.updatedScreen(1);
                        },
                        currentIndex: model.selectedScreen,
                        indexNumber: 1),

                    Container(
                      decoration: BoxDecoration(
                          gradient: gradient1, shape: BoxShape.circle),
                      child: GestureDetector(
                        onTap: () {
                          model.updatedScreen(2);
                        },
                        child: Image.asset(
                          "$staticAssets/mainn.png",
                          scale: 4.5,
                          // color: indexNumber == currentIndex ? gradient1 : gradient1,
                        ),
                      ),
                    ),
                    // CustomBottomNavigarBar(
                    //     name: '',
                    //     image: "$staticAssets/mainn.png",
                    //     scale: 5.0,
                    //     onTap: () {
                    //       model.UpdateScreen(2);
                    //     },
                    //     currentIndex: model.SelectedScreen,
                    //     indexNumber: 2),

                    CustomBottomNavigarBar(
                        name: 'Tools',
                        image: "$staticAssets/tools.png",
                        onTap: () {
                          model.updatedScreen(3);
                        },
                        currentIndex: model.selectedScreen,
                        indexNumber: 3),

                    ///
                    /// MoreIcon Image
                    ///

                    // CustomBottomNavigarBar(
                    //     name: 'More',
                    //     image: "$staticAssets/MoreIcon.png",
                    //     onTap: () {
                    //       model.updatedScreen(4);
                    //     },
                    //     currentIndex: model.selectedScreen,
                    //     indexNumber: 4),
                  ],
                ),
              ),
              // GestureDetector(
              //   onTap: () {
              //     model.UpdatedScreen(1);
              //   },
              //   child: Container(
              //     alignment: Alignment.centerRight,
              //     child: Padding(
              //       padding: const EdgeInsets.only(right: 60),
              //       child: Image.asset(
              //         "$staticAssets/sms.png",
              //         scale: 3.0,
              //         color: model.selectedIndex == model.selectedScreen
              //             ? kGrayColor
              //             : kPrimaryColor,
              //       ),
              //     ),
              //   ),
              // ),

              ///
              /// Floating Action Button
              ///

              // Center(
              //   heightFactor: 0.2,
              //   child: FloatingActionButton(
              //     backgroundColor: primaryColor,
              //     onPressed: () {
              //       model.UpdateScreen(2);
              //     },
              //     child: Container(
              //       height: 62.h,
              //       width: 62.w,
              //       decoration: const BoxDecoration(
              //           shape: BoxShape.circle, color: primaryColor),
              //       child: Image.asset(
              //         "$logoIconsAssets/main.png",
              //         scale: 4.0,
              //       ),
              //     ),
              //   ),
              // )
            ],
          )
        ],
      ),
    ),
  );
}
