import 'package:dog_buddy_dog/widgets/common_button.dart';
import 'package:dog_buddy_dog/widgets/common_textfield.dart';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class IdScreen extends StatefulWidget{
  String? name;
  String? email;
  String? image;
  String? phoneNumber;
    IdScreen({Key? key,this.name,this.image,this.email,this.phoneNumber}) : super(key: key);

  @override
  State<IdScreen> createState() => _IdScreenState();
}

class _IdScreenState extends State<IdScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 12,right: 12),
        height: 50 .h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              child: Container(
                clipBehavior: Clip.antiAlias,
                width: 35.w,
                height: 35.w,
                decoration: BoxDecoration(
                  color: pink,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Image.network(widget.image.toString(),fit: BoxFit.fill,),
              ),
            ),

            CommonTextView('Name :-  ${widget.name.toString()}',fontSize: 16.sp,color: black,),

            CommonTextView('Email ID :-  ${widget.email.toString()}',color: black,fontSize: 16.sp,),
            CommonTextView('Phone Number :-  ${widget.phoneNumber.toString()}',color: black,fontSize: 16.sp,) ,

            CommonButton(
                btnText: btnSubmit,
                fontSize: 16.sp,
                onPressed: () {
                },
            ),
          ],
        ),
      ),
    );
  }
}