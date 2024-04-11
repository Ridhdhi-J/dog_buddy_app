/// City API
// getCity?country_id=101&state_id=101

import 'dart:convert';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

class CityScreenApi extends StatefulWidget{
  int? stateId;
  int? countryId;

   CityScreenApi({Key? key,this.stateId, this.countryId}) : super(key: key);

  @override
  State<CityScreenApi> createState() => _CityScreenApiState();
}

class _CityScreenApiState extends State<CityScreenApi> {
  List cityData =[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CityDataApi();
  }
  Future CityDataApi() async {
    final response = await http.get(Uri.parse("http://165.232.189.85/two-soul-multipz/public/api/getCity?country_id=${widget.countryId}&state_id=${widget.stateId}"));
    var responseJson = json.decode(response.body.toString());
    setState(() {
      cityData = [];
      cityData.addAll(responseJson["data"]);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommonTextView("hello",color: pink,),
      ),
      body: ListView.builder(
        itemCount: cityData.length,
          itemBuilder: (context , index) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 1.h),
                  alignment: Alignment.center,
                  width: 50.w,
                    height: 5.h,
                    color: pink,
                    child: CommonTextView(cityData[index]["name"],color: white,)),
              ],
            );
          }
      ),
    ) ;
  }
}