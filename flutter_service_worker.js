'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/assets/image/bell.png": "fbca0bc0cd770d71f1e45b73bd512144",
"assets/assets/image/tab_alarm_on.png": "d859dbcd94263b00f7dea9da1b8b7ad9",
"assets/assets/image/tab_my_off.png": "2accfa91d60d87213d08f36e7ca0541e",
"assets/assets/image/check_on.png": "3e31fc7dc4e59b412877065fe77a3306",
"assets/assets/image/thumb.png": "60875de40745e4595959780d3a949e59",
"assets/assets/image/close.png": "c3d6c028cfaa3d09e29e552bc76f1874",
"assets/assets/image/check_off.png": "c7b892a333eb6be59ac47812db8d6e47",
"assets/assets/image/user.png": "6647f456347350b7ae913543c6782c58",
"assets/assets/image/lock.png": "f0206d8be76192a07621a3fd984b9cf9",
"assets/assets/image/status_green.png": "d52ee6bc8a490d34b2de67d48f50b949",
"assets/assets/image/eye_on.png": "f0dbf13c13780565d47a9558b7df9774",
"assets/assets/image/tab_prod_off.png": "9a3c89ce70afab19fbc5e48a8eeb8f57",
"assets/assets/image/papa_logo.png": "6e4a6fb9486295a4e14457f5bf821bc3",
"assets/assets/image/img_default.png": "d593e9dd7236a42ef72d8458b2ab0af7",
"assets/assets/image/apple.png": "4c649a827e90b447468fe63a36594ed4",
"assets/assets/image/tab_my_on.png": "2accfa91d60d87213d08f36e7ca0541e",
"assets/assets/image/stars.png": "ff5ffae6308e02fd9babd5fb896a7e39",
"assets/assets/image/tab_alarm_off.png": "4f560956249897cf0fa1604503c15394",
"assets/assets/image/tab_prod_on.png": "9a3c89ce70afab19fbc5e48a8eeb8f57",
"assets/assets/image/tab_home_on.png": "a14a9c0206b32eddb4f9465def070a82",
"assets/assets/image/sticker.png": "9466c634d3cb2e81d6d1753d7dcfb649",
"assets/assets/image/arrow_down.png": "fd225ce6dc1cecd2bc8bb3bbb9c7b99a",
"assets/assets/image/google.png": "c147a991e73539e2abe5017616e51208",
"assets/assets/image/id.png": "c4e3be8a79884efda35c32284c69b0e2",
"assets/assets/image/arrow_up.png": "74563c4cd785d572e114a751b4c1f669",
"assets/assets/image/password.png": "18247a86dac0a2ccf9875fdcbca30bd4",
"assets/assets/image/kakao.png": "4f7442af129bf2b788311c5b57c44075",
"assets/assets/image/lines.png": "7c50ce23f2e8fe0a4c2e55bb1bbb0678",
"assets/assets/image/tab_home_off.png": "8ba37c8961c3bc041112e39fa9de28d5",
"assets/assets/image/prev.png": "5d79b17e1f0ccc42f2de8c702605f5bf",
"assets/assets/image/eye_off.png": "8c3f2527eda32b5ee49605124f392a7a",
"assets/AssetManifest.json": "27893409764d9b17837df8b04716d516",
"assets/AssetManifest.bin.json": "80d2f547e2b5876a29a54be788100cc9",
"assets/packages/timezone/data/latest_all.tzf": "5e6af46f7fdd153c308fc6531ba69d03",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/fonts/MaterialIcons-Regular.otf": "719861530d181c8658c3a8021d8f4905",
"assets/AssetManifest.bin": "7b049d1ec8a3618399ab4df5b3ec0388",
"assets/NOTICES": "9029fb6fecc4d72f9f0f4cfb0037422f",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"manifest.json": "fc250ce11b71bc0a15e5cbc061da2db5",
"index.html": "d2a382f0e823b8e1080f8bc220fb9a43",
"/": "d2a382f0e823b8e1080f8bc220fb9a43",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "2d58592c24179b8d9b5a33842ac62ea8",
"main.dart.js": "9b9458a29d2094c4f481cb10da074c83",
"version.json": "eac9af5b22dbf3316943daef6d1901f3",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1"};
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
