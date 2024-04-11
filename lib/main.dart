import 'package:dog_buddy_dog/api_screen.dart';
import 'package:dog_buddy_dog/calender.dart';
import 'package:dog_buddy_dog/dog_api.dart';
import 'package:dog_buddy_dog/dog_breed_api.dart';
import 'package:dog_buddy_dog/id_screen.dart';
import 'package:dog_buddy_dog/mobail_number_otp.dart';
import 'package:dog_buddy_dog/mobail_screen.dart';
import 'package:dog_buddy_dog/riddhi.dart';
import 'package:dog_buddy_dog/share_image_post_screen.dart';
import 'package:dog_buddy_dog/social_screen.dart';
import 'package:dog_buddy_dog/spalsh_screen.dart';
import 'package:dog_buddy_dog/sub_breed_api.dart';
import 'package:dog_buddy_dog/tabbar.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import 'country_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
    systemNavigationBarIconBrightness: Brightness.dark,
         systemNavigationBarColor: Colors.black12,
    statusBarColor: transparent, // status bar color
  ));
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          color: transparent,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',

          theme: ThemeData(

            primarySwatch: Colors.blue,
          ),
          home:const SplashScreen(),
        );
      },
    );
  }
}

/*
Config: debug
Store: C:\Users\ADMIN\.android\debug.keystore
Alias: AndroidDebugKey
MD5: D0:04:67:C6:43:C0:99:CE:C7:BB:20:6E:66:88:E1:A9
SHA1: 4A:67:FA:B5:B8:AE:0F:56:7C:16:05:9E:50:C6:E9:A0:49:70:10:D8
SHA-256: E0:6E:D9:CE:71:47:81:88:9B:69:D4:C6:F3:3F:C5:3B:AA:A6:DD:B0:3D:F1:70:80:15:CA:59:A0:1F:80:9E:B7
Valid until: Friday, 26 January, 2052
*/
