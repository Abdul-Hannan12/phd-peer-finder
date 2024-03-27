import 'package:flutter/material.dart';
import 'package:phd_peer/core/others/base_view_model.dart';

class SignUpViewModel extends BaseViewModel {
  final fmkey = GlobalKey<FormState>();
  bool isChecked = false;
  bool isVisible = true;
  Color checkboxColor = Colors.yellow;
  bool isConfirmVisible = true;

  onClick() {
    isChecked = !isChecked;
    notifyListeners();
  }

  toggleVisibilty() {
    isVisible = !isVisible;
    notifyListeners();
  }

  confirmToggleVisibilty() {
    isConfirmVisible = !isConfirmVisible;
    notifyListeners();
  }
}
