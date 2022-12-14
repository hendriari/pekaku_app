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
    apiKey: 'AIzaSyBOuaPp1dOykq2wWynQS12SqqrwO2MEDd8',
    appId: '1:766537746455:web:c68bb05733c9583d1a7452',
    messagingSenderId: '766537746455',
    projectId: 'mini-project-alta-sib3-2022',
    authDomain: 'mini-project-alta-sib3-2022.firebaseapp.com',
    storageBucket: 'mini-project-alta-sib3-2022.appspot.com',
    measurementId: 'G-7NNHME5LY6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDr4Oly3pakxeiE7_zzYIkPzSAScWUqv6E',
    appId: '1:766537746455:android:2963c4274da537a91a7452',
    messagingSenderId: '766537746455',
    projectId: 'mini-project-alta-sib3-2022',
    storageBucket: 'mini-project-alta-sib3-2022.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCpov12uqcirKD6T0WeK_HefKlqIyJvC10',
    appId: '1:766537746455:ios:1f44d4dabc1190081a7452',
    messagingSenderId: '766537746455',
    projectId: 'mini-project-alta-sib3-2022',
    storageBucket: 'mini-project-alta-sib3-2022.appspot.com',
    iosClientId: '766537746455-mvb3d1ufqi1tn3v85lfmtfvrid3hj33d.apps.googleusercontent.com',
    iosBundleId: 'com.example.pekakuApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCpov12uqcirKD6T0WeK_HefKlqIyJvC10',
    appId: '1:766537746455:ios:1f44d4dabc1190081a7452',
    messagingSenderId: '766537746455',
    projectId: 'mini-project-alta-sib3-2022',
    storageBucket: 'mini-project-alta-sib3-2022.appspot.com',
    iosClientId: '766537746455-mvb3d1ufqi1tn3v85lfmtfvrid3hj33d.apps.googleusercontent.com',
    iosBundleId: 'com.example.pekakuApp',
  );
}
