import 'package:alphabet_scroll_view/alphabet_scroll_view.dart';
import 'package:dog_buddy_dog/search_screen.dart';
import 'package:dog_buddy_dog/widgets/common_appbar.dart';
import 'package:dog_buddy_dog/widgets/common_image.dart';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

///  Alphabet List
// ignore: camel_case_types
class contactList {
  String name;
  String image;

  contactList({required this.name, required this.image});
}

class NewContactScreen extends StatefulWidget {
  const NewContactScreen({Key? key}) : super(key: key);

  @override
  State<NewContactScreen> createState() => _NewContactScreenState();
}

class _NewContactScreenState extends State<NewContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App bar
      appBar: CommonAppBar(
        onPressed: () {
          Navigator.pop(context);
        },
        action: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
            },
            child: Container(
              padding: EdgeInsets.all(3.w),
              width: 15.w,
              height: 5.h,
              child: CommonImage('asset/image/ic_search.png'),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(left: 2.5.w),
              child: CommonTextView(
                txtFriendList,
                color: textColor,
                fontSize: 15.sp,
              )),
          SizedBox(
            height: 2.h,
          ),

          /// Alphabet Scroll view
          Expanded(
            child: AlphabetScrollView(
                alignment: LetterAlignment.left,
                isAlphabetsFiltered: false,
                itemExtent: 18.w,
                list: listContact.map((e) => AlphaModel(e.name)).toList(),
                selectedTextStyle: TextStyle(
                  fontSize: 18.sp,
                  color: white,
                  backgroundColor: bottomColor,

                ),
                unselectedTextStyle: TextStyle(fontSize: 15.sp, color: Colors.grey.shade400),

                /// item Builder
                itemBuilder: (context, index, name) {
                  /// Row image text
                  return Container(
                    margin: EdgeInsets.only(left: 12.w, right: 2.w),
                    child: Row(
                      children: [
                        /// image container
                        Container(
                          margin: EdgeInsets.only(right: 2.w),
                          width: 16.w,
                          height: 16.w,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                          child: CommonImage(listContact[index].image),
                        ),

                        /// Column text
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonTextView(
                              name,
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            CommonTextView(
                              txtLoreumDummy,
                              color: textColor,
                              fontSize: 12.sp,
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
