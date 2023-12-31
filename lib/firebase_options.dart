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
    apiKey: 'AIzaSyAEj1huDXyAv4MK45J4nDQ42ptvX5LraxQ',
    appId: '1:226695163915:web:d39643cb60050f7ab8170e',
    messagingSenderId: '226695163915',
    projectId: 'chatapp-73670',
    authDomain: 'chatapp-73670.firebaseapp.com',
    storageBucket: 'chatapp-73670.appspot.com',
    measurementId: 'G-006S7VV8NZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAHKA5HS6nZYJlM1q6pUfmUgfJWqQrZC90',
    appId: '1:226695163915:android:d3ec14ecef7ebb54b8170e',
    messagingSenderId: '226695163915',
    projectId: 'chatapp-73670',
    storageBucket: 'chatapp-73670.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC4wXG7fwFIlz3YfYPD3pkFN-n4uSe7cyk',
    appId: '1:226695163915:ios:c0b7ad11b5bf5255b8170e',
    messagingSenderId: '226695163915',
    projectId: 'chatapp-73670',
    storageBucket: 'chatapp-73670.appspot.com',
    iosClientId: '226695163915-cid7jcvmojq6jmukvfr7knfrbv8en06l.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC4wXG7fwFIlz3YfYPD3pkFN-n4uSe7cyk',
    appId: '1:226695163915:ios:0802f11b00eadd73b8170e',
    messagingSenderId: '226695163915',
    projectId: 'chatapp-73670',
    storageBucket: 'chatapp-73670.appspot.com',
    iosClientId: '226695163915-9535hbc80i6s64u2dtencd4odcoqpfon.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatapp.RunnerTests',
  );
}
