import 'time_data.dart';

class TaiikusaiDetailData {
  final String title;
  final String? info;
  final Time startTime;
  final bool showResult;

  const TaiikusaiDetailData({
    required this.title,
    this.info,
    required this.startTime,
    this.showResult = false,
  });
}

class TaiikusaiData {
  static const List<TaiikusaiDetailData> taiikusaiDataList = [
    TaiikusaiDetailData(
      title: "開場",
      startTime: Time(day: GakusaiDay.taiikusai, hour: 9, minute: 0),
    ),
    TaiikusaiDetailData(
      title: "ST",
      startTime: Time(day: GakusaiDay.taiikusai, hour: 9, minute: 45),
    ),
    TaiikusaiDetailData(
      title: "開会式",
      startTime: Time(day: GakusaiDay.taiikusai, hour: 10, minute: 0),
    ),
    TaiikusaiDetailData(
      title: "大玉転がし",
      info: "招集時間:学校祭実行委員長挨拶後\n人数:各クラス3人1組×4グループ 計12人\n3ブロック対抗×3＋決勝戦 計4試合\n各試合1位のチームが決勝に進む\nスタートの合図とともに3人1組でボールを転がし、\nコース中にあるコーンの周りを反時計回りに回って\nスタート位置に戻り、次のグループと交代する\n※注意事項と失格、トーナメント表は虎の巻参照",
      startTime: Time(day: GakusaiDay.taiikusai, hour: 10, minute: 30),
      showResult: true,
    ),
    TaiikusaiDetailData(
      title: "綱引き",
      info: "招集時間:大玉転がし2回戦後\n人数:各クラス 男子7人 女子7人 計14人\n※軍手持参必須(持参していない場合“失格”とする)\n男女別それぞれでトーナメントを行う 計16試合\n1試合20秒とする\n中央のマークを相手より自陣側に引き寄せたほう、\nまたは一定の距離まで引き寄せたブロックの勝利\n※注意事項と失格、トーナメント表は虎の巻参照",
      startTime: Time(day: GakusaiDay.taiikusai, hour: 11, minute: 0),
      showResult: true,
    ),
    TaiikusaiDetailData(
      title: "ブロリレ予選",
      info: "招集時間:綱引き➄試合終了後\n（綱引きトーナメント表参照）\n人数:各クラス 男子2人 女子2人 計4人\n3ブロック対抗×3試合\n奇数番走者が女子、\n偶数番走者が男子とする\n第1走者が50mを示すコーンを通り過ぎるまでは\nセパレートコース、それ以降はすべて\nオープンコースで行う\n※注意事項と失格、トーナメント表は虎の巻参照",
       startTime: Time(day: GakusaiDay.taiikusai, hour: 11, minute: 40),
       showResult: true,
    ),
    TaiikusaiDetailData(
      title: "昼休憩",
      startTime: Time(day: GakusaiDay.taiikusai, hour: 12, minute: 0),
    ),
    TaiikusaiDetailData(
      title: "マジクラ",
      info: "招集時間:12:40\n人数:各部活4人\nガチ部門男子、ガチ部門女子、\nパフォーマンス部門の3部門行う\nガチ部門は4×約116メートルリレー、\nパフォーマンス部門は4×約58mリレーとする\nガチ部門は第1走者が50メートルを示すコーンを過ぎるまではセパレートコース、\nそれ以降はすべてオープンコースで行う\nパフォーマンス部門はすべてオープンコースで行い、\n開始から1分半が経過した時点で終了する\nパフォーマンス部門は決勝戦を行わない\nパフォーマンス部門は事前に申請したものに限り\nバトン以外の道具をバトンとして使用することができる。\n※注意事項と失格、トーナメント表は虎の巻参照",
      startTime: Time(day: GakusaiDay.taiikusai, hour: 12, minute: 50),
      showResult: true,
    ),
    TaiikusaiDetailData(
      title: "玉入れ",
      info: "招集時間:マジクラ女子第1レース終了後\n人数:各クラス14人\n3ブロック対抗 計3試合\n前半開始前、球を1人2個ずつ持ちラインに並ぶ\n開始の合図で一斉に球を投げ、1ブロックでも全ての球が\n入り切った時点で試合を終了する\n全ての球が入ったタイミングで1位2位3位を決定する\n※注意事項と失格、トーナメント表は虎の巻参照",
      startTime: Time(day: GakusaiDay.taiikusai, hour: 13, minute: 20),
      showResult: true,
    ),
    TaiikusaiDetailData(
      title: "ブロパフォ",
      info:"招集時間:13:25\nパフォーマンス順\nグリーン→ピンク→レッド→パープル→ブルー\n→オレンジ→ブラック→イエロー→ホワイト\n観覧時の注意:\nパフォーマンスの妨害や危険な応援はしないこと\n声出しや拍手でパフォーマンスを盛り上げよう！\n※優勝決定方法は虎の巻参照",
      startTime: Time(day: GakusaiDay.taiikusai, hour: 13, minute: 35),
      showResult: true,
    ),
    TaiikusaiDetailData(
      title: "ブロリレ決勝",
      info:"招集時間:ブロパフォブラックブロック終了後\n予選を勝ち抜いた3ブロックで行う\nルールは予選と同様",
      startTime: Time(day: GakusaiDay.taiikusai, hour: 14, minute: 35),
      showResult: true,
    ),
    TaiikusaiDetailData(
      title: "閉会式",
      startTime: Time(day: GakusaiDay.taiikusai, hour: 14, minute: 45),
    ),
    TaiikusaiDetailData(
      title: "完全退場",
      startTime: Time(day: GakusaiDay.taiikusai, hour: 15, minute: 30),
    ),
  ];
}
