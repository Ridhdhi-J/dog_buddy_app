import 'dart:convert';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:http/http.dart' as http ;
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class API extends StatefulWidget{
  const API({Key? key}) : super(key: key);

  @override
  State<API> createState() => _APIState();
}


class _APIState extends State<API> {
List data = [];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsersFromGitHub();
  }
  Future fetchUsersFromGitHub () async {
    final response = await http.get(Uri.parse('https://api.github.com/users'));
    List responseJson = json.decode(response.body.toString());
   setState(() {
     data.addAll(responseJson);
   });
    print(data);

  }


  @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: pink,
       body: ListView.builder(
           itemCount: data.length,
           itemBuilder: (context , index) {
             return Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Container(
                   margin: EdgeInsets.only(left: 3.w,right: 3.w,top: 2.h),
                   width: 15.w,
                   height: 7.5.h,
                   decoration: BoxDecoration(
                       color: pink,
                     borderRadius: BorderRadius.circular(100),
                     image: DecorationImage(
                       image: NetworkImage(data[index]['avatar_url']),
                     )
                   ),

                 ),
                 CommonTextView(data[index]["login"],
                     color: Colors.white,
                     fontSize: 16.sp,

                     fontWeight: FontWeight.w400
                 ),

                 Divider(),
               ],
             );
           }
       ),
     );
  }
}