import 'dart:async';
import 'package:dog_buddy_dog/dog_details_screen.dart';
import 'package:dog_buddy_dog/park_name_info_screen.dart';
import 'package:dog_buddy_dog/search_screen.dart';
import 'package:dog_buddy_dog/user_profile_screen.dart';
import 'package:dog_buddy_dog/widgets/common_image.dart';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

/// dialog box List
// ignore: camel_case_types
class riddhiPark {
  String image;
  String name;
  bool riddhi;

  riddhiPark({required this.image, required this.name, this.riddhi = false});
}

/// park List
// ignore: camel_case_types
class parkList {
  double Latitude;
  double Longitude;
  String name;
  String image;
  bool isSelect;

  parkList({required this.name, required this.image, this.isSelect = false, required this.Latitude, required this.Longitude});
}

class GoToPark extends StatefulWidget {
  const GoToPark({Key? key}) : super(key: key);

  @override
  State<GoToPark> createState() => _GoToParkState();
}

class _GoToParkState extends State<GoToPark> {
  /// Map LatLong
  late final CameraPosition _initialPosition = const CameraPosition(target: LatLng(23.0225, 72.5714), zoom: 10);

  /// Map controller
  final Completer<GoogleMapController> _controller = Completer();

  /// Marker List
  final List<Marker> _marker = <Marker>[];

  /// DialogBox Container
  String selectPark = "";

  ///create google map controller
  Future<void> _onCreatedMap(GoogleMapController controller) async {
    if (!_controller.isCompleted) {
       _controller.complete(controller);
       _setStyle(controller);
    }
  }

  ///set google map style Marker
  void _setStyle(GoogleMapController controller) async {
    /// Set Json file copy path
    String value = await DefaultAssetBundle.of(context).loadString('asset/google-map-style.json');
    controller.setMapStyle(value);
  }

  /// Marker
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    /// Loop

