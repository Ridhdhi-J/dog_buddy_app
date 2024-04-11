import 'dart:io';
import 'package:dog_buddy_dog/sign_up_screen_2.dart';
import 'package:dog_buddy_dog/widgets/common_base_screen.dart';
import 'package:dog_buddy_dog/widgets/common_button.dart';
import 'package:dog_buddy_dog/widgets/common_image_bottomsheet.dart';
import 'package:dog_buddy_dog/widgets/common_stack_textfield.dart';
import 'package:dog_buddy_dog/widgets/common_textfield.dart';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen1 extends StatefulWidget {
  const SignUpScreen1({Key? key}) : super(key: key);

  @override
  State<SignUpScreen1> createState() => _SignUpScreen1State();
}

class _SignUpScreen1State extends State<SignUpScreen1> {
  TextEditingController nameController = TextEditingController();

  /// Upload image camera and gallery
  File? imageList;

  @override
  Widget build(BuildContext context) {
    /// Base Screen
    return BaseScreen(
      child: Container(
        padding: const EdgeInsets.only(left: 12,right: 12),
        height: 88.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Welcome Text
          CommonTextView(
            txtWelcomeDog,
            fontSize: 24.sp,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(
            height: 2.h,
          ),

          /// Camera Image

          /// Upload image camera and gallery
          CommonImageBottomSheet(
              textButton: Column(
                children: [
                  /// camera

                  GestureDetector(
                    onTap: () async {
                      XFile? camera = await ImagePicker().pickImage(source: ImageSource.camera);
                      setState(() {
                        imageList = File(camera!.path);
                        print(File(camera.path).toString());
                        Navigator.pop(context);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 0.50.h),
                      width: 90.w,
                      height: 5.5.h,
                      child: CommonTextView(
                        'Camera',
                        fontSize: 16.sp,
                      ),
                    ),
                  ),

                  /// Gallery

                  GestureDetector(
                    onTap: () async {
                      XFile? gallery = await ImagePicker().pickImage(source: ImageSource.gallery);
                      setState(() {
                        imageList = File(gallery!.path);
                        Navigator.pop(context);
                      });
                    },
                    child: SizedBox(
                      width: 90.w,
                      height: 5.5.h,
                      child: CommonTextView(
                        'Gallery',
                        fontSize: 16.sp,
                      ),
                    ),
                  )
                ],
              ),
              column: Column(
                children: [
                  /// show image
                  imageList != null
                      ? ClipOval(
                    child: Image.file(
                      imageList!,
                      width: 35.w,
                      height: 35.w,
                      fit: BoxFit.cover,
                    ),
                  )
                      :

                  /// green Container main
                  Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: green,
                      borderRadius: BorderRadius.circular(100),
                      image: const DecorationImage(
                        image: AssetImage('asset/image/ic_user.png'),
                      ),
                    ),

                    /// Icon Camera
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      size: 40,
                      color: white,
                    ),
                  ),
                ],
              )
          ),
          SizedBox(
            height: 3.h,
          ),

          /// Text field

          Container(child: SizedBox(height: 1.h)),

          CommonStackTextField(
            controller: nameController,
            topName: txtFullName,
            keyBoardType: TextInputType.name,
            boxBorder: Border.all(color: green),
          ),
          CommonTextView(
            txtLoremLpsum, fontSize: 12.sp, color: textColor,
            maxLine: 2,),
          const Spacer(),

          /// Button
          CommonButton(
            btnText: btnNext,
            fontSize: 16.sp,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen2()));
            },
          )
          ],
        ),
      ),
    );
  }
}
