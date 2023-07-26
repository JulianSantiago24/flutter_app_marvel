import 'package:flutter/material.dart';

class CustomDetailsPageImage{
  static show({required String imagePath}){
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black,
        image: DecorationImage(
          image: NetworkImage(
            imagePath,
          ),
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}