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
    apiKey: 'AIzaSyCiQrUkU2X-ILVHtIYY_39xA5JYGQ5fXRU',
    appId: '1:700373280099:web:743bc531fabb020e9edf56',
    messagingSenderId: '700373280099',
    projectId: 'notification-22d59',
    authDomain: 'notification-22d59.firebaseapp.com',
    storageBucket: 'notification-22d59.appspot.com',
    measurementId: 'G-8EVBEZL204',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBjRTvwBkKUQHcJy8z3Mn9YgMozyGuJHZI',
    appId: '1:700373280099:android:0af1aebf41e1b3859edf56',
    messagingSenderId: '700373280099',
    projectId: 'notification-22d59',
    storageBucket: 'notification-22d59.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBYQEul4JDmJ2Js3QcdxTPrGeQCadDJ1xE',
    appId: '1:700373280099:ios:0519fe6913d2f4b39edf56',
    messagingSenderId: '700373280099',
    projectId: 'notification-22d59',
    storageBucket: 'notification-22d59.appspot.com',
    iosClientId: '700373280099-8pks0luvhq3orlh995cg5stvvtkpudhf.apps.googleusercontent.com',
    iosBundleId: 'com.example.funnyEnough',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBYQEul4JDmJ2Js3QcdxTPrGeQCadDJ1xE',
    appId: '1:700373280099:ios:11592352d3de78869edf56',
    messagingSenderId: '700373280099',
    projectId: 'notification-22d59',
    storageBucket: 'notification-22d59.appspot.com',
    iosClientId: '700373280099-2jliutdlc2s2njkfpu1so8i0qput4ji4.apps.googleusercontent.com',
    iosBundleId: 'com.example.funnyEnough.RunnerTests',
  );
}