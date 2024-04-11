import 'package:dog_buddy_dog/sign_up_screen_1.dart';
import 'package:dog_buddy_dog/widgets/common_base_screen.dart';
import 'package:dog_buddy_dog/widgets/common_button.dart';
import 'package:dog_buddy_dog/widgets/common_stack_textfield.dart';
import 'package:dog_buddy_dog/widgets/common_textfield.dart';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  /// Email Controller
  TextEditingController emailController = TextEditingController();

  /// Password Controller
  TextEditingController passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    /// Common Base Screen
    return BaseScreen(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Welcome Text
            CommonTextView(
              txtWelcom,
              fontSize: 28.sp,
              color: black,
            ),
            SizedBox(
              height: 5.h,
            ),

            /// Email TextField
            CommonStackTextField(
                controller: emailController,
                topName: 'Email',
                keyBoardType: TextInputType.emailAddress,
              boxBorder: Border.all(color: transparent),
            ),

            SizedBox(
              height: 2.h,
            ),

            /// Password TextField
            CommonStackTextField(
                controller: passwordController,
                topName: 'password',
                obscureText: true,
                keyBoardType: TextInputType.multiline,
              boxBorder: Border.all(color: transparent),
            ),
            SizedBox(
              height: 6.h,
            ),

            /// Login Button
            CommonButton(
              btnText: btnLogin,
              fontSize: 16.sp,
              onPressed: () async{
                try {
                  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen1()));
                } on FirebaseAuthException catch (e) {

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(e.toString()),
                      ),
                    );

                } catch (e) {
                  print(e);
                }

              },
            ),

            /// Forget Password
            Center(
                child: CommonTextView(
              txtForget,
              fontSize: 13.sp,
              color: green,
            )),
            const Spacer(),

            /// Text Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonTextView(
                  txtDontSign,
                  fontSize: 13.sp,
                  color: textColor,
                ),

                /// Text Sign in
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen1()));
                  },
                  child: CommonTextView(
                    txtSignIn,
                    fontSize: 13.sp,
                    color: green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
