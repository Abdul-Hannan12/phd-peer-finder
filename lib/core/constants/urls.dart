const String baseUrl = 'https://phd-peer.nw.r.appspot.com';

String url(String endpoint) {
  return baseUrl + endpoint;
}

String getUserApiUrl = url("/user/"); //:uid
String updateUserApiUrl = url("/user/profile/update");
String callRequestApiUrl = url("/callrequest");
String matchApiUrl = url("/matchwith");
String getChatApiUrl = url("/chat");
String sendMessageApiUrl = url("/chat/message");
