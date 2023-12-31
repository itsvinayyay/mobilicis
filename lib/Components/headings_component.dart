import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Text heading({required String text}) => Text(
      text,
      style: TextStyle(
          color: Colors.grey, fontSize: 13.sp, fontWeight: FontWeight.w500),
    );

Text sheetHeading({required String text}) => Text(
  text,
  style: TextStyle(
      color: Colors.grey.shade800, fontSize: 14.sp, fontWeight: FontWeight.w500),
);
