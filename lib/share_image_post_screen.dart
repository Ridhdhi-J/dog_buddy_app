
import 'package:dog_buddy_dog/widgets/common_textfield.dart';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';



class ShareImagePostScreen extends StatefulWidget {
  const ShareImagePostScreen({Key? key}) : super(key: key);

  @override
  State<ShareImagePostScreen> createState() => _ShareImagePostScreenState();
}

class _ShareImagePostScreenState extends State<ShareImagePostScreen> {
  TextEditingController captionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController tagController = TextEditingController();
  String select = "Worldwide";

  bool _switchValue = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: (){
            },
            child: Container(
              color: Colors.transparent,
              alignment: Alignment.center,
              child: CommonTextView(
                "Share",

                fontSize: 15.sp,
              ),
            ),
          )
        ],
        title: CommonTextView("New Moment",color: Colors.black,fontSize: 15.sp,),
      ),
      body: Container(
        padding:  EdgeInsets.only(left: 4.w,right: 4.w,top: 4.w),
        height: 60.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  width: 30.w,
                  height: 30.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset("assets/dog_image.png",fit: BoxFit.cover,),
                ),
                SizedBox(
                  width: 60.w,
                  child: TextField(
                    controller: captionController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 4.w),

                      filled: true,
                      //   contentPadding: EdgeInsets.only(left: 4.vw, right: 4.vw),
                      hintText: "Say Something",
                      hintStyle: TextStyle(
                        color: Colors.black26,
                        fontSize: 13.sp,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:  BorderSide(width: 1, ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:  BorderSide(width: 1, ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:  BorderSide(width: 1, ),
                      ),
                    ),

                  ),
                ),

              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 3.w),
                  height: 15.w,
                  width: 15.w,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    image: DecorationImage(
                        image: AssetImage("assets/icons/ic_location3.png"),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
                CommonTextView("Add Location",fontSize: 16.sp,color: Colors.black,),
              ],
            ),
               SizedBox(height: 2.h,),
               Row(
                 children: [
                   GestureDetector(
                     onTap: () {
                       setState(() {
                         select = "Worldwide";
                       });
                     },
                     child: Container(
                       alignment: Alignment.center,
                       width: 35.w,
                       height: 6.1.h,
                       decoration: BoxDecoration(
                           border: Border.all(color: select == "Worldwide" ? Colors.white : Colors.green,width: 0.30.w),
                           color: select == "Worldwide" ?Colors.pink : Colors.white,
                        borderRadius: BorderRadius.circular(10)
                       ),

                       child: CommonTextView("Worldwide",color: Colors.white,),
                     ),
                   ),
                   GestureDetector(
                     onTap: () {
                       setState(() {
                         select = "Friends Only";
                       });
                     },
                     child: Container(
                       alignment: Alignment.center,
                       width: 35.w,
                       height: 6.1.h,
                       decoration: BoxDecoration(
                          border: Border.all(color: select == "Friends Only" ? Colors.white : Colors.green,width: 0.30.w),
                           color: select == "Friends Only" ? Colors.pink : Colors.white,
                         borderRadius: BorderRadius.circular(10)
                       ),
                       child: CommonTextView("Friends Only",color: Colors.white,),
                     ),
                   )
                 ],
               ),


            SizedBox(height: 3.h,),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 3.w),
                  height: 15.w,
                  width: 15.w,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    image: DecorationImage(
                      image: AssetImage("assets/icons/ic_location3.png"),
                      fit: BoxFit.cover
                    ),
                  ),
                ),
                CommonTextView("Add Location",fontSize: 16.sp,color: Colors.black,),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 18.w),
              child: CommonTextField(
                hintText: "Add Location",
                 keyBoardType: null, nameController: locationController,
              ),
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 3.w),
                  height: 15.w,
                  width: 15.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),

                  ),
                  child: CommonTextView("#",fontSize: 28.sp),
                ),
                CommonTextView("Add Tag",fontSize: 16.sp,color: Colors.black,),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 18.w),
              child: CommonTextField(
                hintText: "Add Tag",
                  keyBoardType:TextInputType.name, nameController: locationController,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 3.w),
                  height: 15.w,
                  width: 15.w,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/icons/ic_comment1.png"),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
                CommonTextView("Turn On Comment",fontSize: 16.sp,color: Colors.black,),
                const Spacer(),
                CupertinoSwitch(

                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(left: 20.w),
              child: CommonTextView("Lorem Ipsum is simply dummy text typesetting the printing and typesetting industry.",color: Colors.black,),
            ),
          ],
        ),
      ),
    );
  }
}
