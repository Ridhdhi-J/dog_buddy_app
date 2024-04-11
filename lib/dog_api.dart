import 'dart:convert';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

class DogApi extends StatefulWidget{
  const DogApi({Key? key}) : super(key: key);

  @override
  State<DogApi> createState() => _DogApiState();
}

 class _DogApiState extends State<DogApi> {
   var dog ;

   @override
   void initState() {
     // TODO: implement initState
     super.initState();
     dogImage();
   }
   Future dogImage() async {
     final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));
     var responseJson = json.decode(response.body.toString());
     setState(() {
      dog = responseJson;
     });
     print(dog);
   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('hello'),
         actions: [
           ElevatedButton(
               onPressed: (){
                 setState(() {
                   dogImage();
                 });
               },
               child: Text('Riddhi',style: TextStyle(color: pink,fontSize: 16.sp),),
           ),
         ],
       ),
       body:  dog != null ? Image.network(dog['message']) : SizedBox(),
     );
   }
 }
