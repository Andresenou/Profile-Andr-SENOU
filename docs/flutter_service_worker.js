'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "0db4c8c0c35fb46621d75cee0a15472e",
"assets/AssetManifest.bin.json": "05ace01dfc11d1ee6154d547e3b45cd0",
"assets/AssetManifest.json": "6612e2a5c7c504527581bbf4b73fedb1",
"assets/assets/images/3d_modeling.jpg": "39b018097dc885bdea614d17c4605146",
"assets/assets/images/about.jpg": "0e9208b43761ea6c24dbc9dbbf233446",
"assets/assets/images/design.jpg": "6a92680bb49a64595deadef5026b0f79",
"assets/assets/images/dht11.jpg": "2bdb638e253c581dd92c46be37e91291",
"assets/assets/images/face_detection.png": "6e59d610c0ab42933903fc72b1cda9dc",
"assets/assets/images/google_sheets.jpg": "19cbe25627375355b921ebcadd710172",
"assets/assets/images/gsm.jpg": "cfad38df845cba06551a18c3a2cad1d4",
"assets/assets/images/profile.jpg": "aa88516a9102f021c07c7bd48c396492",
"assets/assets/images/projects/app_solar.jpg": "a0975a150a7f4a8c5c274f0fc00b4e2a",
"assets/assets/images/projects/arduino.jpg": "7c55b8a7a3be9fe092d93e880175245e",
"assets/assets/images/projects/IMG_20231113_070453_155.jpg": "6271d3f39ef91bbe72270d283f2d2951",
"assets/assets/images/projects/phone_repair.jpg": "ceb6f71843390cc689dfdff31186584c",
"assets/assets/images/projects/solar_home.jpg": "cd7b0156abb741cadd3bb0f1ae339a65",
"assets/assets/images/qameleo.jpg": "a0975a150a7f4a8c5c274f0fc00b4e2a",
"assets/assets/images/raspberry_pi.jpg": "c0aaedd9a34904af96bffbec0bb9f7f5",
"assets/assets/images/rfid.jpg": "d52b73f82af8110efc7279fb127b89de",
"assets/assets/images/Screenshot_20240912-231655.jpg": "1d9394fd702eb9e56e44d5f7df9e44d0",
"assets/assets/images/Screenshot_20240912-233755.jpg": "97183d967abe2af44a35fd7f79f7b541",
"assets/assets/images/Screenshot_20240912-234050.jpg": "8c7159c7d10f5378d298c2589e6f89af",
"assets/assets/images/Screenshot_20240912-234108.jpg": "7ee0ae47a72b0e9beb6900dcfea82063",
"assets/assets/images/solar.jpg": "21d43ade3ebb15732359356b95ac9786",
"assets/assets/images/web_control.jpg": "fb34a153e98b564eff932695cea93d63",
"assets/assets/videos/1.mp4": "3ef3f1d5121abe17cc8a2d8c6e64a2ff",
"assets/assets/videos/2.mp4": "7f84445b451f0dc3c015d54f3dae27db",
"assets/assets/videos/3.mp4": "daaca5e442273c323eb5912a845a9ef3",
"assets/assets/videos/4.mp4": "2e7e3173b5750b6a7bd0d4ffcc270d62",
"assets/assets/videos/5.mp4": "f1634bb547d0847a386edea7c495cd4a",
"assets/assets/videos/6.mp4": "036221d630a3c79d69d9ef18b9577f30",
"assets/FontManifest.json": "3ddd9b2ab1c2ae162d46e3cc7b78ba88",
"assets/fonts/MaterialIcons-Regular.otf": "e1f48bc6b4c6ba703ab9e26ddbd4ef6c",
"assets/NOTICES": "365df8cf75f11fac835a5c7954dd2c62",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "8191e8fa7e180729dc670903965d057a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "bf21cd8fd775a3c59fd53afdee39e0e6",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "fdbcefbe80b45521eaa21a4e26bb9cc0",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "379234084b7371e79cb97e7c82d3e568",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "f333fa5afb615322fe95dfb043ef117f",
"/": "f333fa5afb615322fe95dfb043ef117f",
"main.dart.js": "5470e6655b2b4e8b95cf8a2d8eb341d1",
"manifest.json": "82412d91b00cca60873ba50b386fd9af",
"version.json": "a3440bb90983187eb4d76a1b2ea711de"};
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
