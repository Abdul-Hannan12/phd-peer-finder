import 'package:flutter/material.dart';
import 'package:phd_peer/core/model/messages.dart';
import 'package:phd_peer/core/others/base_view_model.dart';

class NewChatViewModel extends BaseViewModel {
  bool isMe = false;
  TextEditingController messageController = TextEditingController();

  List<Message> messages = [];
}
