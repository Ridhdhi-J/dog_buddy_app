import 'dart:io';
import 'package:dog_buddy_dog/dog_breed_screen.dart';
import 'package:dog_buddy_dog/user_profile_screen.dart';
import 'package:dog_buddy_dog/widgets/common_appbar.dart';
import 'package:dog_buddy_dog/widgets/common_button.dart';
import 'package:dog_buddy_dog/widgets/common_image.dart';
import 'package:dog_buddy_dog/widgets/common_image_bottomsheet.dart';
import 'package:dog_buddy_dog/widgets/common_textfield.dart';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class AddPetProfileScreen extends StatefulWidget {

  const AddPetProfileScreen({Key? key}) : super(key: key);

  @override
  State<AddPetProfileScreen> createState() => _AddPetProfileScreenState();
}

class _AddPetProfileScreenState extends State<AddPetProfileScreen> {
  /// TextField Controller
  TextEditingController petController = TextEditingController();
  TextEditingController dogBreedController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();

  /// Select Container
  int genderSelect = 0;
  int dogSizeSelect = 0;

  /// List Gender
  List<String> gender = ['Male', 'Female'];
  String selectGender = 'Male';

  /// List Dog Size
  List<String> dogSize = ['Small', 'Medium', 'Large'];
  String selectDogSize = 'Small';

  /// Upload Image
  File? imgList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar
      appBar: CommonAppBar(
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: 135.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 4.w),
                child: CommonTextView(
                  txtAddPetProfile,
                  color: Colors.black,
                  fontSize: 18.sp,
                ),
              ),

              /// Upload Image Container

              CommonImageBottomSheet(
                  textButton: Column(
                    children: [
                      /// Camera

                      GestureDetector(
                        onTap: () async {
                          XFile? camera = await ImagePicker().pickImage(source: ImageSource.camera);
                          setState(() {
                            imgList = (File(camera!.path));
                            print(File(camera!.path).toString());
                            Navigator.pop(context);
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 1.h),
                          width: 90.w,
                          height: 5.5.h,
                          color: transparent,
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
                            imgList = (File(gallery!.path));
                            Navigator.pop(context);
                          });
                        },
                        child: Container(
                          width: 90.w,
                          height: 5.5.h,
                          color: transparent,
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
                      /// Image File
                      imgList != null
                          ?

                          /// Upload Image Size
                          ClipOval(
                              child: Image.file(
                                imgList!,
                                width: 25.w,
                                height: 25.w,
                                fit: BoxFit.cover,
                              ),
                            )
                          :

                          /// Image Container
                          Align(
                              child: Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8.w),
                                    margin: EdgeInsets.only(top: 1.h, bottom: 0.50.h),
                                    width: 25.w,
                                    height: 25.w,
                                    decoration: BoxDecoration(
                                      color: green,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: CommonImage('asset/image/ic_camera.png'),
                                  ),

                                  /// Add Container
                                  Container(
                                    margin: EdgeInsets.only(left: 17.w, top: 10.h),
                                    width: 6.w,
                                    height: 6.w,
                                    decoration: BoxDecoration(
                                      color: pink,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      size: 18,
                                      color: white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  )),

              Align(
                  child: CommonTextView(
                txtUploadImage,
                color: black,
                fontSize: 13.sp,
              )),

              /// common Container
              commonContainer(
                /// text Pet Name
                txtPetName,

                /// Textfield Pets name
                CommonTextField(
                  keyBoardType: TextInputType.name,
                  nameController: petController,
                  hintText: txtPetsName,
                  borderSide: BorderSide.none,
                ),
              ),

              divider(),

              commonContainer(
                /// Text Gender
                txtPetGender,

                /// Wrap Gender
                Wrap(
                  children: gender.map((e) {
                    return wrapContainer(() {
                      setState(() {
                        selectGender = e;
                      });
                    }, selectGender == e ? bottomColor : containerColor, selectGender == e ? white : Colors.grey, e);
                  }).toList(),
                ),
              ),
              divider(),

              /*commonContainer(
                /// Text Dog Breed
                txtDogBreeds,

                /// Textfield DogBreed
                CommonTextField(
                  keyBoardType: TextInputType.name,
                  nameController: dogBreedController,
                  hintText: txtPetBreed,
                  borderSide: BorderSide.none,
                ),
              ),*/
              Padding(
                padding: const EdgeInsets.only(left: 14, right: 14),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: CommonTextView(
                          txtDogBreeds,
                          color: black,
                          fontSize: 14.sp,
                        )),

   /// Dog Breed Container
                    GestureDetector(
                      onTap: () {
                      /*Navigator.pushNamed(context,  '/riddhi').then((value) {
                        var emoji = (value as Map)['emoji'];
                        var emojiName =  (value as Map)['emojiName'];
                      });*/
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DogBreedScreen(

                        )));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 1.5.h),
                        width: 100.w,
                        height: 6.h,
                        decoration: BoxDecoration(
                          color: containerColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),



                  ],
                ),
              ),

              divider(),

              commonContainer(
                /// Text DogSize
                txtDogSize,

                /// Wrap DogSize
                Wrap(
                  children: dogSize.map((e) {
                    return wrapContainer(() {
                      setState(() {
                        selectDogSize = e;
                      });
                    }, selectDogSize == e ? bottomColor : containerColor, selectDogSize == e ? white : Colors.grey, e);
                  }).toList(),
                ),
              ),
              divider(),

              commonContainer(
                /// Text Address
                Address,

                /// Textfield Address
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.none,
                  decoration: InputDecoration(
                      hintText: txtAddAnAddress,
                      hintStyle: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                      ),
                      fillColor: containerColor,
                      filled: true,
                      enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none)),
                  style: TextStyle(fontSize: 14.sp, color: green),
                  cursorColor: Colors.grey,
                  controller: addressController,
                  maxLines: 4,
                ),
              ),

              divider(),

              commonContainer(
                /// Text Email
                txtEmail,

                /// TextField Email
                CommonTextField(
                  keyBoardType: TextInputType.emailAddress,
                  nameController: emailController,
                  hintText: txtEnterYourEmail,
                  borderSide: BorderSide.none,
                ),
              ),
              divider(),

              commonContainer(
                /// Text Birthday
                txtBirthday,

                /// Textfield Birthday
                CommonTextField(
                  keyBoardType: TextInputType.number,
                  nameController: birthdayController,
                  hintText: txtBirthdayDate,
                  borderSide: BorderSide.none,
                ),
              ),

              /// Button Save
              Container(
                margin: EdgeInsets.only(right: 3.w, left: 3.w, top: 5.h),
                child: CommonButton(
                  btnText: btnSave,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const UserProfileScreen()));
                  },
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Common Divider
  Widget divider() {
    return Divider(
      color: Colors.grey.shade200,
      thickness: 0.40.w,
    );
  }

  /// Select Container
  Widget wrapContainer(Function onPressed, Color color, Color textColor, String name) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        margin: EdgeInsets.only(right: 3.w),
        alignment: Alignment.center,
        width: 27.w,
        height: 5.5.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: CommonTextView(
          name,
          fontSize: 12.sp,
          color: textColor,
        ),
      ),
    );
  }

  /// Common Container
  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
  Widget commonContainer(String textName, Widget) {
    return Container(
      padding: EdgeInsets.only(right: 4.w, left: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTextView(
            textName,
            color: black,
            fontSize: 14.sp,
          ),
          SizedBox(
            height: 1.h,
          ),
          Widget
        ],
      ),
    );
  }
}
