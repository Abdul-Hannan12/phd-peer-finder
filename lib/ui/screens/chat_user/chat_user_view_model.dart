import 'package:flutter/material.dart';
import 'package:phd_peer/core/model/messages.dart';
import 'package:phd_peer/core/others/base_view_model.dart';

class ChatUserViewModel extends BaseViewModel {
  bool isMe = false;
  TextEditingController messageController = TextEditingController();

  List<Message> messages = [
    Message(
        messageId: '1',
        fromUserId: '1',
        toUserId: '1',
        textMessage:
            'I emailed you the updated version, just a few minor tweaks.',
        sendAt: DateTime.now()),
    Message(
        messageId: '1',
        fromUserId: '4',
        toUserId: '1',
        textMessage: 'Perfect, no rush',
        sendAt: DateTime.now()),
    Message(
        messageId: '1',
        fromUserId: '1',
        toUserId: '2',
        textMessage:
            'Running it now, will update you once I validate itdefrfewdew',
        sendAt: DateTime.now()),
    Message(
        messageId: '3',
        fromUserId: '3',
        toUserId: '3',
        textMessage:
            'Hi Ryan, did you get a chance to look at that model I sent you?',
        sendAt: DateTime.now()),
  ];
}
