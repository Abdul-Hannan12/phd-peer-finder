class UserMessages {
  String? id;
  String? userName;
  String? userImgUrl;
  String? notficationNumbers;
  bool? online;
  bool? notification;

  UserMessages(
      {this.userName,
      this.userImgUrl,
      this.notficationNumbers,
      this.online = false,
      this.notification = false});
}
