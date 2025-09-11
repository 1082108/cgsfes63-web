class EventMerchandiseDetailData {
  final String title;
  final int price;
  final String imgPath;

  const EventMerchandiseDetailData({
    required this.title,
    required this.price,
    required this.imgPath,
  });
}

class SonotaData {
  static const String saikoshiInfo = "お得な商品が楽しめる再煌市が文化祭にて開催！\n準備から運営まで全て生徒が手掛けます。\n是非遊びに来てください！\n掘り出し物が見つかるかも！？\n再煌市と学祭グッズの販売はメインストリートへGO!!";
  static const List<EventMerchandiseDetailData> eventMerchandiseList = [
    EventMerchandiseDetailData(
      title: "タオル",
      price: 1200,
      imgPath: "assets/images/bunkasai/sonota/towel1.png",
    ),
    EventMerchandiseDetailData(
      title: "キーホルダー",
      price: 300,
      imgPath: "assets/images/bunkasai/sonota/keyholder2.png",
    ),
    EventMerchandiseDetailData(
      title: "ステッカー",
      price: 100,
      imgPath: "assets/images/bunkasai/sonota/sticker3.png",
    ),
    EventMerchandiseDetailData(
      title: "ボールペン",
      price: 200,
      imgPath: "assets/images/bunkasai/sonota/ballpoint pen4.png",
    ),
    EventMerchandiseDetailData(
      title: "ラバーバンド",
      price: 300,
      imgPath: "assets/images/bunkasai/sonota/band5.png",
    ),  
  ];
  static const String chigumaInfo = "PTA主催「ちぐCafe」:サブストリート（109前）\n同窓会企画：中セミ1（中館1階）";
}


