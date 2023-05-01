// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDhGe5N5P5AoTshuUyo0wAYpvcTxLQkyqU',
    appId: '1:431226605593:web:fa6b47f6371ea5aa4e9a88',
    messagingSenderId: '431226605593',
    projectId: 'cv-desing',
    authDomain: 'cv-desing.firebaseapp.com',
    storageBucket: 'cv-desing.appspot.com',
    measurementId: 'G-QBE30DX58D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBhf_2RGZglEykwKnyKNY5QMcWj9aWWU6A',
    appId: '1:431226605593:android:107db2a2cd2618f44e9a88',
    messagingSenderId: '431226605593',
    projectId: 'cv-desing',
    storageBucket: 'cv-desing.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCk8yT7VcqD82smsz0svj3FXL9fM1yJNS4',
    appId: '1:431226605593:ios:bed0fdc56a56210d4e9a88',
    messagingSenderId: '431226605593',
    projectId: 'cv-desing',
    storageBucket: 'cv-desing.appspot.com',
    iosClientId: '431226605593-5r05r3qp2d2od73mdf31t3lbjr54ijgc.apps.googleusercontent.com',
    iosBundleId: 'com.example.cvDesingWebsiteFlutter',
  );
}