      listPark.forEach((e) async {
        /// Marker image
        final markerImage = await  BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size(24, 24)), 'asset/image/ic_map_marker.png');
        /// marker Add
        /// marker live
        setState(() {
          _marker.add(
            Marker(
                markerId: MarkerId(e.name), position: LatLng(e.Latitude, e.Longitude), icon: markerImage, infoWindow: InfoWindow(title: e.name)),
          );
        });
      });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Stack
      body: Stack(
        children: [
          /// Google Map
          GoogleMap(
            mapType: MapType.normal,
                          /// Marker Icon
            markers: Set<Marker>.of(_marker),
            initialCameraPosition: _initialPosition,
            onMapCreated: _onCreatedMap,
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 6.h),
                child: Row(
                  children: [
                    /// Top text Park
                    CommonTextView(
                      txtParks,
                      color: textColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    const Spacer(),

                    /// Search Container
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
                      },
                      child: Container(
                        width: 10.w,
                        height: 10.w,
                        decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(10)),
                        child: CommonImage('asset/image/location_search.png'),
                      ),
                    ),

                    /// Dog Container
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const UserProfileScreen()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 2.w,
                        ),
                        width: 10.w,
                        height: 10.w,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: CommonImage('asset/image/location_dog.png'),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),

              /// DialogBox
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          backgroundColor: transparent,
                          /// Main Container
                          content: StatefulBuilder(builder: (context, setState) {
                            return Container(
                              width: 100.w,
                              height: 27.h,
                              decoration: BoxDecoration(color: green, borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  /// Text dark green Container
                                  Container(
                                    margin: EdgeInsets.only(bottom: 2.h),
                                    alignment: Alignment.center,
                                    height: 10.h,
                                    decoration: const BoxDecoration(
                                      color: textColor,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                                    ),
                                    child: CommonTextView(
                                      txtSelectPark,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: parkRiddhi.length,
                                        itemBuilder: (BuildContext context, index) {
                                          return Row(
                                            children: [
                                              Column(
                                                children: [
                                                  /// Sammy Container
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        parkRiddhi[index].riddhi = !parkRiddhi[index].riddhi;
                                                      });
                                                    },
                                                    child: Container(
                                                      width: 17.w,
                                                      height: 17.w,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(color: parkRiddhi[index].riddhi ? pink : green, width: 0.50.w),
                                                        borderRadius: BorderRadius.circular(13),
                                                        image: DecorationImage(
                                                          image: AssetImage(parkRiddhi[index].image),
                                                        ),
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        children: [
                                                          Container(
                                                            margin: EdgeInsets.only(top: 0.60.h, bottom: 0.50.h),
                                                            width: 8.w,
                                                            height: 8.w,
                                                            child: CommonImage(
                                                              parkRiddhi[index].riddhi ? 'asset/image/ic_pink_done.png' : 'asset/image/ic_park_green.png',
                                                              boxFit: BoxFit.fill,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),

                                                  /// Text Sammy
                                                  CommonTextView(
                                                    parkRiddhi[index].name,
                                                    fontSize: 13.sp,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 3.w,
                                              ),
                                            ],
                                          );
                                        }),
                                  )
                                ],
                              ),
                            );
                          }));
                    },
                  );
                },

                /// Goto Park Container
                child: Container(
                  width: 23.w,
                  height: 23.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CommonImage(
                    'asset/image/location_goto_park.png',
                  ),
                ),
              ),

              AnimatedContainer(
                constraints: BoxConstraints.loose(Size(100.w, 55.h)),
                duration: const Duration(milliseconds: 1000),

                /// Draggable Scrollable Sheet
                /// bottom sheet style
                child: DraggableScrollableSheet(
                    expand: false,
                    initialChildSize: 0.9,
                    minChildSize: 0.25,
                    maxChildSize: 0.9,
                    builder: (BuildContext context, ScrollController scrollController) {
                      return Container(
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 15.5,
                                spreadRadius: 1.0,
                              ),
                            ],
                            color: white,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                          ),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            controller: scrollController,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 1.h, top: 1.h),
                                      width: 20.w,
                                      height: 0.50.h,
                                      decoration: BoxDecoration(color: green, borderRadius: BorderRadius.circular(1)),
                                    ),
                                  ),
                                  container(
                                    txtSelectYourDogPark,

                                    /// Image Container select
                                    Container(
                                      margin: EdgeInsets.only(top: 1.h),
                                      height: 11.h,

                                      /// ListView Builder
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: listPark.length,
                                        itemBuilder: (BuildContext context, index) {
                                          return GestureDetector(
                                            onTap: () async {
                                              /// map controller
                                              GoogleMapController controller = await _controller.future;

                                              /// Map LatLong
                                              controller.animateCamera(CameraUpdate.newLatLngZoom(LatLng(listPark[index].Latitude, listPark[index].Longitude), 14));
                                              setState(() {
                                                /// select park
                                                selectPark = listPark[index].name;
                                              });
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                right: 3.w,
                                              ),
                                              padding: EdgeInsets.all(2.w),
                                              width: 35.w,
                                              height: 11.h,
                                              decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius: BorderRadius.circular(12),
                                                image: DecorationImage(
                                                  image: AssetImage(listPark[index].image),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ParkNameInfoScreen()));
                                                        },
                                                        child: Container(
                                                          padding: EdgeInsets.all(0.80.w),
                                                          width: 5.w,
                                                          height: 5.w,
                                                          decoration: BoxDecoration(
                                                            color: green,
                                                            borderRadius: BorderRadius.circular(100),
                                                            border: Border.all(color: white, width: 0.30.w),
                                                          ),
                                                          child: CommonImage('asset/image/ic_alram.png'),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                        height: 5.w,
                                                        child: CommonImage(selectPark == listPark[index].name ? 'asset/image/ic_done.png' : 'asset/image/clean_button.png'),
                                                      ),
                                                    ],
                                                  ),
                                                  CommonTextView(
                                                    listPark[index].name,
                                                    fontSize: 12.sp,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.grey.shade300,
                                    thickness: 0.40.w,
                                    height: 4.h,
                                    indent: 5.w,
                                    endIndent: 2.w,
                                  ),
                                  container(
                                    txtDogPark,
                                    Container(
                                      margin: EdgeInsets.only(top: 3.w),
                                      height: 18.w,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: listDog.length,
                                          itemBuilder: (context, index) {
                                            return Stack(
                                              children: [
                                                /// Dog Park Image
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const DogDetailScreen()));
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(right: 2.w),
                                                    width: 18.w,
                                                    height: 18.w,
                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                                                    child: CommonImage(listDog[index]),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(left: 16.w),
                                                  width: 3.w,
                                                  height: 3.w,
                                                  decoration: BoxDecoration(border: Border.all(color: white, width: 0.20.w), color: greenSelect, borderRadius: BorderRadius.circular(100)),
                                                ),
                                              ],
                                            );
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ));
                    }),
              )
            ],
          ),
        ],
      ),
    );
  }

  /// Common List Container
  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
  Widget container(String name, Widget) {
    return Container(
      padding: EdgeInsets.only(left: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTextView(
            name,
            color: textColor,
          ),
          Widget
        ],
      ),
    );
  }
}
