import '../time_data.dart';

class EngekiDetailData {
  final String hr;
  final String title;
  final String pr;
  final String imgPath;
  final String soukanImgPath;
  final Time startTime;
  final Time endTime;

  const EngekiDetailData({
    required this.hr,
    required this.title,
    required this.pr,
    required this.imgPath,
    required this.soukanImgPath,
    required this.startTime,
    required this.endTime,
  });
}

class EngekiData {
  static const List<EngekiDetailData> engekiDataList = [
    EngekiDetailData(
      hr: "301",
      title: "魔法にかけられて",
      pr: "おとぎの国『アンダレーシア』のジゼルが\n現代ニューヨークに!?\nそこはおとぎ話とは真逆の世界…\nコメディー🎭ロマンス💖アクション💥\nが詰まった物語をぜひ見に来てください!!",
      imgPath: "assets/images/bunkasai/engeki/301-1.jpg",
      soukanImgPath: "assets/images/bunkasai/engeki/301-2.jpg",
      startTime: Time(day: GakusaiDay.bunkasai1, hour: 12, minute: 50),
      endTime: Time(day: GakusaiDay.bunkasai1, hour: 14, minute: 15),
    ),
    EngekiDetailData(
      hr: "302",
      title: "バック・トゥ・ザ・フューチャー",
      pr: "高校生マーティが奇才博士ドクと出会い、\n予測不能な冒険へ…\n時をこえる物語が、想像をこえる形で舞台に現れる!!",
      imgPath: "assets/images/bunkasai/engeki/302-1.jpg",
      soukanImgPath: "assets/images/bunkasai/engeki/302-2.png",
      startTime: Time(day: GakusaiDay.bunkasai1, hour: 14),
      endTime: Time(day: GakusaiDay.bunkasai1, hour: 15, minute: 25),
    ),
    EngekiDetailData(
      hr: "303",
      title: "塔の上のラプンツェル",
      pr: "これは、大泥棒フリン・ライダーが、\n本当の名前を取り戻すまでの物語。\n…と言っても、主人公は彼ではない。\nこの話の主人公は、長い長い魔法の髪を持つ少女、ラプンツェル。\n大昔、太陽の雫が大地に落ちて花を咲かせたところから、この物語は始まる。",
      imgPath: "assets/images/bunkasai/engeki/303-1.jpg",
      soukanImgPath: "assets/images/bunkasai/engeki/303-2.jpg",
      startTime: Time(day: GakusaiDay.bunkasai1, hour: 11, minute: 40),
      endTime: Time(day: GakusaiDay.bunkasai1, hour: 13, minute: 05),
    ),
    EngekiDetailData(
      hr: "304",
      title: "天気の子",
      pr: "「青空よりも、俺は陽菜がいい!!」\n『天気の子』は、\n主人公の帆高と不思議な力を持つ陽菜によって繰り広げられます。\n帆高と陽菜はどんな運命を選ぶのか...\n天気を表現する様々な演出と、\n最後のグランドエスケープのダンスに注目です!!!!",
      imgPath: "assets/images/bunkasai/engeki/304-1.jpg",
      soukanImgPath: "assets/images/bunkasai/engeki/304-2.jpg",
      startTime: Time(day: GakusaiDay.bunkasai1, hour: 10, minute: 30),
      endTime: Time(day: GakusaiDay.bunkasai1, hour: 11, minute: 55),
    ),
    EngekiDetailData(
      hr: "305",
      title: "リメンバー・ミー",
      pr: "それは、時を越えて家族をつなぐ、\n奇跡の歌。\n305が贈る『リメンバー・ミー』は、笑いあり冒険ありの、心に響く家族の物語。\n過去の悲しい出来事がきっかけで「音楽禁止」という厳しい掟がある家に生まれた、\nミュージシャンを夢見る少年・ミゲルは、先祖たちが暮らす「死者の国」へ冒険に出る。\n彼はそこで、嘘つきだが憎めないヘクターと友達になる。\nヘクターの助けを借り、ミゲルは先祖の驚くべき「秘密」を解き明かすことになる。",
      imgPath: "assets/images/bunkasai/engeki/305-1.jpg",
      soukanImgPath: "assets/images/bunkasai/engeki/305-2.jpg",
      startTime: Time(day: GakusaiDay.bunkasai2, hour: 12, minute: 10),
      endTime: Time(day: GakusaiDay.bunkasai2, hour: 13, minute: 35),
    ),
    EngekiDetailData(
      hr: "306",
      title: "ゾンビーズ",
      pr: "壁の向こうに閉じ込められてきたゾンビたち、ついに人間の学校へ!\nそこで出会ったゾンビのゼッドと\n人間のアディソン、立場の違いを越える恋の予感――\n果たして二人の運命は？\n青春×音楽×ミュージカル、必見のステージ!",
      imgPath: "assets/images/bunkasai/engeki/306-1.png",
      soukanImgPath: "assets/images/bunkasai/engeki/306−2.jpg",
      startTime: Time(day: GakusaiDay.bunkasai2, hour: 11),
      endTime: Time(day: GakusaiDay.bunkasai2, hour: 12, minute: 25),
    ),
    EngekiDetailData(
      hr: "307",
      title: "グレイテストショーマン",
      pr: "時は19世紀半ばのニューヨーク。ひとりの\n貧しい男が世界一の興行師を夢見て、\nユニークな仲間とともに最高のサーカスを\n作り上げる物語。\n「さあ、ショーの開演だ！！」",
      imgPath: "assets/images/bunkasai/engeki/307-1.jpg",
      soukanImgPath: "assets/images/bunkasai/engeki/307-2.png",
      startTime: Time(day: GakusaiDay.bunkasai2, hour: 9, minute: 50),
      endTime: Time(day: GakusaiDay.bunkasai2, hour: 11, minute: 15),
    ),
    EngekiDetailData(
      hr: "308",
      title: "インサイドヘッド",
      pr: "いつでも笑っていたいのに、\nどうして悲しみが込み上げてくるんだろう。\nこれは、あなたの物語ー\n涙も笑顔も、不安も喜びも、すべてが\nあなただけの大切な思い出になります。",
      imgPath: "assets/images/bunkasai/engeki/308-1.jpg",
      soukanImgPath: "assets/images/bunkasai/engeki/308-2.png",
      startTime: Time(day: GakusaiDay.bunkasai2, hour: 13, minute: 20),
      endTime: Time(day: GakusaiDay.bunkasai2, hour: 14, minute: 45),
    ),
    EngekiDetailData(
      hr: "309",
      title: "ズートピア",
      pr: "ここは、動物たちが人間のように暮らす\n”楽園”、ズートピア。\nしかしそんな平和な地で今史上最大の危機が訪れていた...\n誰もが夢を叶えられる理想の大都会に夢見る新米警察官のジュディは、夢を忘れたサギ師\nニックを相棒に、ズートピアに仕掛けられた恐るべき陰謀に挑む。\n最も相棒にふさわしくない二人は互いに\nダマしダマされながら、奇跡を起こすことはできるのか,,,",
      imgPath: "assets/images/bunkasai/engeki/309-1.jpg",
      soukanImgPath: "assets/images/bunkasai/engeki/309-2.jpg",
      startTime: Time(day: GakusaiDay.bunkasai1, hour: 15, minute: 10),
      endTime: Time(day: GakusaiDay.bunkasai1, hour: 16, minute: 35),
    ),
  ];
}
