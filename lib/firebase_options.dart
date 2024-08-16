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
    apiKey: 'AIzaSyBswEpHBmxN2fK9ZGfJWHGIoeKLuNwnDws',
    appId: '1:339204339904:web:28a44e0fbed1f747925525',
    messagingSenderId: '339204339904',
    projectId: 'ezeat-17178',
    authDomain: 'ezeat-17178.firebaseapp.com',
    storageBucket: 'ezeat-17178.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDx0WGdBizPmMa72pGSFw-dVWqEClQsZb0',
    appId: '1:339204339904:android:1349d75ad642e273925525',
    messagingSenderId: '339204339904',
    projectId: 'ezeat-17178',
    storageBucket: 'ezeat-17178.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDgWe9mNpc8x72zdIPzu5vcVI_sWv7v_pQ',
    appId: '1:339204339904:ios:df1b3d3c51d3d6fe925525',
    messagingSenderId: '339204339904',
    projectId: 'ezeat-17178',
    storageBucket: 'ezeat-17178.appspot.com',
    iosBundleId: 'com.example.ezEat',
  );
}
