import 'package:cached_network_image/cached_network_image.dart';
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
                  child: CachedNetworkImage(
                    imageUrl: imagerurl,
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()), // Placeholder while the image is loading
                    errorWidget: (context, url, error) => const Icon(Icons.error), // Error placeholder if the image fails to load
                  ),
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
