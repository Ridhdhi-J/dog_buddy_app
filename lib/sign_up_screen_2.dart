import 'package:dog_buddy_dog/profile_screen.dart';
import 'package:dog_buddy_dog/widgets/common_base_screen.dart';
import 'package:dog_buddy_dog/widgets/common_button.dart';
import 'package:dog_buddy_dog/widgets/common_textfield.dart';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen2 extends StatefulWidget {
  const SignUpScreen2({Key? key}) : super(key: key);

  @override
  State<SignUpScreen2> createState() => _SignUpScreen2State();
}

class _SignUpScreen2State extends State<SignUpScreen2> {
  /// email Controller
  TextEditingController email = TextEditingController();

  /// Password Controller
  TextEditingController password = TextEditingController();

  /// Conform Password Controller
  TextEditingController conformPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /// Background Screen
    return BaseScreen(
      child: Container(
        padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 8.h),
        height: 55.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Text monitoring
            CommonTextView(
              txtMonitoring,
              color: black,
              fontSize: 20.sp,
            ),

            /// Email TextField
            CommonTextField(
              keyBoardType: TextInputType.text,
              nameController: email,
              hintText: txtEmail,
              borderSide: BorderSide.none,
            ),

            /// Password Textfield
            CommonTextField(
              keyBoardType: TextInputType.text,
              nameController: password,
              hintText: txtPassword,
              borderSide: BorderSide.none,
            ),

            /// Conform Password TextField
            CommonTextField(
              keyBoardType: TextInputType.text,
              nameController: conformPassword,
              hintText: txtConformPassword,
              borderSide: BorderSide.none,
            ),
            SizedBox(
              height: 3.h,
            ),

            /// Sign up Button
            CommonButton(
              btnText: btnSignUp,
              fontSize: 14.sp,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile_Screen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
