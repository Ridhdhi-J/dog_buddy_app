import 'package:dog_buddy_dog/id_screen.dart';
import 'package:dog_buddy_dog/login_screen.dart';
import 'package:dog_buddy_dog/mobail_screen.dart';
import 'package:dog_buddy_dog/widgets/common_button.dart';
import 'package:dog_buddy_dog/widgets/common_image.dart';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sizer/sizer.dart';


class SocialLogin extends StatefulWidget {
  const SocialLogin({Key? key}) : super(key: key);


  @override
  State<SocialLogin> createState() => _SocialLoginState();
}

class _SocialLoginState extends State<SocialLogin> {
    /// Google Sign In
   signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth!.idToken,
    );

    // Once signed in, return the UserCredential
    final user =await FirebaseAuth.instance.signInWithCredential(credential);
    return user;
  }

   TextEditingController nameController = TextEditingController();
   TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /// Background Image
    return Container(
      width: 100.w,
      height: 100.h,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(imgBackground),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 18.h, bottom: 2.h),

          /// Background Size
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Dog Buddy Image
              Container(
                margin: EdgeInsets.only(bottom: 10.h),
                width: 40.w,
                height: 20.h,
                child: CommonImage(
                  imgDogBuddy,
                  boxFit: BoxFit.fitWidth,
                ),
              ),

              /// Facebook Button
              CommonButton(
                btnText: btnCWF,
                fontSize: 12.sp,
                color: blue,
                onPressed: () {

                }
                 // Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomBarScreen()));

              ),



              /// Google Button
              CommonButton(
                  btnText: btnCWG,
                  fontSize: 12.sp,
                  color: red,
                  onPressed: () => signInWithGoogle().then((user) {

                      if(user.user.uid!= null) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  IdScreen(name:user.user.displayName,email: user.user.email,image: user.user.photoURL ,)));
                      }


                  }),

              ),
              /*     Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomBarScreen()));*/


              CommonButton(
                  btnText: txtMobail,
                  fontSize: 12.sp,
                  color: Colors.orange,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MobailScreen() ));
                  }
              ),



              /// Create An Account
              CommonButton(
                btnText: btnCreatAC,
                fontSize: 12.sp,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
              ),

              SizedBox(
                height: 5.h,
              ),

              /// Login Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonTextView(
                    txtLogin,
                    fontSize: 14.sp,
                    color: textColor,
                  ),

                  /// Text Login
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                    },
                    child: CommonTextView(
                      txtLI,
                      fontSize: 14.sp,
                      color: green,
                    ),
                  ),
                ],
              ),
              const Spacer(),

              /// Bottom Text
              CommonTextView(
                txtSign,
                fontSize: 11.sp,
                color: green,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
