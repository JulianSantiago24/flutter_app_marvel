import 'package:flutter/material.dart';

class CustomListContainer {
  static get({
    required BuildContext context,
    required String backgroundImagePath,
    required Widget child
  }) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.35), BlendMode.dstATop),
          image: AssetImage(
            backgroundImagePath,
          ),
        ),
      ),
      child: child,
    );
  }
}
