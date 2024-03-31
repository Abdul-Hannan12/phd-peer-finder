import 'package:phd_peer/core/constants/urls.dart';
import 'package:phd_peer/data/network/network_api_service.dart';

class CallService {
  final NetworkApiServices _api = NetworkApiServices();

  Future<Map<String, dynamic>> logCallApi(
      String authToken, String fcmToken) async {
    Map<String, dynamic> res = await _api.postApi(
      {"fcmToken": fcmToken},
      callRequestApiUrl,
      isAuth: true,
      token: authToken,
    );
    return res;
  }
}
