class BukatsuDetailData {
  final String club;
  final String place;
  final String pr;
  final String imgPath;

  const BukatsuDetailData({
    required this.club,
    required this.place,
    required this.pr,
    required this.imgPath,
  });
}

class BukatsuData {
  static const List<BukatsuDetailData> bukatsuDataList = [
    BukatsuDetailData(
      club: "[合同企画]文化部",
      place: "学校のどこか 形式:スタンプラリー 文化祭中常に公開",
      pr: "文化部が協力して、\n部活にゆかりのある場所を巡るスタンプラリーを作りました。ぜひ校内を巡りながらスタンプを集めてみてくださいね!",
      imgPath: "assets/images/bunkasai/bukatsu/bunka.jpg",
    ),
    BukatsuDetailData(
      club: "華道部",
      place: "美術室 形式:展示 文化祭中常に公開",
      pr: "お花を展示します🎶ぜひ来てください!",
      imgPath: "assets/images/bunkasai/bukatsu/Kadou.jpg",
    ),
    BukatsuDetailData(
      club: "写真部",
      place: "工作室 形式:展示 文化祭中常に公開",
      pr: "たくさんのご来場をお待ちしております!",
      imgPath: "assets/images/bunkasai/bukatsu/Shashin.jpg",
    ),
    BukatsuDetailData(
      club: "水泳部",
      place: "生物室  形式:紹介動画 文化祭中常に公開",
      pr: "休憩所で練習風景の動画流してます!!ぜひ来てくださいがてら""\n休憩がてら見に来てください!!",
      imgPath: "assets/images/bunkasai/bukatsu/Suiei.jpg",
    ),
    BukatsuDetailData(
      club: "演劇部",
      place: "体育館 形式:上演 15日14:45~15:45",
      pr: "夏の大会と同じく「ペトリコール」を上演します。\n文学作品や人間関係を通し、「再生」を描いた物語です。3年演劇の後は是非ちぐげきをご覧下さい。",
      imgPath: "assets/images/bunkasai/bukatsu/engeki.jpg",
    ),
    BukatsuDetailData(
      club: "クイズ研究同好会",
      place: "東館1セミ 形式:クイズ体験 9/14(日) 12:00〜14:00  9/15(月) 13:00〜16:00",
      pr: "出入り自由です！初心者も大歓迎！お待ちしております！",
      imgPath: "assets/images/bunkasai/bukatsu/Kuizu.jpg",
    ),BukatsuDetailData(
      club: "美術部",
      place: "美術室 形式:アート体験 14日 15日 11~16時",
      pr: "一筆いれるだけ!\n皆で作品を作ってみませんか?\n休憩室としても利用できます!",
      imgPath: "assets/images/bunkasai/bukatsu/bizyutsu.jpg",
    ),
    BukatsuDetailData(
      club: "ダンス部",
      place: "バレーコート 形式:パフォーマンス 15日11:30~",
      pr: "RaGGACraZe 21st, 22ndです!!\n9月15日11時30分~、バレーコートにて、21stは学年曲メドレー、22ndは学年曲を披露させていただきます!\nたくさんの手拍子や声援で応援していただけると嬉しいです!!",
      imgPath: "assets/images/bunkasai/bukatsu/Dansu.jpg",
    ),
    BukatsuDetailData(
      club: "アカペラ部",
      place: "サブストリート東 形式:ミニライブ 15日10:30~",
      pr: "皆さんが知っているあの曲を、アカペラでカバーします!ぜひ聴きに来てください♪",
      imgPath: "assets/images/bunkasai/bukatsu/akapera.jpg",
    ),
    BukatsuDetailData(
      club: "文芸部",
      place: "クイズ研究部部室横(生徒会室横) 形式:展示 文化祭中常に公開",
      pr: "今年も部誌配布を行います!\nさらに、「伊勢物語」から引用した和歌を乗せた\n「伊勢みくじ」も行います!\n軽い気持ちでぜひ引いてみてくださいね♪",
      imgPath: "assets/images/bunkasai/bukatsu/bungebu.jpg",
    ),
  ];
}
