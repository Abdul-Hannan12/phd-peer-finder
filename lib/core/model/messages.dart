class Message {
  String? messageId;
  String? fromUserId;
  String? toUserId;
  String? textMessage;
  DateTime? sendAt;
  String? type;
  bool? isSendNotification;

  Message({
    this.fromUserId,
    this.messageId,
    this.sendAt,
    this.textMessage,
    this.toUserId,
    this.type,
    this.isSendNotification,
  });

  Message.fromJson(json, id) {
    messageId = id;
    fromUserId = json["fromUserId"];
    toUserId = json["toUserId"];
    textMessage = json["textMessage"] ?? "";
    sendAt = json["sendAt"].toDate();
    type = json["type"];
  }

  toJson() {
    return {
      "fromUserId": fromUserId,
      "toUserId": toUserId,
      "textMessage": textMessage,
      "sendAt": sendAt,
      "type": type,
      "isSendNotification": isSendNotification,
    };
  }
}
