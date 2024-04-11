import 'dart:convert';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class BrowseBreed extends StatefulWidget{
  String? breed ;
   BrowseBreed({Key? key, this.breed}) : super(key: key);

  @override
  State<BrowseBreed> createState() => _BrowseBreedState();
}

class _BrowseBreedState extends State<BrowseBreed> {
  List browseList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BrowseBreedList();
  }
  Future BrowseBreedList() async {
    final response = await http.get(Uri.parse('https://dog.ceo/api/breed/${widget.breed}/images'));
    var responseJson = json.decode(response.body.toString());
    print(browseList);
    setState(() {
      browseList.addAll(responseJson["message"]) ;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('Hello',style: TextStyle(fontSize: 18.sp,color: black),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Wrap(
              children: browseList.map((e) {
                return Container(
                  margin: EdgeInsets.only(left: 2.w,top: 2.h),
                  width: 50.w,
                  height: 25.w,
                  color: pink,
                  child: Image.network(e,fit: BoxFit.cover,),
                );
              }).toList(),
            ),

            CommonTextView('Riddhi',fontSize: 18.sp,color: Colors.pink,),
          ],
        ),
      ),
    );
  }
}