// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBMEbQDgDO_zK9DramJdjR_whUlOe1EjXw',
    appId: '1:913561520985:web:a15f542253a6093fcb1a48',
    messagingSenderId: '913561520985',
    projectId: 'fireprojectz',
    authDomain: 'fireprojectz.firebaseapp.com',
    storageBucket: 'fireprojectz.appspot.com',
    measurementId: 'G-3CZQMGLECT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBCoDcorrMgBrxAlT7_OMa3xmnvek3c_rI',
    appId: '1:913561520985:android:17ec6dd9df69b401cb1a48',
    messagingSenderId: '913561520985',
    projectId: 'fireprojectz',
    storageBucket: 'fireprojectz.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBlx79PKiUhM8WMc30TLm7LmwLrpJh5fas',
    appId: '1:913561520985:ios:2808c7e9fcc75b0bcb1a48',
    messagingSenderId: '913561520985',
    projectId: 'fireprojectz',
    storageBucket: 'fireprojectz.appspot.com',
    iosBundleId: 'com.example.freshlinks',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBlx79PKiUhM8WMc30TLm7LmwLrpJh5fas',
    appId: '1:913561520985:ios:2808c7e9fcc75b0bcb1a48',
    messagingSenderId: '913561520985',
    projectId: 'fireprojectz',
    storageBucket: 'fireprojectz.appspot.com',
    iosBundleId: 'com.example.freshlinks',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBMEbQDgDO_zK9DramJdjR_whUlOe1EjXw',
    appId: '1:913561520985:web:1e622062e02954aacb1a48',
    messagingSenderId: '913561520985',
    projectId: 'fireprojectz',
    authDomain: 'fireprojectz.firebaseapp.com',
    storageBucket: 'fireprojectz.appspot.com',
    measurementId: 'G-CJ7H4WHZ3M',
  );
}
