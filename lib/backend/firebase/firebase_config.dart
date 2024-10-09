import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAw7bQW9ydYDzZFP6zUWsFtrxmkdXMily4",
            authDomain: "parsul-c631f.firebaseapp.com",
            projectId: "parsul-c631f",
            storageBucket: "parsul-c631f.appspot.com",
            messagingSenderId: "973747500029",
            appId: "1:973747500029:web:86329da63c3941f2115f94",
            measurementId: "G-EF26VMBFKW"));
  } else {
    await Firebase.initializeApp();
  }
}
