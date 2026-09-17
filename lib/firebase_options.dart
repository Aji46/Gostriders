// File generated normally by the FlutterFire CLI.
//
// ⚠️ IMPORTANT — READ ME FIRST ⚠️
// This is a PLACEHOLDER. Replace this entire file automatically by running:
//
//   dart pub global activate flutterfire_cli
//   flutterfire configure
//
// ...from the project root, after creating a Firebase project at
// https://console.firebase.google.com and enabling:
//   - Authentication (Email/Password provider) — for the hidden admin login
//   - Cloud Firestore — for storing products
//   - Storage — for product photos
//
// The command above will overwrite this file with your real project's
// API keys and IDs, and will also register a Web app automatically.
// See README.md for the full step-by-step setup guide.

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform. '
          'Run `flutterfire configure` to generate a real firebase_options.dart.',
        );
    }
  }

  // ---- PLACEHOLDER VALUES — replace by running `flutterfire configure` ----

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAdvCympKshHPYL9F4HwHNblwaKXiPCVAE',
    appId: '1:159791430875:web:128eaf07ec11ad2cf320fe',
    messagingSenderId: '159791430875',
    projectId: 'gostriders',
    authDomain: 'gostriders.firebaseapp.com',
    databaseURL: 'https://gostriders-default-rtdb.firebaseio.com',
    storageBucket: 'gostriders.firebasestorage.app',
    measurementId: 'G-BS3CVW4WEZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDnt1uBVS8qfW5cAVKzsnUmGPlR0DoDSkY',
    appId: '1:159791430875:android:40c9556094106d57f320fe',
    messagingSenderId: '159791430875',
    projectId: 'gostriders',
    databaseURL: 'https://gostriders-default-rtdb.firebaseio.com',
    storageBucket: 'gostriders.firebasestorage.app',
  );
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAspbbFoRkagDJt8xdaMmMHYOYK0S0Nj3I',
    appId: '1:159791430875:ios:b161fa3a16187c8ef320fe',
    messagingSenderId: '159791430875',
    projectId: 'gostriders',
    databaseURL: 'https://gostriders-default-rtdb.firebaseio.com',
    storageBucket: 'gostriders.firebasestorage.app',
    iosBundleId: 'com.example.gostriders',
  );
  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAspbbFoRkagDJt8xdaMmMHYOYK0S0Nj3I',
    appId: '1:159791430875:ios:b161fa3a16187c8ef320fe',
    messagingSenderId: '159791430875',
    projectId: 'gostriders',
    databaseURL: 'https://gostriders-default-rtdb.firebaseio.com',
    storageBucket: 'gostriders.firebasestorage.app',
    iosBundleId: 'com.example.gostriders',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAdvCympKshHPYL9F4HwHNblwaKXiPCVAE',
    appId: '1:159791430875:web:a3fb9276c61c3a75f320fe',
    messagingSenderId: '159791430875',
    projectId: 'gostriders',
    authDomain: 'gostriders.firebaseapp.com',
    databaseURL: 'https://gostriders-default-rtdb.firebaseio.com',
    storageBucket: 'gostriders.firebasestorage.app',
    measurementId: 'G-X4Q55YMDY1',
  );
}
