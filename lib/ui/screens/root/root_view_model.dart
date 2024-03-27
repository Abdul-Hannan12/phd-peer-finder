// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:phd_peer/core/enums/view_state.dart';
import 'package:phd_peer/core/others/base_view_model.dart';
import 'package:phd_peer/ui/screens/chat/chat_screen.dart';
import 'package:phd_peer/ui/screens/home/home_screen.dart';
import 'package:phd_peer/ui/screens/main/main_screen.dart';
import 'package:phd_peer/ui/screens/new_chat/new_chat.dart';
import 'package:phd_peer/ui/screens/tools/tools_screen.dart';

class RootScreenViewModel extends BaseViewModel {
  int selectedScreen = 0;

  RootScreenViewModel(val) {
    updatedScreen(val);
    notifyListeners();
  }

  List<Widget> allScreen = [
    const HomeScreen(),
    const ChattingScreen(),
    const MainScreen(),
    const ToolsScreen(),
    NewChatScreen(
      userName: 'Awais',
    ),
  ];

  updatedScreen(int index) {
    setState(ViewState.busy);
    selectedScreen = index;
    setState(ViewState.idle);
    // selectIndex = index;
    notifyListeners();
  }
}

class SettingScreen {}
