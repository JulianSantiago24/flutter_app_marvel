import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_marvel/screens/characters/screen_character_list.dart';
import 'package:flutter_app_marvel/utilities/image_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (builder) => const CharacterList(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              ImagePath.splash,
            ),
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const SizedBox(height: 145),
                  Image.asset(
                    ImagePath.loader,
                    height: 80,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
