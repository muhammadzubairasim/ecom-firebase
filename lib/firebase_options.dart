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
    apiKey: 'AIzaSyCdVYayGuP-t75qx8Cm8UOkWOYKqtYkNJE',
    appId: '1:917163754175:web:6d0df322c2787618c0fc0a',
    messagingSenderId: '917163754175',
    projectId: 'ecommerceapp-170f1',
    authDomain: 'ecommerceapp-170f1.firebaseapp.com',
    storageBucket: 'ecommerceapp-170f1.appspot.com',
    measurementId: 'G-XTHXVRRH1R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA04mVH-dwVKETHhvfgWbTBGR_e7TdTloI',
    appId: '1:917163754175:android:02e28a707addccddc0fc0a',
    messagingSenderId: '917163754175',
    projectId: 'ecommerceapp-170f1',
    storageBucket: 'ecommerceapp-170f1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDyAGE448svd5qSG7lt9gaPwi1Mw0ECjsk',
    appId: '1:917163754175:ios:0c107d681b6692cfc0fc0a',
    messagingSenderId: '917163754175',
    projectId: 'ecommerceapp-170f1',
    storageBucket: 'ecommerceapp-170f1.appspot.com',
    iosClientId: '917163754175-ie0na8312kd8olac15psg4121f0500jf.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecom',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDyAGE448svd5qSG7lt9gaPwi1Mw0ECjsk',
    appId: '1:917163754175:ios:0c107d681b6692cfc0fc0a',
    messagingSenderId: '917163754175',
    projectId: 'ecommerceapp-170f1',
    storageBucket: 'ecommerceapp-170f1.appspot.com',
    iosClientId: '917163754175-ie0na8312kd8olac15psg4121f0500jf.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecom',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCdVYayGuP-t75qx8Cm8UOkWOYKqtYkNJE',
    appId: '1:917163754175:web:ffad2a7fc68f32b1c0fc0a',
    messagingSenderId: '917163754175',
    projectId: 'ecommerceapp-170f1',
    authDomain: 'ecommerceapp-170f1.firebaseapp.com',
    storageBucket: 'ecommerceapp-170f1.appspot.com',
    measurementId: 'G-3N0BDR3K95',
  );

}