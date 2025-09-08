class UtakaiDetailData {
  final String title;
  final String imgPath;
  final String pr;
  final String time;

  const UtakaiDetailData({
    required this.title,
    required this.time,
    required this.pr,
    required this.imgPath,
    
  });
}

class UtakaiData {
  static const List<UtakaiDetailData> utakaiDataList = [
    UtakaiDetailData(
        title: "ZOE",
        time:"第1部",
        pr: "はじめましてZOEです🎸\n国教一年生の初心者5人で組んでいるガールズバンドです🎶\nまだまだ未熟ですがたくさん練習したので、\nファーストライブ一緒に楽しんでくれると嬉しいです🔥",
        imgPath: "assets/images/utakai/zoe.jpg"),
    UtakaiDetailData(
        title: "ふりむん",
        time:"第1部",
        pr: "この夏1番ヤバくなれるのは誰だ!!!!",
        imgPath: "assets/images/utakai/hurimun.jpg"),
    UtakaiDetailData(
        title: "AnotherColor",
        time:"第2部",
        pr: "歌会2部のトップバッターを務めます、AnotherColorです!\nガールズバンドの魅力を前面に出しつつ、かっこいい演奏でみなさんを虜にします♡\nみなさんに歌ってもらう部分もあるので全力で声出して盛り上がってくださいね🔥🔥",
        imgPath: "assets/images/utakai/Anoter Color.jpg"),
    UtakaiDetailData(
      time:"第2部",
        title: "シャキシャキレタスサラダ",
        pr: "全校生徒全員を楽しませます!\n盛り上がっていきましょ-!!",
        imgPath: "assets/images/utakai/shakishaki.jpg"),
    UtakaiDetailData(
        time:"テーマソング",
        title: "ワスレナ",
        pr: "今年度の歌会テーマソングを担当させていただく バンド ワスレナです\n改めてテーソングに選んでいただけたことうれしく思います!\n1年間のハイライトである学祭は\nどんな立ち位置でもどんな心持ちで臨んでも\n何が起きても何も起きなくても1度きりであること\nそれらを総じて「忘れないで居よう」と掲げるべく\n精一杯演奏します!最後まで盛り上がりまくりましょう!",
        imgPath: "assets/images/utakai/wasurena.jpg"),
  ];
}
    