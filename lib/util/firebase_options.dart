import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBcfmAQrMONZvy78oZSlv3yPkktNnlm6gw',
    appId: '1:1097203012326:web:3798c6af8cb034b90f2127',
    messagingSenderId: '1097203012326',
    projectId: 'flutter-firebase-auth-task',
    authDomain: 'flutter-firebase-auth-task.firebaseapp.com',
    storageBucket: 'flutter-firebase-auth-task.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDp0aDwtQjq5VoG2_uulpMsr8DINsR8clk',
    appId: '1:1097203012326:android:dc87d2bae72963470f2127',
    messagingSenderId: '1097203012326',
    projectId: 'flutter-firebase-auth-task',
    storageBucket: 'flutter-firebase-auth-task.appspot.com',
  );
}
