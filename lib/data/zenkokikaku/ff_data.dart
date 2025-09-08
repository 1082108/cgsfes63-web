import '../../../data/time_data.dart';

class FFDetailData {
  final String title;
  final Time startTime;

  const FFDetailData({required this.title, required this.startTime});
}

class FFData {
  static const List<FFDetailData> ffDataList = [
    FFDetailData(
      title: "思い出ムービー（歌会前）",
      startTime: Time(hour: 15, minute: 45, day: GakusaiDay.zenkokikaku),
    ),
    FFDetailData(
      title: "千種生の主張",
      startTime: Time(hour: 17, minute: 10, day: GakusaiDay.zenkokikaku),
    ),
    FFDetailData(
      title: "火文字点火",
      startTime: Time(hour: 17, minute: 20, day: GakusaiDay.zenkokikaku),
    ),
  ];
}
