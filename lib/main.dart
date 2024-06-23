import 'package:admin/constants.dart';
import 'package:admin/controllers/MenuAppController.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBehLAJU2KHPyLtQVuNEVc-Og_9qiCHMQo",
            authDomain: "sponsor-hub-dnm.firebaseapp.com",
            projectId: "sponsor-hub-dnm",
            storageBucket: "sponsor-hub-dnm.appspot.com",
            messagingSenderId: "410149639120",
            appId: "1:410149639120:web:c40553bda028343a4c5fd5"
        ));
  } else {
    await Firebase.initializeApp();
  }
  Get.put(MenuAppController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SponsorHub Admin',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: MainScreen(),
    );
  }
}
