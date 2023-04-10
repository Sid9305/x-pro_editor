import 'package:Xpro_editor/screens/GoogleSignInProvider.dart';
import 'package:Xpro_editor/screens/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';


Future<void> main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'X PRO EDITOR',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const LoadingScreen(),
    );
}

