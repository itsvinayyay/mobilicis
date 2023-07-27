import 'package:flutter/material.dart';

Widget customButton (String title,double width, VoidCallback ontap){
  return SizedBox(
    width: width,
    height: 50,
    child: ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
          backgroundColor: const Color(0XFF2C2F45),
      ),
      child: Text(title,style: const TextStyle(color: Colors.white,fontFamily: 'Inter',fontWeight: FontWeight.w600),),
    ),
  );
}