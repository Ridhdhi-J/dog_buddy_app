import 'package:dog_buddy_dog/id_screen.dart';
import 'package:dog_buddy_dog/widgets/common_base_screen.dart';
import 'package:dog_buddy_dog/widgets/common_button.dart';
import 'package:dog_buddy_dog/widgets/common_stack_textfield.dart';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MobaileNumberOtp extends StatefulWidget{
  String? mobileNo;
  String? id;
   MobaileNumberOtp({Key? key, this.mobileNo, this. id}) : super(key: key);

  @override
  State<MobaileNumberOtp> createState() => _MobaileNumberOtpState();
}

class _MobaileNumberOtpState extends State<MobaileNumberOtp> {
  TextEditingController otpController = TextEditingController();
  final FirebaseAuth _auth  = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
       child: Container(

         padding: const EdgeInsets.only(left: 12,right: 12,top: 40),
         height: 45.h,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             CommonTextView(txtMobaileOtp,fontSize: 20.sp,color: black,),
             CommonStackTextField(
                 controller: otpController,
                 topName: 'OTP',
                 keyBoardType: TextInputType.number,
             ),
             CommonButton(
                 btnText: btnSubmit,
                 fontSize: 12.sp,
                 onPressed: () async{
                   PhoneAuthCredential credential = PhoneAuthProvider.credential(
                       verificationId: widget.id.toString(), smsCode: otpController.text);
                   _auth.signInWithCredential(credential).then((user) {

                     if(user.user != null && user.user!.uid != null){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> IdScreen(name:user.user?.displayName ,image: user.user?.photoURL,phoneNumber: user.user!
                           .phoneNumber,

                       )));
                     }
                   });
                 }
             ),
           ],
         ),
       ),
    );
  }
}