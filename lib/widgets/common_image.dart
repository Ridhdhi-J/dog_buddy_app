import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommonImage extends StatelessWidget {
  CommonImage(this.image, {Key? key, this.boxFit}) : super(key: key);
  String image;
  BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      fit: boxFit ?? BoxFit.cover,
    );
  }
}
