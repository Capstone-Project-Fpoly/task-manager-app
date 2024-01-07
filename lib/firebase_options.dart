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
    apiKey: 'AIzaSyBifxnPWBEO92H4d8oyfg_9-7NC9WadNhs',
    appId: '1:190656942395:web:2a25111b0f88e21924a71e',
    messagingSenderId: '190656942395',
    projectId: 'taskmanager-8cfb3',
    authDomain: 'taskmanager-8cfb3.firebaseapp.com',
    storageBucket: 'taskmanager-8cfb3.appspot.com',
    measurementId: 'G-8S6RRYH09T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB25hd17b41KFEmD9bKJbcjJBiLWdYEUUo',
    appId: '1:190656942395:android:4118b368a8ae2bec24a71e',
    messagingSenderId: '190656942395',
    projectId: 'taskmanager-8cfb3',
    storageBucket: 'taskmanager-8cfb3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCUaz1Ssi6ENYXTihaMEucAcNB61FDLK6I',
    appId: '1:190656942395:ios:4c29a07e417ee2db24a71e',
    messagingSenderId: '190656942395',
    projectId: 'taskmanager-8cfb3',
    storageBucket: 'taskmanager-8cfb3.appspot.com',
    iosBundleId: 'com.example.taskManager',
  );
}
