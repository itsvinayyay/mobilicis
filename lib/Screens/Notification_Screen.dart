import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilicis/Layouts/notificationscreen_layout.dart';

class NotificationScreen extends StatelessWidget {
  static const String routeName = "./Notification";

  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationLayout(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
        color: Colors.grey.shade100,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0XFF2C2F45),
                borderRadius: BorderRadius.circular(20),
              ),
              width: 300.w,
              height: 350.h,
              child: Center(
                  child: Text(
                "Notifications will appear here!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.sp),
              ),),
            )
          ],
        ),
      ),
    );
  }
}
