// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ui/route/route.dart';
import 'ui/views/admin_login_penel.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDKlPzLML6NuyYt9mdiJrUPvD1c4fxBLP0",
      appId: "1:987453190322:web:5497f4caef800740a1d9ab",
      messagingSenderId: "987453190322",
      projectId: "fitness-mobile-app-de0be",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AdminLoginPage(),
      initialRoute: adminLogin,
      getPages: getPages,
    );
  }
}
