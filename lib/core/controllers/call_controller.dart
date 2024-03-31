import 'package:firebase_messaging/firebase_messaging.dart';
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

  CallService _api = CallService();

  Future<String?> getCallToken() async {
    try {
      final String authToken = userBox.get('token');
      final String fcmToken = await getFcmToken() ?? '';
      final res = await _api.logCallApi(authToken, fcmToken);
      print(res);
    } catch (e) {
      print(e.toString());
    }
  }
}
