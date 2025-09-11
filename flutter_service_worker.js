'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"manifest.json": "7c349e466ca64bafe4e02d62374a12f0",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"main.dart.js": "57c709fad61a54b08da44fe073fa3432",
"version.json": "6ab59aec0dc29d28846c6f8ee1d3b2da",
"assets/NOTICES": "c302f395994928e1b91d3f5645f74873",
"assets/fonts/MaterialIcons-Regular.otf": "5d8b9e6114f61a98cb8347f3af1311be",
"assets/AssetManifest.json": "3e078f4d00d500bedbe1b629f4a8ed6d",
"assets/assets/fonts/NotoSansJP-Medium.otf": "d6c74d39a44c519ff736ac55e5d28a46",
"assets/assets/fonts/NotoSansJP-Bold.otf": "e463c4b3a2d7fbfb917831767da8c24f",
"assets/assets/fonts/NotoSansJP-Light.otf": "137761c9e4b05edc375b06c256e9b65a",
"assets/assets/fonts/NotoSansJP-Black.otf": "5ce4631ec833cd0011936d5653fbd144",
"assets/assets/fonts/NotoSansJP-Thin.otf": "e2b92248795c0cd02d9858aaf2a12ec2",
"assets/assets/fonts/NotoSansJP-Regular.otf": "ecfed48e463db4e31d1691c8af367730",
"assets/assets/audio/wasurenagusa.wav": "6d98553173b89ee7fdd605d373edc2bd",
"assets/assets/images/utakai/Anoter%2520Color.jpg": "03657e637843c47ec0e4d4d8b57c6302",
"assets/assets/images/utakai/wasurena.jpg": "e949e4166c77a335b91605ed73c3ace1",
"assets/assets/images/utakai/shakishaki.jpg": "55c152d06216d3a42096d795e864792f",
"assets/assets/images/utakai/zoe.jpg": "7056b685a18aea85e5e508924fc083d8",
"assets/assets/images/utakai/hurimun.jpg": "a5b9a33a4b307b9e52203d6dca565c5d",
"assets/assets/images/map.png": "4d249c7b5605796c7fc77a1b866d1e39",
"assets/assets/images/zenkou/sanbon/%25E2%2591%25A2.png": "78dc95412b96ff2b69a1dea511f31cbb",
"assets/assets/images/zenkou/sanbon/%25E2%2591%25A4.png": "dc94cf1ce304fc3015d3093415cb1d2f",
"assets/assets/images/zenkou/sanbon/%25E3%2589%2593.png": "f12b6b31c3abd97764ed6f66ae9305b8",
"assets/assets/images/zenkou/sanbon/%25E3%2589%2592.png": "a627a91e6615e7a0a5c51e6a3da97a92",
"assets/assets/images/zenkou/sanbon/%25E2%2591%25AD.png": "824b95fbb6d8c01f1c56dd5ac369dbc3",
"assets/assets/images/zenkou/sanbon/%25E3%2589%2591.png": "caf5487cc8ba5f64941c1159cfda7104",
"assets/assets/images/zenkou/sanbon/%25E2%2591%25AF.png": "c5af6f80fbce9c598e0dfa14e25d4356",
"assets/assets/images/zenkou/sanbon/%25E2%2591%25A5.png": "25a4fdc71b8fe9f73e6ea7b049d5947e",
"assets/assets/images/zenkou/sanbon/%25E2%2591%25B1.png": "13ea7d72b0db7ff6ab0a44a2054bf44d",
"assets/assets/images/zenkou/sanbon/%25E2%2591%25B3.png": "27c3349721f501a58dbeaaebfee9108b",
"assets/assets/images/zenkou/sanbon/%25E2%2591%25A3.png": "9a6bcd25f745e7965296db84acef8b77",
"assets/assets/images/zenkou/sanbon/%25E2%2591%25AB.png": "ee7b9a2da98be9834a8c03e4fcad33e7",
"assets/assets/images/zenkou/sanbon/%25E2%2591%25AE.png": "a5a1e744b64ad9afd09c9b5d5cb67080",
"assets/assets/images/zenkou/sanbon/%25E2%2591%25B0.png": "caf08cbc5f8a5c62468af4cafc1aa392",
"assets/assets/images/zenkou/sanbon/%25E3%2589%2594.png": "242aa4c5fd11ec14044469fa9c208993",
"assets/assets/images/zenkou/sanbon/%25E2%2591%25A0.png": "c51aa0194589ac0d51f9d6fa22f902f8",
"assets/assets/images/zenkou/sanbon/%25E2%2591%25A1.png": "ce08ecdd8ee39b263d3712860678b5ff",
"assets/assets/images/zenkou/sanbon/%25E2%2591%25AA.png": "3a82e041b1ed1a79a5bc1e4019087f6d",
"assets/assets/images/zenkou/sanbon/%25E2%2591%25B2.png": "16b783bf4d7993707f75e140d5ea6d73",
"assets/assets/images/zenkou/sanbon/%25E2%2591%25A9.png": "81ce99d0006cf989043176cca0c40d38",
"assets/assets/images/zenkou/sanbon/%25E2%2591%25A6.png": "f0517e80bc4f2dae51c665e57760f859",
"assets/assets/images/zenkou/sanbon/%25E2%2591%25A8.png": "3fe1b5fdac5319bc4d29caae586d8b6c",
"assets/assets/images/zenkou/sanbon/%25E2%2591%25A7.png": "9cc537a13efb11a86f12217b0dc912cd",
"assets/assets/images/zenkou/sanbon/%25E2%2591%25AC.png": "3db9dfe52e0a80b5c9857671f3f35e96",
"assets/assets/images/zenkou/himozi.png": "ffbce59eefe13dc2e12c6983ba7a4136",
"assets/assets/images/yotei.png": "2421f0cffe8ebe7fec6f079b40840254",
"assets/assets/images/image.jpg": "2f822511e03d4f7e943da5eae510fe9b",
"assets/assets/images/bunkasai/yushi/Suger%2520Melody.png": "7312518e2c4957aab16e16f0c9781f35",
"assets/assets/images/bunkasai/yushi/Marlone.png": "8a783a4370513dae65d1259437692832",
"assets/assets/images/bunkasai/yushi/K!CK%25EF%25BC%2586JOY.png": "dcd3171c8911975a0c77ee85ad17ee5d",
"assets/assets/images/bunkasai/yushi/uenochinatsu.png": "457b69dec6a8fb500785cfc7479cd2d5",
"assets/assets/images/bunkasai/yushi/hitohito.png": "f9ca7f320ae76f633f751fb48d791e1e",
"assets/assets/images/bunkasai/yushi/yukky.png": "5748417939f9b396e6f85c99e76a1297",
"assets/assets/images/bunkasai/yushi/Pace%2520Wolf.png": "cd6e879b0c2e95b0586a3ad619b02f24",
"assets/assets/images/bunkasai/yushi/Solstice%2520Solfege.png": "8c62ff92e381d154b32f5baf58675f45",
"assets/assets/images/bunkasai/yushi/Day%2520Trippers.png": "7e052d65d2d69bcab480f00455f6a2c0",
"assets/assets/images/bunkasai/yushi/Reclix.png": "e9b146caa9efd7e8c0d6551d58cd2ff1",
"assets/assets/images/bunkasai/yushi/17tach.png": "6d235917f30ad8c7754a2cfcc7c8040b",
"assets/assets/images/bunkasai/yushi/4u.png": "7275146631682e51d5f5fd12704cdb0e",
"assets/assets/images/bunkasai/yushi/chigiripan.png": "d0b65192827bdfba86683960e9574fc1",
"assets/assets/images/bunkasai/yushi/whatever%2520is%2520fine.png": "27fcaade6000149367d8a8b3c6c3ba98",
"assets/assets/images/bunkasai/yushi/MGRL.png": "504e827607ebe8ba62a732c92cf24baa",
"assets/assets/images/bunkasai/yushi/cherry%2520charm.png": "6d39d12ed8de39f930b01bc11ec5933d",
"assets/assets/images/bunkasai/yushi/Fab..png": "48aece526cf6565130427d06f1627773",
"assets/assets/images/bunkasai/yushi/CGS48.png": "3ffe57bc6966fdc1c1837ab707b69aa2",
"assets/assets/images/bunkasai/yushi/V!VA.png": "bcfb82bc820362dff44882d509048406",
"assets/assets/images/bunkasai/bukatsu/Kadou.jpg": "9adc1370705fb0478c536552a80df77f",
"assets/assets/images/bunkasai/bukatsu/bunka.jpg": "e3ad4d5387f2444c88445d0d1d57d468",
"assets/assets/images/bunkasai/bukatsu/bungebu.jpg": "ea70d09593f0bacb063c6b337ee17b61",
"assets/assets/images/bunkasai/bukatsu/bizyutsu.jpg": "ef950c209605bddda5b214f90d285bf1",
"assets/assets/images/bunkasai/bukatsu/Kuizu.jpg": "7bf4c92cc30211416867d180d4fc532f",
"assets/assets/images/bunkasai/bukatsu/Shashin.jpg": "fb6d0a07868543052738499dae76007e",
"assets/assets/images/bunkasai/bukatsu/engeki.jpg": "6d8244ef46871d5e157a534c2e8ceff8",
"assets/assets/images/bunkasai/bukatsu/akapera.jpg": "2b750077add4ad6fd0771802c5678166",
"assets/assets/images/bunkasai/bukatsu/Suiei.jpg": "f10911c8bbf3f85df85b394d2ce0f5e0",
"assets/assets/images/bunkasai/bukatsu/Dansu.jpg": "485e0a586f5993598829103bb04a31f2",
"assets/assets/images/bunkasai/tenji/komi3.jpg": "db798fb89daf0cfa8b28cf28f8e436b4",
"assets/assets/images/bunkasai/tenji/komi2.jpg": "c69ba67b53bb01b82f767cdb9a773ad2",
"assets/assets/images/bunkasai/tenji/komi1.jpg": "b3922ac7e7d4052a5d1dc9b8dc9de6dc",
"assets/assets/images/bunkasai/tenji/209.jpg": "e51baed8bfae39bfbcb674e31c547fc1",
"assets/assets/images/bunkasai/tenji/105.jpg": "f0aea56ce22628b39c33d4d150068180",
"assets/assets/images/bunkasai/tenji/106.jpg": "8fa7d5cf779d6b5cdef217242d9e3d64",
"assets/assets/images/bunkasai/tenji/101.jpg": "7a644f9d694520a18cbd2ca76cdde3b7",
"assets/assets/images/bunkasai/tenji/108.jpg": "ea6dbed57e1e96a9190e31efaccdad4a",
"assets/assets/images/bunkasai/tenji/107.jpg": "ec8d4f4d95885f70c97868a87a966426",
"assets/assets/images/bunkasai/tenji/203.png": "cf018bc34f8ce60db91e70d51e7ae2b9",
"assets/assets/images/bunkasai/tenji/208.jpg": "515d23c905c3226b666481618539c0e9",
"assets/assets/images/bunkasai/tenji/205.jpg": "632d6011b3dde7bb341b99695c9c75eb",
"assets/assets/images/bunkasai/tenji/204.jpg": "a10f6b5cdd91d94ab81b8b8f7e7e0087",
"assets/assets/images/bunkasai/tenji/207.png": "dd50ac24fc90ec60f36aae8debed1b0c",
"assets/assets/images/bunkasai/tenji/102.jpg": "9fbaecbd91b94cbf611cd53e8e2263b9",
"assets/assets/images/bunkasai/tenji/202.jpg": "932ec11fb6f5abcfad167f0c40a4e9bd",
"assets/assets/images/bunkasai/tenji/201.jpg": "11a2e4b2b3360ee6e849f067ff93d2e0",
"assets/assets/images/bunkasai/tenji/104.jpg": "33d4300365e7fcaf5a5f4a36c5b4cd1b",
"assets/assets/images/bunkasai/tenji/206.jpg": "bce264d36ab027d4a284ceb150f062d5",
"assets/assets/images/bunkasai/tenji/109.jpg": "cae6ff09ad1200cedb4a3c8a112c81cd",
"assets/assets/images/bunkasai/tenji/103.png": "d001dce86e8e434386e7de95d7c71b96",
"assets/assets/images/bunkasai/sonota/keyholder2.png": "4690876f2826a22ab67b7ce510c91a4e",
"assets/assets/images/bunkasai/sonota/ballpoint%2520pen4.png": "758d555400abbd02363e6db69b05f396",
"assets/assets/images/bunkasai/sonota/towel1.png": "1bc363da04ccb2190524b3769047f953",
"assets/assets/images/bunkasai/sonota/sticker3.png": "b061928be699201fecacc6bd792b3139",
"assets/assets/images/bunkasai/sonota/band5.png": "5669060dbeb65fbfa8ee4fd3755e552b",
"assets/assets/documents/bihin.pdf": "be5038b66874066e1d8227ab919b0170",
"assets/assets/documents/terms_of_service.pdf": "d0dec295716da9065a14f0fab3406dd1",
"assets/assets/documents/privacy_policy.pdf": "5d6ac303dc03fa2f8f585b12eb6d53a2",
"assets/FontManifest.json": "3fe04762ff683a9f5423d0788fe565cd",
"assets/AssetManifest.bin.json": "411bb97178d413d0038f03f6609b3079",
"assets/AssetManifest.bin": "3aa4c4b958fbdded9fe2c6adced46398",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"flutter_bootstrap.js": "e382f5acf5c83a75395ec66c86bf4822",
"ic_launcher.png": "fd11b9e60d6d9c88fb0a1f96b7b81c89",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"index.html": "67209ef043d1be74263bf6b39cdad82f",
"/": "67209ef043d1be74263bf6b39cdad82f"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
