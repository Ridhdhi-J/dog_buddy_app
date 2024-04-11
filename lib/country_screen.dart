/// API
///  http://165.232.189.85/two-soul-multipz/public/api/getCountry
import 'dart:convert';
import 'package:dog_buddy_dog/state_screen.dart';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class CountryApi extends StatefulWidget{
  const CountryApi({Key? key}) : super(key: key);

  @override
  State<CountryApi> createState() => _CountryApiState();
}

class _CountryApiState extends State<CountryApi> {
  List countryList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Country();
  }
  Future Country() async {
    final response = await http.get(Uri.parse("http://165.232.189.85/two-soul-multipz/public/api/getCountry"));
    var responsJson = json.decode(response.body.toString());
    setState(() {
       countryList = [];
      countryList.addAll(responsJson["data"]);
      print(countryList);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommonTextView("HELLO",color: Colors.pink,fontSize: 16.sp,),
      ),
      body: ListView.builder(
        itemCount:  countryList.length,
          itemBuilder: (context , index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => StateDataScreen(
                      countryId: countryList[index]["id"],
                    )));
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 3.w,right: 3.w),
                    margin: EdgeInsets.only(top: 1.h),
                    alignment: Alignment.center,

                      height: 5.5.h,
                      color:pink,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonTextView(countryList[index]["phonecode"],color: white,fontSize: 12.sp,),
                          CommonTextView(countryList[index]["name"],color: white,fontSize: 14.sp,),

                        ],
                      )),
                ),
              ],
            );
          }
      ),
    );
  }
}