import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:smart_home/Conifg/PageRoutes.dart';
import 'package:smart_home/Conifg/Theme.dart';
import 'package:smart_home/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: FToastBuilder(),
      debugShowCheckedModeBanner: false,
      title: 'Smart Home',
      theme: lightTheme,
      darkTheme: darkTheme,
      getPages: pages,
      themeMode: ThemeMode.dark,
      initialRoute: '/',
    );
  }
}
