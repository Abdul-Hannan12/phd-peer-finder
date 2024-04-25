import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:phd_peer/core/others/base_view_model.dart';
import 'package:phd_peer/ui/screens/user_not_found/user_not_found_screen.dart';

class MainViewModel extends BaseViewModel {
  Duration elapsedTime = Duration.zero;
  Timer? timer;

  MainViewModel() {
    startTimer();
  }

  // Function to start the timer
  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    timer = Timer.periodic(oneSecond, (timer) {
      elapsedTime += oneSecond;
      notifyListeners();
      // Check if elapsed time is greater than or equal to 3 seconds
      if (elapsedTime.inMinutes >= 5) {
        // Stop the timer
        timer.cancel();
        // Navigate to another screen
        navigateToAnotherScreen();
      }
    });
    notifyListeners();
  }

  // Function to navigate to another screen
  void navigateToAnotherScreen() {
    // Get.to(() => ActiveCallScreen(
    //     userImg: "$dynamicAssets/user2.png", userName: 'Awais'));
    Get.to(() => const UserNotFoundScreen());
  }

  static const List<Color> gradientColors = [
    Color(0xffDB5614),
    Color(0xffE27A17),
    Color(0xffE69219),
  ];

  // Function to determine color based on percentage
  Color getColor(double percentage) {
    if (percentage < 33) {
      return gradientColors[0];
    } else if (percentage < 66) {
      return gradientColors[1];
    } else {
      return gradientColors[2];
    }
  }
}
