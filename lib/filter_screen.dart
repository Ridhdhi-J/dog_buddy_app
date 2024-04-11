import 'package:dog_buddy_dog/dog_breed_screen.dart';
import 'package:dog_buddy_dog/widgets/common_appbar.dart';
import 'package:dog_buddy_dog/widgets/common_button.dart';
import 'package:dog_buddy_dog/widgets/common_textfield.dart';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  /// Gender List
  List<String> gender = ["Male", "Female"];
  String selectGender = "Male";

  /// Age List
  List<String> age = ['Baby', 'Young', 'Adult'];
  String selectAge = 'Young';

  /// Size List
  List<String> size = ['Small', 'Medium', 'Large'];
  String selectSize = 'Small';

  /// Other

  bool select = true;
  TextEditingController dogBreed = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          height: 90.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextView(
                txtFilter,
                fontSize: 21.sp,
                color: Colors.black,
              ),
              SizedBox(
                height: 2.h,
              ),
              CommonTextView(
                txtDogBreeds,
                fontSize: 15.sp,
                color: Colors.black,
              ),

              /// Common TextField

              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const DogBreedScreen()));
                },
                child: Container(
                  width: 100.w,
                  height: 6.5.h,
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              CommonTextView(
                txtGender,
                fontSize: 15.sp,
                color: black,
              ),
              Row(
                children: [
                  /// Wrap Gender
                  Wrap(
                    runSpacing: 1,
                    children: gender.map((e) {
                      return listContainer(() {
                        setState(() {
                          selectGender = e;
                        });
                      }, e, selectGender == e ? bottomColor : containerColor, selectGender == e ? white : Colors.grey);
                    }).toList(),
                  )
                ],
              ),
              const Divider(
                color: Colors.grey,
              ),
              CommonTextView(
                txtAge,
                fontSize: 15.sp,
                color: Colors.black,
              ),

              /// Wrap Age
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: age.map((e) {
                      return listContainer(
                        () {
                          setState(() {
                            selectAge = e;
                          });
                        },
                        e,
                        selectAge == e ? bottomColor : containerColor,
                        selectAge == e ? white : Colors.grey,
                      );
                    }).toList(),
                  ),
                ],
              ),
              const Divider(
                color: Colors.grey,
              ),
              CommonTextView(
                txtSize,
                fontSize: 15.sp,
                color: Colors.black,
              ),

              /// Wrap Size
              Row(children: [
                Wrap(
                  children: size.map((e) {
                    return listContainer(() {
                      setState(() {
                        selectSize = e;
                      });
                    }, e, selectSize == e ? bottomColor : containerColor, selectSize == e ? white : Colors.grey);
                  }).toList(),
                )
              ]),

              const Divider(
                color: Colors.grey,
              ),

              /// Other
              CommonTextView(
                txtOther,
                fontSize: 15.sp,
                color: black,
              ),

              /// Pet Adopt
              listContainer(() {
                setState(() {
                  select = !select;
                });
              },
                  txtPetAdopt,
                  true == select ? bottomColor : containerColor,
                  true == select ? white : Colors.grey),
              SizedBox(
                height: 11.h,
              ),

              /// Button Save
              CommonButton
                (
                  btnText: btnSave,
                  fontSize: 16.sp,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  /// List Container
  Widget listContainer(Function onPressed, String name, Color color, Color textColor) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        margin: EdgeInsets.only(right: 3.2.w),
        alignment: Alignment.center,
        width: 28.w,
        height: 6.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: CommonTextView(
          name,
          fontSize: 13.sp,
          color: textColor,
        ),
      ),
    );
  }
}
