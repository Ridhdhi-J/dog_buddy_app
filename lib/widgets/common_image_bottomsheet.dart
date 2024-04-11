import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'constants.dart';

// ignore: must_be_immutable
class CommonImageBottomSheet extends StatefulWidget {
  Widget column;
  Widget textButton;

  CommonImageBottomSheet({Key? key, required this.textButton, required this.column}) : super(key: key);

  @override
  State<CommonImageBottomSheet> createState() => _CommonImageBottomSheetState();
}

class _CommonImageBottomSheetState extends State<CommonImageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            backgroundColor: transparent,
            context: context,
            builder: (BuildContext context) {
              return BottomSheet(
                  backgroundColor: transparent,
                  onClosing: () {},
                  builder: (BuildContext context) {
                    return Container(
                        padding: EdgeInsets.only(left: 4.w, top: 1.h),
                        height: 13.h,
                        decoration: const BoxDecoration(
                          color: textColor,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                        ),
                        child: widget.textButton);
                  });
            });
      },
      child: Center(child: widget.column),
    );
  }
}
