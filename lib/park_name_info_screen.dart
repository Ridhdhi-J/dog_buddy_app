import 'package:dog_buddy_dog/widgets/common_appbar.dart';
import 'package:dog_buddy_dog/widgets/common_image.dart';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// List Timings
// ignore: camel_case_types
class weekList {
  Color color;
  String name;
  String timing;

  weekList({required this.name, required this.timing, required this.color});
}

class ParkNameInfoScreen extends StatelessWidget {
  const ParkNameInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        onPressed: () {
          Navigator.pop(context);
        },
        title: txtParkNameInfo,
        color: textColor,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// image
              Container(
                margin: EdgeInsets.only(bottom: 1.h),
                clipBehavior: Clip.antiAlias,
                width: 100.w,
                height: 20.h,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: CommonImage(
                  'asset/image/1.png',
                  boxFit: BoxFit.cover,
                ),
              ),

              /// Location
              Row(
                children: [
                  containerList(
                    'asset/image/ic_park_location.png',
                  ),
                  CommonTextView(
                    txtAddress,
                    fontSize: 13.sp,
                    color: black,
                  ),
                ],
              ),

              /// Web
              Row(
                children: [
                  containerList('asset/image/ic_web.png'),
                  CommonTextView(
                    txtWeb,
                    fontSize: 13.sp,
                    color: black,
                  )
                ],
              ),

              /// Call
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  containerList('asset/image/ic_call.png'),
                  CommonTextView(
                    txtNumber,
                    fontSize: 13.sp,
                    color: Colors.black,
                  ),
                ],
              ),

              /// Flax
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  containerList('asset/image/ic_flax.png'),
                  CommonTextView(
                    txtNumber1,
                    fontSize: 13.sp,
                    color: black,
                  )
                ],
              ),
              SizedBox(
                height: 1.h,
              ),

              /// Text Park Timing
              CommonTextView(
                txtParkTiming,
                fontSize: 18.sp,
                color: darkGreen,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 1.h,
              ),

              /// Wrap
              Wrap(
                runSpacing: 1.h,
                children: week.map((e) {
                  /// Main Container
                  return Container(
                    padding: EdgeInsets.only(left: 3.w),
                    width: 100.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: e.color,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        /// Text Container
                        Container(
                          alignment: Alignment.center,
                          width: 30.w,
                          height: 4.h,
                          child: CommonTextView(
                            e.name,
                            fontSize: 13.sp,
                          ),
                        ),

                        /// Conatiner white Line
                        Container(
                          margin: EdgeInsets.only(left: 5.w, right: 5.w),
                          width: 0.30.w,
                          height: 3.h,
                          color: white,
                        ),
                        CommonTextView(
                          e.timing,
                          fontSize: 13.sp,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// List Container
  Widget containerList(String image) {
    return Container(
      margin: EdgeInsets.only(bottom: 0.5.h, right: 2.w, top: 0.5.h),
      width: 10.w,
      height: 10.w,
      child: CommonImage(image),
    );
  }
}
