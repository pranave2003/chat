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
    apiKey: 'AIzaSyA8U57cOPrETwDRKh6rQmx3wzyZH0qBQiU',
    appId: '1:286665379290:web:c7c705058b772fe7e584e3',
    messagingSenderId: '286665379290',
    projectId: 'chatapp-beb78',
    authDomain: 'chatapp-beb78.firebaseapp.com',
    storageBucket: 'chatapp-beb78.appspot.com',
    measurementId: 'G-1KJYJZWCB6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCmvj6jSyPmT_c5hh9botv0Vb0fViIpicw',
    appId: '1:286665379290:android:f00f49ae2952ae10e584e3',
    messagingSenderId: '286665379290',
    projectId: 'chatapp-beb78',
    storageBucket: 'chatapp-beb78.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAp52NwjpG00uFpe3VnssyZdoRRRiN2Ark',
    appId: '1:286665379290:ios:118ff25a542392c2e584e3',
    messagingSenderId: '286665379290',
    projectId: 'chatapp-beb78',
    storageBucket: 'chatapp-beb78.appspot.com',
    iosBundleId: 'com.example.chatapps',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAp52NwjpG00uFpe3VnssyZdoRRRiN2Ark',
    appId: '1:286665379290:ios:28e1bc1961a3f9a5e584e3',
    messagingSenderId: '286665379290',
    projectId: 'chatapp-beb78',
    storageBucket: 'chatapp-beb78.appspot.com',
    iosBundleId: 'com.example.chatapps.RunnerTests',
  );
}