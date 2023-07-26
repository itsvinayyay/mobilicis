import 'package:flutter/material.dart';

Widget CustomButton (String title,double width, VoidCallback ontap){
  return Container(
    width: width,
    height: 50,
    child: ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
          backgroundColor: Color(0XFF2C2F45),
      ),
      child: Text(title,style: TextStyle(color: Colors.white,fontFamily: 'Inter',fontWeight: FontWeight.w600),),
    ),
  );
}