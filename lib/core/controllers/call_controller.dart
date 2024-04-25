import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:phd_peer/data/services/call_service/call_service.dart';

import '../constants/hive_boxes.dart';

class CallController extends GetxController {
  static final CallController instance = Get.find();

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
