import '../time_data.dart';

class YushiDetailData {
  final String title;
  final Time startTime;
  final String place;
  final String imgPath;
  final String pr;

  const YushiDetailData({
    required this.title,
    required this.startTime,
    required this.place,
    required this.imgPath,
    required this.pr,
    
  });
}

class YushiData {
  static const List<YushiDetailData> yushiDataList = [
    YushiDetailData(
      title: "ひとひと",
      startTime: Time(day: GakusaiDay.bunkasai1, hour: 11, minute: 0),
      place: "視聴覚室",
      imgPath: "assets/images/bunkasai/yushi/hitohito.png",
      pr:"ひとひとです♫\nアカペラ部でたくさん歌ってきた、歌うの大好きひとひとがこのたびソロでミニライブをします。\n人気の曲からオリジナル曲まで盛りだくさんの30分!\n文化祭1日目 at視聴覚室 9/14(日)11:00~\nひとりひとりに届くように歌います✨🎤 お楽しみに!!",
    ),
    YushiDetailData(
      title: "Reclix",
      startTime: Time(day: GakusaiDay.bunkasai1, hour: 11, minute: 0),
      place: "メインストリート",
      imgPath: "assets/images/bunkasai/yushi/Reclix.png",
      pr:"まだポピュラーなものではないけれど、楽しんでいただけるように頑張ります!!",
    ),
    YushiDetailData(
      title: "MGRL",
      startTime: Time(day: GakusaiDay.bunkasai1, hour: 11, minute: 30),
      place: "メインストリート",
      imgPath: "assets/images/bunkasai/yushi/MGRL.png",
      pr:"63rd男子部活のマネの有志が集まったMGRLです!\n6人でダンスを踊ります。\n予定があいにくい中でも頑張ったので、ぜひ見に来てください!!\n（ぜひコールなどでも盛り上げてほしいです!）",
    ),
    YushiDetailData(
      title: "上野千夏",
      startTime: Time(day: GakusaiDay.bunkasai1, hour: 12, minute: 0),
      place: "視聴覚室",
      imgPath: "assets/images/bunkasai/yushi/uenochinatsu.png",
      pr:"高校生になって、初めての文化祭。\nなにかできることは無いか、私でも盛り上げれるのかな、\nそう考えて有志発表に挑戦しました！\n是非聞きに来てください！",
    ),
    YushiDetailData(
      title: "K!CK＆JOY",
      startTime: Time(day: GakusaiDay.bunkasai1, hour: 13, minute: 30),
      place: "視聴覚室",
      imgPath: "assets/images/bunkasai/yushi/K!CK＆JOY.png",
      pr:"こんにちは! K!CK＆JOYです!\nポップでロックなKICKと\nパワーアップして帰ってきたJOYで\nみんなをとりこにしちゃいます!\n明るく元気にパワフルに踊ります!",
    ),
    YushiDetailData(
      title: "ちぎりぱん",
      startTime: Time(day: GakusaiDay.bunkasai1, hour: 14, minute: 0),
      place: "視聴覚室",
      imgPath: "assets/images/bunkasai/yushi/chigiripan.png",
      pr:"ちぎりぱんです。\n映画の名曲をバイオリンでお届け！",
    ),
    YushiDetailData(
      title: "V!VA",
      startTime: Time(day: GakusaiDay.bunkasai1, hour: 14, minute: 30),
      place: "メインストリート",
      imgPath: "assets/images/bunkasai/yushi/V!VA.png",
      pr:"個性あふれる7人が全力で踊り狂います!🔥ぜひ見に来てください!!\nメンストで待ってます!✨",
    ),
    YushiDetailData(
      title: "17タッチ",
      startTime: Time(day: GakusaiDay.bunkasai1, hour: 15, minute: 0),
      place: "メインストリート",
      imgPath: "assets/images/bunkasai/yushi/17tach.png",
      pr:"ちぐっこ合体プロジェクト!!\n全員参加で、メンストで合唱します!!\nもう二度と味わえない、仲間との合唱です!みーんな誘って、巻き込んで、音と、隣にいる仲間と一体化しましょう!",
    ),
    YushiDetailData(
      title: "CGS48",
      startTime: Time(day: GakusaiDay.bunkasai2, hour: 11, minute: 0),
      place: "メインストリート",
      imgPath: "assets/images/bunkasai/yushi/CGS48.png",
      pr:"✨CGS48 最後の伝説✨\n千種高校が誇るトップアイドル、CGS48のラストステージ。\n9月15日11:00\nその瞬間を、あなたは一生忘れない。\nこれは卒業ライブ、\nいや…伝説の幕引きだ。\n千種、永遠の11時\nこの瞬間を見逃したら一生後悔する。\n9月15日11:00\n千種高校 メンスト",
    ),
    YushiDetailData(
      title: "Solstice Solfege",
      startTime: Time(day: GakusaiDay.bunkasai2, hour: 11, minute: 30),
      place: "視聴覚室",
      imgPath: "assets/images/bunkasai/yushi/Solstice Solfege.png",
      pr:"絶対に来てください",
    ),
     YushiDetailData(
      title: "4u",
      startTime: Time(day: GakusaiDay.bunkasai2, hour: 11, minute: 30),
      place: "メインストリート",
      imgPath: "assets/images/bunkasai/yushi/4u.png",
      pr:"かのんとののでガールズを踊ります。観客を魅了できるように頑張ります!",
    ),
    YushiDetailData(
      title: "Yukky",
      startTime: Time(day: GakusaiDay.bunkasai2, hour: 12, minute: 0),
      place: "メインストリート",
      imgPath: "assets/images/bunkasai/yushi/yukky.png",
      pr:"こんにちは!Yukkyです!\n暑い中ですが、みんなで楽しみましょー!!ぜひ来てね!!",
    ),
    YushiDetailData(
      title: "Pace Wolf",
      startTime: Time(day: GakusaiDay.bunkasai2, hour: 13, minute: 30),
      place: "視聴覚室",
      imgPath: "assets/images/bunkasai/yushi/Pace Wolf.png",
      pr:"Whatever is fineさんとの対バンライブです。3曲やります\n演奏曲のヒントは左の文に隠れてます。",
    ),
    YushiDetailData(
      title: "Suger Melody",
      startTime: Time(day: GakusaiDay.bunkasai2, hour: 13, minute: 30),
      place: "メインストリート",
      imgPath: "assets/images/bunkasai/yushi/Suger Melody.png",
      pr:"うちわ・ペンライト・掛け声などでたくさん盛り上げてほしいです✨撮影可能です◎!!\n大きな声援をおねがいします♡♡♡\n9/15(月)13:30~14:00 メインストリート\n文化祭発表会の作品に加えて、\nキスミーパティシエ、アイドルライフスターターパックを披露します!\n是非見に来てください♡",
    ),
    YushiDetailData(
      title: "Whatever is fine",
      startTime: Time(day: GakusaiDay.bunkasai2, hour: 14, minute: 0),
      place: "視聴覚室",
      imgPath: "assets/images/bunkasai/yushi/whatever is fine.png",
      pr:"whatever is fine × Pace Wolfの対バンです。Jpopをカバーします。",
    ),
    YushiDetailData(
      title: "cherry charm",
      startTime: Time(day: GakusaiDay.bunkasai2, hour: 14, minute: 0),
      place: "メインストリート",
      imgPath: "assets/images/bunkasai/yushi/cherry charm.png",
      pr:"cherry charmです🍒\n可愛いダンスでメロメロにさせちゃいます♡当日お待ちしています!",
    ),
    YushiDetailData(
      title: "Day Trippers",
      startTime: Time(day: GakusaiDay.bunkasai2, hour: 14, minute: 30),
      place: "視聴覚室",
      imgPath: "assets/images/bunkasai/yushi/Day Trippers.png",
      pr:"1年生バンド Day Trippersの初ライブ!\n演奏曲は「怪獣の花唄」と「飛行艇」🎶視聴覚室で待ってます! ",
    ),
    YushiDetailData(
      title: "Fab.",
      startTime: Time(day: GakusaiDay.bunkasai2, hour: 14, minute: 30),
      place: "メインストリート",
      imgPath: "assets/images/bunkasai/yushi/Fab..png",
      pr:"皆さんこんにちは!\n千種高校アカペラ部15th同期バンドのFab.です。\nハモネプハイスクールで演奏した2曲を演奏します!\n去年の4月から始まった活動の全てを込めます!是非いらしてください!",
    ),
    YushiDetailData(
      title: "Marlone",
      startTime: Time(day: GakusaiDay.bunkasai2, hour: 15, minute: 0),
      place: "メインストリート",
      imgPath: "assets/images/bunkasai/yushi/Marlone.png",
      pr:"3年生5人で結成されたMarlone。\nちょっと昔の名曲バラードや、みんなで歌いたいRADWIMPSの名曲を、\nアカペラでみなさんにお届けします。\nこの5人で約1年間、たくさん練習してきて、集大成となる今回の発表。\n私たちのアカペラでみなさんの心を\n少しでも動かすことができたらうれしいです!\nそのためにも私たちらしく、一生懸命に歌わせていただきます。",
    ),
  ];
}