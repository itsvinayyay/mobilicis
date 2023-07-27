import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container dealCard(
    {required String imagerurl,
    required String mrp,
    required String name,
    required String storage,
    required String condition,
    required String location,
    required String date,
    required bool islike}) {
  return Container(
    height: 200,
    decoration: BoxDecoration(

      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
    ),
    padding: EdgeInsets.symmetric(
      horizontal: 6.w,
      vertical: 5.h,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: Center(
                child: SizedBox(
                  width: 140.w,
                  height: 100.h,
                  child: Image.network(
                      imagerurl, loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      // Image is not loading, return the original child widget.
                      return child;
                    } else {
                      // Image is loading, show a circular progress indicator.
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 100)
                              : null,
                        ),
                      );
                    }
                  },),
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Icon(
                islike == true ? Icons.favorite : Icons.favorite_outline_rounded,
                color: Colors.red,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "₹ $mrp",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade700,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              storage,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            Text(
              "Condition: $condition",
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              location,
              style: TextStyle(
                fontSize: 8.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            Text(
              date,
              style: TextStyle(
                fontSize: 8.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
