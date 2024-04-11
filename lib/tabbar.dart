import 'package:flutter/material.dart';


class Tabbar extends StatefulWidget{
  const Tabbar({Key? key}) : super(key: key);

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {

  TabBar get _tabBar => TabBar(
    tabs: [
      Tab(icon: Icon(Icons.call)),
      Tab(icon: Icon(Icons.message)),
    ],
  );
  TabController? controller;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: /*TabBar(

                unselectedLabelColor: Colors.blue,
                indicatorColor: pink,
                indicatorWeight: 0.80.w,
                labelPadding: EdgeInsets.only(bottom: 1.h),
                indicatorSize: TabBarIndicatorSize.tab,
                controller: controller,
                tabs:[
                  Icon(Icons.home,color: Colors.pink,),
                  Icon(Icons.home,color: Colors.pink)
                ] ) ,*/PreferredSize(
            preferredSize: _tabBar.preferredSize,
          child: ColoredBox(
          color: Colors.pink,
          child: _tabBar,
      ),

          ),

        ),
        )
    );
  }
}