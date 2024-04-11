import 'package:dog_buddy_dog/widgets/common_appbar.dart';
import 'package:dog_buddy_dog/widgets/common_image.dart';
import 'package:dog_buddy_dog/widgets/common_textfield.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// Comment List
// ignore: camel_case_types
class commentList {
  String image;
  String name;
  String nameGrey;
  String nameGreen;
  bool like;

  commentList({required this.image, required this.name, required this.nameGrey, required this.nameGreen, this.like = true});
}

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App bar
      appBar: CommonAppBar(
          onPressed: () {
            Navigator.pop(context);
          },
          title: txtComment, color: black),
      body: Padding(
        padding: const EdgeInsets.all(12),

        /// stack use
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),

              /// Wrap comment
              child: Wrap(
                runSpacing: 2.h,
                children: listComment.map((e) {
                  return Row(
                    children: [
                      /// image container
                      Container(
                        margin: EdgeInsets.only(right: 3.w),
                        width: 16.w,
                        height: 16.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: CommonImage(e.image),
                      ),
                      SizedBox(
                        width: 60.w,

                        /// Rich text
                        child: RichText(
                          maxLines: 3,
                          text: TextSpan(text: e.name, style: TextStyle(fontSize: 14.sp, color: black), children: [
                            TextSpan(text: e.nameGrey, style: TextStyle(fontSize: 13.sp, color: Colors.grey)),
                            TextSpan(text: e.nameGreen, style: TextStyle(fontSize: 12.sp, color: textColor)),
                          ]),
                        ),
                      ),
                      const Spacer(),

                      /// Like Container
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            e.like = !e.like;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(3.w),
                          width: 10.w,
                          height: 10.w,
                          child: CommonImage(
                            e.like ? 'asset/image/ic_comment_like.png' : 'asset/image/ic_border_comment.png',
                            boxFit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  /// Row container
                  Container(
                    margin: EdgeInsets.only(right: 2.w),
                    width: 15.w,
                    height: 15.w,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: CommonImage('asset/image/1chat.png'),
                  ),

                  /// TextField
                  Flexible(
                    child: CommonTextField(
                      keyBoardType: TextInputType.name,
                      nameController: controller,
                      hintText: txtType,
                      borderSide: BorderSide.none,

                      /// Icon
                      suffixIcon: const Icon(
                        Icons.send,
                        color: textfieldIconColor,
                      ),
                      prefixIcon: const Icon(
                        Icons.tag_faces,
                        color: textfieldIconColor,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
