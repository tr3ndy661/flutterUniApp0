// This file contains the Firebase configuration options for your app.
import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return const FirebaseOptions(
      apiKey: 'AIzaSyC8u3l5yHkPBbpXBfI2tLXu1mXIfLD-oa0',
      appId: '1:629712032808:web:fd2c6f96c4887b603c911d',
      messagingSenderId: '629712032808',
      projectId: 'flutteruni-43c3c',
      authDomain: 'flutteruni-43c3c.firebaseapp.com',
    );
  }

  static FirebaseOptions get web {
    return const FirebaseOptions(
      apiKey: 'AIzaSyC8u3l5yHkPBbpXBfI2tLXu1mXIfLD-oa0',
      appId: '1:629712032808:web:fd2c6f96c4887b603c911d',
      messagingSenderId: '629712032808',
      projectId: 'flutteruni-43c3c',
      authDomain: 'flutteruni-43c3c.firebaseapp.com',
    );
  }

  // static FirebaseOptions get android {
  //   return const FirebaseOptions(
  //     apiKey: 'YOUR_ANDROID_API_KEY',
  //     appId: 'YOUR_ANDROID_APP_ID',
  //     messagingSenderId: 'YOUR_ANDROID_MESSAGING_SENDER_ID',
  //     projectId: 'YOUR_ANDROID_PROJECT_ID',
  //   );
  // }

  // static FirebaseOptions get ios {
  //   return const FirebaseOptions(
  //     apiKey: 'YOUR_IOS_API_KEY',
  //     appId: 'YOUR_IOS_APP_ID',
  //     messagingSenderId: 'YOUR_IOS_MESSAGING_SENDER_ID',
  //     projectId: 'YOUR_IOS_PROJECT_ID',
  //   );
  // }
}
