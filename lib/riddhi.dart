import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:flutter/material.dart';

class Hello extends StatefulWidget{
  const Hello({Key? key}) : super(key: key);

  @override

  State<Hello> createState() => _HelloState();
}


class _HelloState extends State<Hello> {


  @override
  void initState() {
    /*switch (a) {
      case 1:
        print('a = 1');
        break ;
      case 2:
        print('a = 2');
        break;
      case 3:
        print('a = 3');
        break;
      case 4:
        print('a = 4');
        break;
  case 5:
        print('a = 5');
        break;
    }*/
   /* if (a==1){
      print('a = 1');
    }
    else if (a==2){
      print('a= 2');
    }
    else if (a == 3) {
      print('a = 3');

    }
    else if(a == 4){
      print('a=4');
    }
    else{
      print('a=5');
    }*/
    /*for(int i = 0 ; i<=10; i++) {
      if (i % 2 == 0) {
        print(i);
      }
    }*/

    /*for( i=0; i<=10; i++) {
      for(int j=1; j<i; j++) {
        print(' *');
      }
      print('');
    }*/

    for(int i = 0; i <= 5; i++)
    {
      print('num: $i');

      for(int j = 0; j <=i; j++)
        print('*'* j);


    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommonTextView('Riddhi'),
      ),

    );
  }
}