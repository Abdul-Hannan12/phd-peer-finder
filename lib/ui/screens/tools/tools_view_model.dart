import 'package:phd_peer/core/constants/strings.dart';
import 'package:phd_peer/core/model/conference.dart';
import 'package:phd_peer/core/model/live_channel.dart';
import 'package:phd_peer/core/model/study_partner.dart';
import 'package:phd_peer/core/others/base_view_model.dart';

class ToolsViewModel extends BaseViewModel {
  List<StudyPartner> studyPartnerList = [
    StudyPartner(
        imgUrl: '$dynamicAssets/user1.png',
        username: 'Awais, 1st',
        online: true),
    StudyPartner(
        imgUrl: '$dynamicAssets/user2.png',
        username: 'khan, 3rd',
        online: false),
    StudyPartner(
        imgUrl: '$dynamicAssets/user3.png',
        username: 'Zainab, 2nd',
        online: true),
    StudyPartner(
        imgUrl: '$dynamicAssets/user4.png',
        username: 'Umair, 4th',
        online: true),
    StudyPartner(
        imgUrl: '$dynamicAssets/user5.png',
        username: 'Nehri, 1st,',
        online: false),
    StudyPartner(
        imgUrl: '$dynamicAssets/user6.png',
        username: 'Romaisa, 3rd',
        online: true),
  ];

  List<Conference> conferenceList = [
    Conference(
      imgUrl: '$dynamicAssets/user7.png',
      username: 'Dr Liam O’Sudkncdjnwcjdnj, 1st',
    ),
    Conference(
      imgUrl: '$dynamicAssets/user2.png',
      username: 'Dr Awais khan',
    ),
    Conference(
      imgUrl: '$dynamicAssets/OIP 1.png',
      username: 'Tom Lennon',
    ),
    Conference(
      imgUrl: '$dynamicAssets/OIP 2.png',
      username: 'Joy Barrow',
    ),
    Conference(
      imgUrl: '$dynamicAssets/OIP 3.png',
      username: 'Dr Niamh Hayat,',
    ),
    Conference(
      imgUrl: '$dynamicAssets/user7.png',
      username: 'Romaisa',
    ),
  ];

  List<LiveChannel> liveChannelList = [
    LiveChannel(
      imgUrl: '$dynamicAssets/img1.png',
      username: 'Critique',
    ),
    LiveChannel(
      imgUrl: '$dynamicAssets/img2.png',
      username: 'Scribophile',
    ),
    LiveChannel(
      imgUrl: '$dynamicAssets/img3.png',
      username: 'Underlined',
    ),
    LiveChannel(
      imgUrl: '$dynamicAssets/img4.png',
      username: 'Litereature',
    ),
    LiveChannel(
      imgUrl: '$dynamicAssets/img1.png',
      username: 'Scribophile,',
    ),
    LiveChannel(
      imgUrl: '$dynamicAssets/img3.png',
      username: 'Critique',
    ),
  ];
}
