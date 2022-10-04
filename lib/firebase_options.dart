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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAzXsdUI9fOihQqXbas4UvrJmWz5TTV1es',
    appId: '1:451212178113:android:5266cca0e59472f7145a40',
    messagingSenderId: '451212178113',
    projectId: 'tdk-redesign',
    databaseURL: 'https://tdk-redesign-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'tdk-redesign.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBC3Q8gXxyhxHX18RzMmhbQ5-dmJ9khi4c',
    appId: '1:451212178113:ios:36712bbe6be35964145a40',
    messagingSenderId: '451212178113',
    projectId: 'tdk-redesign',
    databaseURL: 'https://tdk-redesign-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'tdk-redesign.appspot.com',
    iosClientId: '451212178113-ktqqa2qgkreevcecs67t8pv2mrs7834a.apps.googleusercontent.com',
    iosBundleId: 'com.example.practice1',
  );
}