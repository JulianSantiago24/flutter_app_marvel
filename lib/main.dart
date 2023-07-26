import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_marvel/widgets/my_theme.dart';
import 'package:flutter_app_marvel/screens/splash/screen_splash.dart';
import 'package:flutter_app_marvel/utilities/all_texts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheme.myTheme,
        title: AllTexts.appTitle,
        home: const SplashScreen(),
      ),
    );
  }
}