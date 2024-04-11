import 'package:dog_buddy_dog/mobail_number_otp.dart';
import 'package:dog_buddy_dog/widgets/common_base_screen.dart';
import 'package:dog_buddy_dog/widgets/common_button.dart';
import 'package:dog_buddy_dog/widgets/common_stack_textfield.dart';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MobailScreen extends StatefulWidget{
  const MobailScreen({Key? key}) : super(key: key);

  @override
  State<MobailScreen> createState() => _MobailScreenState();
}

class _MobailScreenState extends State<MobailScreen> {
  TextEditingController mobailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Container(
        padding: EdgeInsets.only(left: 12,right: 12,top: 5.h),
        height: 40.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonTextView(txtWelcom,color:black,fontSize: 22.sp,),
            CommonTextView('Mobile Number',fontSize: 14.sp,color: Colors.black,),
            CommonStackTextField(
                controller: mobailController,
                topName: 'Mobile Number',
                keyBoardType: TextInputType.phone,
              boxBorder: Border.all(color: transparent),

            ),
            CommonButton(
                btnText: btnLogin,
                fontSize: 16.sp,
                onPressed: () async{
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: '+91 ${mobailController.text}',
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {
                      print(e);
                    },

                    codeSent: (String verificationId, int? resendToken) {
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  MobaileNumberOtp(mobileNo: mobailController.text,id: verificationId)));
                  });
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}