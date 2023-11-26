import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBgavfYadOchWGfM9bE3cXDkXLIO73dooI",
            authDomain: "unicar-maps-2ea13.firebaseapp.com",
            projectId: "unicar-maps-2ea13",
            storageBucket: "unicar-maps-2ea13.appspot.com",
            messagingSenderId: "37738869042",
            appId: "1:37738869042:web:e7e5974a9323b8ad91e72b",
            measurementId: "G-LPFBJPS8TV"));
  } else {
    await Firebase.initializeApp();
  }
}
