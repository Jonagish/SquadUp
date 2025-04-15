import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCTd-yMJuoLu7rmzA4TWz44sAGJ5rIINlY",
            authDomain: "squad-up-anxjyd.firebaseapp.com",
            projectId: "squad-up-anxjyd",
            storageBucket: "squad-up-anxjyd.firebasestorage.app",
            messagingSenderId: "385629703208",
            appId: "1:385629703208:web:f55c938327fe3fc35f791d",
            measurementId: "G-9RGSD5F3E4"));
  } else {
    await Firebase.initializeApp();
  }
}
