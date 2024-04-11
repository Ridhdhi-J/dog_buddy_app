import 'dart:convert';
import 'package:dog_buddy_dog/widgets/common_button.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

class DogBreedApi extends StatefulWidget{
  const DogBreedApi({Key? key}) : super(key: key);

  @override
  State<DogBreedApi> createState() => _DogBreedApiState();
}

class _DogBreedApiState extends State<DogBreedApi> {
  List breed = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DogBreed();
  }
  Future DogBreed() async {
    final response = await http.get(Uri.parse('https://newsapi.org/v2/everything?q=cricket&sortBy=publishedAt&apiKey=f217beb8b57140f79bf1a442777bc85f'));
   var  responseJson = json.decode(response.body.toString());
    print(responseJson);
    setState(() {
      breed = [];
      breed.addAll(responseJson["message"]);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body:Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: breed.length,
                itemBuilder: (context ,  int index) {
                  return Container(
                    width: 50.w,
                    height: 50.h,
                    child: Image.network(breed[index]),
                  );
                }
            ),
          ),
          CommonButton(
              btnText:btnNext,
              fontSize: 18.sp,
              onPressed: () {
                setState(() {
                  DogBreed();
                });
              }
          )
        ],
      ),

    );
  }
}