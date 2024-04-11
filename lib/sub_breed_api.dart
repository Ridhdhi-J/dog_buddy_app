import 'dart:convert';
import 'package:dog_buddy_dog/browse_breed_sub_breed.dart';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

class SubBreedApi extends StatefulWidget{
  const SubBreedApi({Key? key}) : super(key: key);

  @override
  State<SubBreedApi> createState() => _SubBreedApiState();
}

class _SubBreedApiState extends State<SubBreedApi> {
  List  subBreed =[];
  Map  name = {};



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SubBreed();
  }
  Future SubBreed() async {
    final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/list/all'));
    var responseJson = json.decode(response.body.toString());
    setState(() {
      name=responseJson["message"];
      name.forEach((key, value) {
        subBreed.add(key);

      });
      print(name);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Wrap(
              children:  subBreed.map((e) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BrowseBreed(
                      breed :e
                    )));

                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 2.w,top: 4),
                    width: 22.w,
                    height: 6.h,
                    decoration: BoxDecoration(
                        color: pink,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Text(e,style:TextStyle(color: black,fontSize: 12.sp,)),


                  ),
                );
              }).toList(),
            )

          ],
        ),
      ),
    );
  }
}