import 'package:phd_peer/core/constants/strings.dart';
import 'package:phd_peer/core/model/user_messages.dart';
import 'package:phd_peer/core/others/base_view_model.dart';

class ChattingViewModel extends BaseViewModel {
  bool callLive = false;
  bool goPremium = true;
  onCallLive() {
    callLive = true;
    goPremium = false;
    notifyListeners();
  }

  onPremium() {
    callLive = false;
    goPremium = true;
    notifyListeners();
  }

  List<UserMessages> userMessageList = [
    UserMessages(
      userImgUrl: '$dynamicAssets/user2.png',
      userName: 'Awais khan',
      notficationNumbers: '2',
      online: false,
      notification: true,
    ),
    UserMessages(
      userImgUrl: '$dynamicAssets/user1.png',
      userName: 'Umair Merwat',
      online: true,
      notficationNumbers: '6',
      notification: false,
    ),
    UserMessages(
      userImgUrl: '$dynamicAssets/user3.png',
      userName: 'Nehri',
      online: true,
      notficationNumbers: '2',
      notification: false,
    ),
    UserMessages(
      userImgUrl: '$dynamicAssets/user4.png',
      userName: 'Atiqa',
      online: false,
      notficationNumbers: '3',
      notification: true,
    ),
    UserMessages(
      userImgUrl: '$dynamicAssets/user5.png',
      userName: 'Zainab C',
      online: false,
      notficationNumbers: '3',
      notification: false,
    ),
    UserMessages(
      userImgUrl: '$dynamicAssets/user6.png',
      userName: 'Romaisa',
      notficationNumbers: '2',
      online: false,
      notification: true,
    ),
  ];
}
