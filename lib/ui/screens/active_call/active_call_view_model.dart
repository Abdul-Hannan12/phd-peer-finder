import 'dart:async';
import 'package:get/get.dart';
import 'package:phd_peer/core/constants/strings.dart';
import 'package:phd_peer/core/others/base_view_model.dart';
import 'package:phd_peer/ui/screens/chat_user/chat_user_screen.dart';

class ActiveCallViewModel extends BaseViewModel {
  bool _isCorrectClicked = true;
  bool get isCorrectClicked => _isCorrectClicked;

  // Countdown timer variables
  int _countdownSeconds = 300;
  late Timer _countdownTimer;

  ActiveCallViewModel() {
    startCountdownTimer();
  }

  // Function to update the state of isCorrectClicked
  void updateCorrectClicked(bool value) {
    _isCorrectClicked = value;
    notifyListeners();
  }

  // Function to start the countdown timer
  void startCountdownTimer() {
    const oneSecond = Duration(seconds: 1);
    _countdownTimer = Timer.periodic(oneSecond, (timer) {
      // Decrement the countdown seconds
      _countdownSeconds--;

      // Check if the countdown is complete
      if (_countdownSeconds <= 0) {
        // Cancel the timer
        _countdownTimer.cancel();
        // Navigate back
        navigateBack();
      }

      notifyListeners();
    });
  }

  // Function to navigate back
  void navigateBack() {
    Get.to(() =>
        ChatUserScreen(userImg: '$dynamicAssets/user2.png', userName: 'Awais'));
  }

  // Function to get the remaining countdown time
  String getRemainingTime() {
    int minutes = _countdownSeconds ~/ 60;
    int seconds = _countdownSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
