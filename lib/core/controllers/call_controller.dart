import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:phd_peer/data/services/call_service/call_service.dart';

import '../constants/hive_boxes.dart';

class CallController extends GetxController {
  static final CallController instance = Get.find();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<String?> getFcmToken() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    return fcmToken;
  }

  final CallService _api = CallService();

  Future<Map<String, dynamic>?> getCallDocumentIdResponse() async {
    try {
      final String authToken = userBox.get('token');
      final res = await _api.logCallApi(authToken);
      print(res);
      return res;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }
}
