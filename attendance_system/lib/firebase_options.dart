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
        return macos;
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
    apiKey: 'AIzaSyBXuQC5fzaETMWwIsRLDjCogn3jTugBrvY',
    appId: '1:702925986530:web:984069685170c4284b5cbb',
    messagingSenderId: '702925986530',
    projectId: 'attendance-system-2a8f6',
    authDomain: 'attendance-system-2a8f6.firebaseapp.com',
    storageBucket: 'attendance-system-2a8f6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD3MLLx-jxXk5LoJnzJyRa6p6Iurfkntgo',
    appId: '1:702925986530:android:71ae761054b3efdf4b5cbb',
    messagingSenderId: '702925986530',
    projectId: 'attendance-system-2a8f6',
    storageBucket: 'attendance-system-2a8f6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAPEExrQG3BAs8pyxNjSMrJwgryEXu5uBQ',
    appId: '1:702925986530:ios:7c94fa7eacef64aa4b5cbb',
    messagingSenderId: '702925986530',
    projectId: 'attendance-system-2a8f6',
    storageBucket: 'attendance-system-2a8f6.appspot.com',
    iosBundleId: 'com.example.attendanceSystem',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAPEExrQG3BAs8pyxNjSMrJwgryEXu5uBQ',
    appId: '1:702925986530:ios:b120dae59b5f0a0d4b5cbb',
    messagingSenderId: '702925986530',
    projectId: 'attendance-system-2a8f6',
    storageBucket: 'attendance-system-2a8f6.appspot.com',
    iosBundleId: 'com.example.attendanceSystem.RunnerTests',
  );
}
