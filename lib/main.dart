import 'package:firebase_core/firebase_core.dart';
import 'package:firstrip/screens/intro_slider.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCIg-uXz1tqqiuydOXnBDFy8KekpfygltI",
      appId: "1:950387792751:android:8e9af098e86f39b865e69a",
      messagingSenderId: "950387792751",
      //950387792751
      projectId: "homemade-79d7b",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroSliderPage(),
    );
  }
}
