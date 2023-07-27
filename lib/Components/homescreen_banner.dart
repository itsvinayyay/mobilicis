import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeScreenBanner extends StatefulWidget {
  const HomeScreenBanner({super.key});

  @override
  State<HomeScreenBanner> createState() => _HomeScreenBannerState();
}

class _HomeScreenBannerState extends State<HomeScreenBanner> {
  int _currentpage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  late Timer _timer;
  int pagenumber = 0;


  late Image image1;
  late Image image2;
  late Image image3;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentpage < 3) {
        _currentpage++;
      } else {
        _currentpage = 0;
      }

      _pageController.animateToPage(_currentpage,
          duration: const Duration(milliseconds: 350), curve: Curves.easeIn);
    });

    image1 = Image.network("https://www.oruphones.com/_next/image?url=https%3A%2F%2Fd1tl44nezj10jx.cloudfront.net%2Fweb%2Fassets%2Fbanner_4.webp&w=3840&q=75");
    image2 = Image.network("https://www.oruphones.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fbanner_web_2.4927cf76.png&w=3840&q=75");
    image3 = Image.network("https://www.oruphones.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fbanner_web_3.fa2ffdd8.png&w=3840&q=75");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    precacheImage(image1.image, context);
    precacheImage(image2.image, context);
    precacheImage(image3.image, context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 100.h,
            child: PageView(
              onPageChanged: (value) {
                setState(
                  () {
                    pagenumber = value;
                  },
                );
              },
              controller: _pageController,
              children: [
                /* Don't forget to change the value in the slider as well if you change
              the number of items in this list. */
                SizedBox(
                  width: 360.w,
                  child: image1,
                ),
                SizedBox(
                  width: 360.w,
                  child: image2,
                ),
                SizedBox(
                  width: 360.w,
                  child: image3,
                ),
              ],
            )),
        SizedBox(height: 5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) => buildContainer(index)),
        ),
      ],
    );
  }

  AnimatedContainer buildContainer(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 3.5.w),
      height: 10,
      width: pagenumber == index ? 30.w : 10.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: pagenumber == index ? const Color(0XFF2C2F45) : Colors.grey.shade400,
      ),
    );
  }

  Container buildContainers(
      Color reqdcolor1,
      Color reqdcolor2,
      Color reqdcolor3,
      Color reqdcolor4,
      Color reqdcolor5,
      String intro,
      String mainLine) {
    return Container(
      height: 100.h,
      width: 730.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                reqdcolor1,
                reqdcolor2,
                reqdcolor3,
                reqdcolor4,
                reqdcolor5,
              ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: Text(
              intro,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Text(
              mainLine,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          )
        ],
      ),
    );
  }
}
