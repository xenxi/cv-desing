'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"index.html": "341ade599cebcaaa710b539d3a08ad72",
"/": "341ade599cebcaaa710b539d3a08ad72",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"main.dart.js": "d2463783b1963a75b4a1bb9714d434a8",
"manifest.json": "4bfca0d9c74243cf1291471a91ea410a",
"version.json": "5bfac3be1b4659076a659ad8737cd024",
"CNAME": "675a803db263bf0a262da57387132be8",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"assets/FontManifest.json": "5403659dd05443e08c49f9089d883d3b",
"assets/NOTICES": "9803bf8a41d48611a3f2b57d43d41f2b",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/shaders/ink_sparkle.frag": "7f48ec50203de34e042815bdf8320483",
"assets/assets/icons/github.svg": "2d91b03eadab02b9d111228f75338990",
"assets/assets/icons/linkedin.svg": "f02014695f606010b728a9662047662e",
"assets/assets/icons/twitter-solid.svg": "d3046a64e837979882f37f52b626d62a",
"assets/assets/img/sign_in.png": "2270c9ca642fe32ce4159764b3649a3b",
"assets/assets/img/resume_bg_02.png": "eed7e9227f4e0f14f4fcbf9e55c0c1ce",
"assets/assets/img/spain.png": "74a5a4a5b29968c7ed48ef8d9ab6b87b",
"assets/assets/img/simple-logo.png": "0fc0a05d741124630a9a2e6eac4e5627",
"assets/assets/img/bg_05.jpg": "edcf42c90c66b97acf5e116a47e32fda",
"assets/assets/img/home_02.png": "e950298cf7b0698a9f706d3a6a2c1da9",
"assets/assets/img/bg_09.jpg": "287e3be85f5ce1107e12a2017193808b",
"assets/assets/img/bg_02.png": "531a8461fd1ec42f03f4cfb891790635",
"assets/assets/img/bg_04.jpg": "7656030c21962a02a84578e947c51613",
"assets/assets/img/bg_11.jpg": "89e7487cff8080de1a58cd343778e9b1",
"assets/assets/img/home.png": "6b64621768a3833e924e1da262aa63a8",
"assets/assets/img/google.png": "c1a35923d3bb8ecdba479c5d61b85272",
"assets/assets/img/bg_01.png": "8257ef89b2dfeab767578260965a7e2d",
"assets/assets/img/logo.jpg": "8853d0943617f2d3697bb8061efd2177",
"assets/assets/img/bg_06.jpg": "b71b666b05f67a62fa46b502665588fe",
"assets/assets/img/bg_12.jpg": "4e55cb2415ae965ddc289bb029315eeb",
"assets/assets/img/logo_xs.png": "b58822c1cc6f00b6da776be5f64e70a1",
"assets/assets/img/resume.svg": "46677fc92c26b05ef05f6f57ee6cbf2f",
"assets/assets/img/bg_07.jpeg": "35f6238377b5b5957ef282f9b853d70c",
"assets/assets/img/logo.png": "9b5f18429e7f16162e77e1fc50cfc145",
"assets/assets/img/bg_10.jpg": "1bd5f6d75b99abbfaf69dc2bd8bface4",
"assets/assets/img/jonDoe.jpg": "6876c0967c3909880409ddb8a9c5b486",
"assets/assets/img/bg_03.png": "0614a717659df3fd409c60ff04fac983",
"assets/assets/img/bg_08.jpg": "cd5ba3852f455e0a663769cb0bc2ec1e",
"assets/assets/fonts/Arkipelago.otf": "40e30e08ba398ecf5f5fbaaf0950bc92",
"assets/assets/desings/T10C.jpg": "047bf08779269112788e0ca95f7e3b71",
"assets/assets/desings/CV10A.jpg": "039814b60b8733a619cb703004823988",
"assets/assets/desings/T10D.jpg": "916c694eb2ed679ebed3b5d2a4cf1a2a",
"assets/assets/desings/T10H.jpg": "d53e5a86a6677ae221a473973834d0c0",
"assets/assets/desings/T10F.jpg": "82c2859c34cc702f7a72b2031af7aa9a",
"assets/assets/desings/CV12P.jpg": "5c7ebae2c0be7fc1f0707ce51d349da9",
"assets/assets/desings/CV12Q.jpg": "c20c87cacae0b5bcc15d82370e7b91c0",
"assets/assets/desings/T10B.jpg": "516e5c776716c2978d2f282bbf27b5ba",
"assets/assets/desings/CV12M.jpg": "883cc085faf9e90174e586c0f9aba2d7",
"assets/assets/desings/CV12B.jpg": "e33503b8409f1916601862c3757e058b",
"assets/assets/desings/CV12N.jpg": "4e1b915f9d5fe495e95067d9b138fbdf",
"assets/assets/desings/CV10B.jpg": "75bc8fe48db71edc7d0b67f3ec4f996e",
"assets/assets/desings/F5B.jpg": "c64f635eab4286aabc6e98b0c8683c00",
"assets/assets/desings/CV12J.jpg": "e2097635964b82824f2af59d7b8bce5d",
"assets/assets/desings/CV10C.jpg": "297f4bcf9a43b69c8d1e4e2dc08471b2",
"assets/assets/desings/T10G.jpg": "97350964807dc74789364c213f210259",
"assets/assets/desings/CV12R.jpg": "e35af410d2b792d2a3d374e14abe0b31",
"assets/assets/desings/CV12L.jpg": "2e937b39f9ab89ce1e3b4643953f801d",
"assets/assets/desings/CV12E.jpg": "003085f93382cf14bebc8b6154106265",
"assets/assets/desings/CV12A.jpg": "cacdc6511accda6da464a538da08e7d4",
"assets/assets/desings/CV12O.jpg": "bc17b6110bf0fa9d787abd27d97d54d3",
"assets/assets/desings/CV12G.jpg": "f7a1a7a9e4dc34e7647ce4b9997eb0d9",
"assets/assets/desings/T10A.jpg": "3e5e46505aeb1b07f608d34591d873d3",
"assets/assets/desings/F5C.jpg": "aa49323f5f1de2cf4c8ba709265ed1e8",
"assets/assets/desings/F5A.jpg": "0418e2221322521ba7f336fb53d6986c",
"assets/assets/desings/CV12K.jpg": "a1da3a1f1cf64062cff548a5fa90b4d8",
"assets/assets/desings/CV12D.jpg": "fc08b847c4f1e2282a207bef1444d775",
"assets/assets/desings/CV12F.jpg": "8c8b7e253eb674ca327ef04367980040",
"assets/assets/desings/thumbnail/xs_T10E.jpg": "7308661f0427ce692486d028702e1308",
"assets/assets/desings/thumbnail/xs_CV12N.jpg": "f35c5f91b3d0b45599e038bea1df9f35",
"assets/assets/desings/thumbnail/xs_T10B.jpg": "97f40055da7afdb8ef63f5588aa5c925",
"assets/assets/desings/thumbnail/xs_CV12O.jpg": "01049eeaccc2803b938247a1495f4fa4",
"assets/assets/desings/thumbnail/xs_CV12Q.jpg": "cf3523af3ce9941d757198d058ab70c6",
"assets/assets/desings/thumbnail/xs_CV12F.jpg": "0dda06c793277711a660cf4324411fe0",
"assets/assets/desings/thumbnail/xs_T10H.jpg": "455696362851899fbdfd7d732990caf7",
"assets/assets/desings/thumbnail/xs_CV12K.jpg": "f2d6d308f6480b40e05e9f2cc4b7761c",
"assets/assets/desings/thumbnail/xs_T10A.jpg": "243d23b837d9c585981892ac17884831",
"assets/assets/desings/thumbnail/xs_CV10B.jpg": "9d33b29c07f06a4dd811a80a25e52209",
"assets/assets/desings/thumbnail/xs_CV12P.jpg": "96852b07d396802f04dd401a3e1dafc5",
"assets/assets/desings/thumbnail/xs_CV12J.jpg": "d07a6d71dc3b7406a777764222b94f2c",
"assets/assets/desings/thumbnail/xs_CV12H.jpg": "b3c927fbf1586ad93e57d31aeaaf7328",
"assets/assets/desings/thumbnail/xs_T10C.jpg": "65c12834e8e752ecf339218a1c08d302",
"assets/assets/desings/thumbnail/xs_T10D.jpg": "129198a8b16448907e88810502fbb683",
"assets/assets/desings/thumbnail/xs_CV12G.jpg": "e8da472931fa79a9fc5ce35138d2debf",
"assets/assets/desings/thumbnail/xs_T10G.jpg": "f40656b291d4c6966433f01160586e8c",
"assets/assets/desings/thumbnail/xs_CV10A.jpg": "05c559885b3205064143ee3868bb4168",
"assets/assets/desings/thumbnail/xs_CV12A.jpg": "5af1cbb249519ba28f9ae463a72bfac3",
"assets/assets/desings/thumbnail/xs_T10F.jpg": "1c03fa6a962ee483a138f7f555271864",
"assets/assets/desings/thumbnail/xs_CV12D.jpg": "16656399f0053369015495d78aee0b3a",
"assets/assets/desings/thumbnail/xs_F5A.jpg": "c36d9f9fc47c74fc7a6fb65079c85eba",
"assets/assets/desings/thumbnail/xs_F5B.jpg": "97ef65e2de5d98a56d43380540881041",
"assets/assets/desings/thumbnail/xs_CV10C.jpg": "f16fc1a7f9ccd746633d92dd2013eadf",
"assets/assets/desings/thumbnail/xs_CV12L.jpg": "576e5a83c637b3ccd66d2952f5435fab",
"assets/assets/desings/thumbnail/xs_CV12S.jpg": "4c1492e48799cff6dfec637fe2c86cbc",
"assets/assets/desings/thumbnail/xs_CV12B.jpg": "3825aa53d2c9bc8f6587575b6b4c8b02",
"assets/assets/desings/thumbnail/xs_CV12E.jpg": "bae296b3941dd5d0c779058b4e082975",
"assets/assets/desings/thumbnail/xs_CV12R.jpg": "cf4b1a2d074d6d4645d2aa685412b071",
"assets/assets/desings/thumbnail/xs_CV12C.jpg": "69eedcb96976949fb08193de21277523",
"assets/assets/desings/thumbnail/xs_F5C.jpg": "f059845e760596840d212b55ff0bbeab",
"assets/assets/desings/thumbnail/xs_CV12M.jpg": "13f7f49c4eeb0298a384c0248e913fb2",
"assets/assets/desings/CV12H.jpg": "5f9f9ba418f592d7d2c9ca679a7b7702",
"assets/assets/desings/T10E.jpg": "9645e7517ab1e28b14fc08581a28b036",
"assets/assets/desings/CV12C.jpg": "78d464dae24febefdaed0b2fe6e4afb5",
"assets/assets/desings/CV12S.jpg": "9c346400b3340c5519cada82683b60a0",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "613e4cc1af0eb5148b8ce409ad35446d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "dd3c4233029270506ecc994d67785a37",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "d1722d5cf2c7855862f68edb85e31f88",
"assets/AssetManifest.json": "a54fb671f37f2b2989fe94660172f762"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
