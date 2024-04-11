import 'package:alphabet_search_view/alphabet_search_view.dart';
import 'package:dog_buddy_dog/widgets/common_appbar.dart';
import 'package:dog_buddy_dog/widgets/common_button.dart';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DogBreedScreen extends StatelessWidget {
  const DogBreedScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(

        /// app bar
        appBar: CommonAppBar(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Text Dog Breed
              Container(
                  margin: EdgeInsets.only(left: 3.w, bottom: 2.h),
                  child: CommonTextView(
                    txtDogBreeds,
                    color: black,
                    fontSize: 22.sp,
                  )),
              Align(
                  alignment: Alignment.topRight,
                  child: CommonTextView(
                    txtIAmNotSure,
                    color: green,
                    fontSize: 13.sp,
                  )),

              /// Alphabet search view
              Expanded(
                child: AlphabetSearchView.stringList(
                  decoration: AlphabetSearchDecoration.fromContext(
                    context,
                    color: textColor,
                    dividerThickness: 0.w,
                    /// Search text
                    letterHeaderTextStyle: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w400,
                    ),

                    /// Alphabet text
                    titleStyle: TextStyle(
                      fontSize: 14.sp,
                      color: black,

                     ),
                  ),

                  /// Name List
                  list: ridhi,
                  onItemTap: (context, index, item) {
                    print(item.title);
                  },
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              CommonButton(
                btnText: 'Done',
                fontSize: 16.sp,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ));
  }
}
