import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CommonTextField extends StatefulWidget {
  String? hintText;
  TextEditingController nameController;
  TextInputType? keyBoardType;
  bool? obscureText;
  BorderSide? borderSide;
  Widget? suffixIcon;
  Widget? prefixIcon;
  String? lableText;

  CommonTextField({Key? key, this.hintText, required this.keyBoardType, required this.nameController, this.obscureText, this.borderSide, this.suffixIcon, this.prefixIcon,this.lableText}) : super(key: key);

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6.5.h,
      child: TextField(
        keyboardType: widget.keyBoardType ?? TextInputType.text,
        controller: widget.nameController,
        cursorColor: Colors.grey,
        textInputAction: TextInputAction.next,
        obscureText: widget.obscureText ?? false,
        decoration: InputDecoration(
          labelStyle: const TextStyle(color: Colors.grey),
          labelText: widget.lableText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: widget.borderSide ?? const BorderSide(color: green),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            // ignore: prefer_const_constructors
            borderSide: widget.borderSide ?? BorderSide(color: Colors.green),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 12.sp, color: Colors.grey),
          filled: true,
          fillColor: containerColor,
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
        ),
        style: TextStyle(fontSize: 14.sp, color: green),
      ),
    );
  }
}
