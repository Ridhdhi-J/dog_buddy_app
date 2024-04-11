import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'common_appbar.dart';

// ignore: must_be_immutable
class BaseScreen extends StatelessWidget {
  Widget? child;

  BaseScreen({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      decoration: const BoxDecoration(

          image: DecorationImage(
        image: AssetImage('asset/image/riddhi.png'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CommonAppBar(
          onPressed: () {
            Navigator.pop(context);

          },
        ),
        body: child,
      ),
    );
  }
}
