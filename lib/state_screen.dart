/// State API
 // getState?country_id=101
import 'dart:convert';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:http/http.dart' as http;
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'city_screen.dart';

class StateDataScreen extends StatefulWidget{
  int? countryId;
   StateDataScreen({Key? key,this.countryId}) : super(key: key);

  @override
  State<StateDataScreen> createState() => _StateDataScreenState();
}

class _StateDataScreenState extends State<StateDataScreen> {
  List stateList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StateDataApi();
  }
  Future StateDataApi() async {
    final response = await http.get(Uri.parse("http://165.232.189.85/two-soul-multipz/public/api/getState?country_id=${widget.countryId}"));
    var responseJson = json.decode(response.body.toString());
    setState(() {
      stateList = [];
      print(stateList);
      stateList.addAll(responseJson["data"]);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(
   title: CommonTextView('hello',color: Colors.pink,),
 ),
      body: ListView.builder(
        itemCount: stateList.length,
          itemBuilder: (context , index) {
        return Row(
          children: [
            Column(
              children: [
                 GestureDetector(
                   onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => CityScreenApi(
                       stateId: stateList[index]["id"],
                       countryId: widget.countryId,
                     )));
                   },
                   child: Container(
                     margin: EdgeInsets.only(top: 1.h),
                     alignment: Alignment.center,
                       width: 60.w,
                       height: 6.h,
                       color: pink,
                       child: CommonTextView(stateList[index]["name"],color: white,)),
                 ),
              ],
            ),

          ],
        );
      }),

    );
  }
}