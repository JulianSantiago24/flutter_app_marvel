import 'package:flutter/material.dart';

class CustomTileText {
  static show({required BuildContext context, required String text}) {
    return Text(
      text,
      textAlign: TextAlign.start,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.displaySmall,
    );
  }
}
