import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home/Conifg/PageRoutes.dart';
import 'package:smart_home/Conifg/Theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
