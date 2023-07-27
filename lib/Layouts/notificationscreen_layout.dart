import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class NotificationLayout extends StatelessWidget {
   const NotificationLayout({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: const Color(0XFF2C2F45),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_sharp,
            size: 35.sp,
            color: Colors.white,

          ),
        ),
        title: Text("Notifications", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20.sp),),
        elevation: 0,

      ),
      body: child
    );
  }
}
