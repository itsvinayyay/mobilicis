import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
SizedBox filterScroll(List<dynamic>? receivedList, BuildContext context) {
  return SizedBox(
    height: 40.h,
    width: MediaQuery.sizeOf(context).width,
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            receivedList?.length ?? 0,
                (index) => Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Container(
                padding:
                EdgeInsets.symmetric(vertical: 3.h, horizontal: 25.w),
                height: 30.h,
                decoration: BoxDecoration(
                  color: index == 0 ? Colors.grey.shade300 : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade400, width: 1),
                ),
                child: Center(
                    child: Text(
                      receivedList?[index] ?? "",
                      style: TextStyle(color: Colors.grey.shade600),
                    )),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Map<String, List<dynamic>> demoMaps = {
  "warranty" : [
    "All",
    "Brand Warranty",
    "Seller Warranty",
  ],
  "verification" : [
    "All",
    "Verified",
  ],
};