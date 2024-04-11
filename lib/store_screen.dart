import 'package:dog_buddy_dog/park_name_info_screen.dart';
import 'package:dog_buddy_dog/search_screen.dart';
import 'package:dog_buddy_dog/user_profile_screen.dart';
import 'package:dog_buddy_dog/widgets/common_image.dart';
import 'package:dog_buddy_dog/widgets/common_search_dog.dart';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';

class SelectImage {
  /// List name Image
  // ignore: non_constant_identifier_names
  SelectImage({Key? Key, required this.name, required this.image, this.isSelect = false});

  String name;
  String image;
  bool isSelect;
}

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {

  int select = 0;
  PageController controller = PageController();
  String riddhi = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonSearchDog(
        leadingWidth: 0,
        dog: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const UserProfileScreen()));
        },
        onpressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
        },
        title: txtStore,
      ),
      body: Column(
        children: [
          /// Row Text Select
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                /// Pet Store
                rowList(txtPetStore, () {
                  setState(() {
                    select = 0;
                    controller.animateToPage(0, duration: const Duration(milliseconds: 100), curve: Curves.ease);
                  });
                }, select == 0 ? darkGreen : white, select == 0 ? white : textColor, select == 0 ? white : textColor),

                /// Pet Salon
                rowList(txtPetSalon, () {
                  setState(() {
                    select = 1;
                    controller.animateToPage(1, duration: const Duration(milliseconds: 1000), curve: Curves.ease);
                  });
                }, select == 1 ? textColor : white, select == 1 ? white : textColor, select == 1 ? white : textColor),

                /// Pet Restaurants
                rowList(txtPetRestaurants, () {
                  setState(() {
                    select = 2;
                    controller.animateToPage(2, duration: const Duration(milliseconds: 1000), curve: Curves.ease);
                  });
                }, select == 2 ? textColor : white, select == 2 ? white : textColor, select == 2 ? white : textColor),

                /// clinics
                rowList(txtClinics, () {
                  setState(() {
                    select = 3;
                    controller.animateToPage(3, duration: const Duration(milliseconds: 1000), curve: Curves.ease);
                  });
                }, select == 3 ? textColor : white, select == 3 ? white : textColor, select == 3 ? white : textColor),
              ],
            ),
          ),
          /// PageView
          SizedBox(
            height: 65.h,
            child: Expanded(
              child: PageView(
                physics: const BouncingScrollPhysics(parent: NeverScrollableScrollPhysics()),
                controller: controller,
                children: [
                  Expanded(
                    child: GridView.count(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.only(left: 2.w, right: 2.w),
                      childAspectRatio: (2 / 1.2),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      crossAxisSpacing: 3.w,
                      mainAxisSpacing: 3.w,
                      children: imageList.map((e) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              riddhi = e.name;
                              /*riddhi = e.isSelect ;*/
                            });
                          },

                          /// Main Container
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: AssetImage(e.image),
                                  fit: BoxFit.cover,
                                )),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    /// Alarm Container
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ParkNameInfoScreen()));
                                      },
                                      /// Alarm image
                                      child: Container(
                                        padding: EdgeInsets.all(1.5.w),
                                        width: 6.5.w,
                                        height: 6.5.w,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: white, width: 0.40.w),
                                          color: darkgreen,
                                          borderRadius: BorderRadius.circular(100),
                                        ),
                                        child: CommonImage('asset/image/ic_alram.png'),
                                      ),
                                    ),

                                    /// Select done
                                    SizedBox(
                                      width: 6.5.w,
                                      height: 6.5.w,
                                      child: CommonImage(
                                        // ignore: unrelated_type_equality_checks
                                        riddhi == e.name ? 'asset/image/ic_done.png' : "asset/image/clean_button.png",
                                        boxFit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),

                                /// Text Store
                                CommonTextView(
                                  e.name,
                                  fontSize: 14.sp,
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    width: 20.w,
                    height: 10.h,
                    color: Colors.pink,
                  ),
                  Container(
                    width: 20.w,
                    height: 10.h,
                    color: Colors.grey,
                  ),
                  Container(
                    width: 20.w,
                    height: 10.h,
                    color: Colors.pink,
                  ),
                ],
              ),
            ),
          ),

          /// GridView.count
        ],
      ),
    );
  }

  /// List top
  Widget rowList(String name, Function onPressed, Color color, Color borderColor, Color textColor) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        margin: EdgeInsets.only(right: 3.w, bottom: 3.h),
        padding: EdgeInsets.only(left: 3.w, right: 3.w),
        alignment: Alignment.center,
        height: 6.h,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: CommonTextView(
          name,
          fontSize: 14.sp,
          fontWeight: FontWeight.w300,
          color: textColor,
        ),
      ),
    );
  }
}
