import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobilicis/Components/custom_button.dart';
import 'package:mobilicis/Components/headings_component.dart';
import 'package:mobilicis/Components/homescreen_banner.dart';
import 'package:mobilicis/Components/HomeScreen_BottomSheet.dart';
import 'package:mobilicis/Layouts/HomeScreen_Layout.dart';
import 'package:mobilicis/Components/HomeScreen_DealCard.dart';
import 'package:mobilicis/Logic/Cubits/Filter_Cubit/filter_cubit.dart';
import 'package:mobilicis/Logic/Cubits/Filter_Cubit/filter_state.dart';
import 'package:mobilicis/Logic/Cubits/Post_Cubit/post_cubit.dart';
import 'package:mobilicis/Logic/Cubits/Post_Cubit/post_state.dart';
import 'package:mobilicis/Logic/Notifications/notification_services.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = "./Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PostCubit postCubit = PostCubit();
  bool _isModalVisible = false;
  NotificationServices notificationServices = NotificationServices();


  late Image image1;
  late Image image2;
  late Image image3;
  late Image image4;

  String formatPrice(String price) {
    final numberFormat = NumberFormat("#,##,###");
    int parsedPrice = int.tryParse(price) ?? 0;
    return numberFormat.format(parsedPrice);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationServices.requestNotificationPermission();
    // notificationServices.isTokenRefresh();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.getDeviceToken().then((value) {
      //Can print Device Token here for Production only!
    });

    image1 = Image.network("https://cdn.freebiesupply.com/images/thumbs/2x/apple-logo.png");
    image2 = Image.network("https://image-us.samsung.com/SamsungUS/home/samsung-logo-191-1.jpg");
    image3 = Image.network("https://www.freepnglogos.com/uploads/xiaomi-png/xiaomi-logo-logos-marcas-8.png");
    image4 = Image.network("https://cdn.iconscout.com/icon/free/png-256/free-vivo-1-285323.png");
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    // TODO: implement didUpdateWidget
    precacheImage(image1.image, context);
    precacheImage(image2.image, context);
    precacheImage(image3.image, context);
    precacheImage(image4.image, context);
    super.didUpdateWidget(oldWidget);

  }

  void _showModalBottomSheet() async {
    setState(() {
      _isModalVisible = true;
    });

    // BlocProvider.of<FilterCubit>(context).fetchFilters();

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      // isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
            height: 680.h,
            child: Stack(children: [
              Column(children: [
                Container(
                  height: 50.h,
                  color: Colors.transparent,
                ),
                Expanded(
                  child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 35.w, vertical: 35.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Filters",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Clear Filter",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            BlocBuilder<FilterCubit, FilterState>(
                                builder: (context, state) {
                              if (state is FilterLoadingState) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (state is FilterLoadedState) {
                                return Expanded(
                                  child: SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        sheetHeading(text: "Brand"),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        filterScroll(state.filters["make"], context),
                                        SizedBox(
                                          height: 25.h,
                                        ),
                                        sheetHeading(text: "Ram"),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        filterScroll(state.filters["ram"], context),
                                        SizedBox(
                                          height: 25.h,
                                        ),
                                        sheetHeading(text: "Storage"),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        filterScroll(state.filters["storage"], context),
                                        SizedBox(
                                          height: 25.h,
                                        ),
                                        Row(
                                          children: [
                                            sheetHeading(text: "Conditions"),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            SvgPicture.asset(
                                                "assets/icons/info-circle.svg"),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        filterScroll(
                                            state.filters["condition"], context),
                                        SizedBox(
                                          height: 25.h,
                                        ),
                                        Row(
                                          children: [
                                            sheetHeading(text: "Warranty"),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            SvgPicture.asset(
                                                "assets/icons/info-circle.svg"),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        filterScroll(demoMaps["warranty"], context),
                                        SizedBox(
                                          height: 25.h,
                                        ),
                                        Row(
                                          children: [
                                            sheetHeading(text: "Verification"),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            SvgPicture.asset(
                                                "assets/icons/info-circle.svg"),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        filterScroll(demoMaps["verification"], context),
                                        SizedBox(
                                          height: 25.h,
                                        ),
                                        sheetHeading(text: "Price"),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Min",
                                                  style: TextStyle(
                                                    color: Colors.grey.shade800,
                                                    fontSize: 12.sp,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.w,
                                                      vertical: 2.h),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 1,
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  height: 25.h,
                                                  width: 90.w,
                                                  child: const Text(
                                                    "0",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Max",
                                                  style: TextStyle(
                                                    color: Colors.grey.shade800,
                                                    fontSize: 12.sp,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.w,
                                                      vertical: 2.h),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 1,
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  height: 25.h,
                                                  width: 90.w,
                                                  child: const Text(
                                                    "400000",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 18.h,
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 28.w),
                                                child: Divider(
                                                  thickness: 8.sp,
                                                  color: const Color(0XFF2C2F45),
                                                ),
                                              ),
                                              Positioned(
                                                left: 10,
                                                bottom: 0,
                                                  child: CircleAvatar(
                                                backgroundColor:
                                                    const Color(0XFF2C2F45),
                                                minRadius: 10.sp,
                                                maxRadius: 10.sp,
                                              )),
                                              Positioned(
                                                  right: 10,
                                                  bottom: 0,
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                    const Color(0XFF2C2F45),
                                                    minRadius: 10.sp,
                                                    maxRadius: 10.sp,
                                                  ))
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 2.h,),
                                        customButton("Accept", MediaQuery.sizeOf(context).width, () { }),
                                      ],
                                    ),
                                  ),
                                );
                              }
                              return const Text("An Error is there!");
                            })
                          ],
                        ),
                      )),
                )
              ]),
              Positioned(
                  left: MediaQuery.of(context).size.width / 2 - 28.w,
                  top: 0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      "assets/icons/x-circle.svg",
                      color: Colors.white,
                      width: 40.w,
                      height: 40.h,
                    ),
                  )),
            ]));
      },
    ).whenComplete(() {
      setState(() {
        _isModalVisible = false;
      });
      BlocProvider.of<PostCubit>(context).fetchPosts();
    });
  }



  @override
  Widget build(BuildContext context) {
    return HomeScreenLayout(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heading(text: "Buy Top Brands"),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 70.h,
                    width: 75.w,
                    child: image1,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 70.h,
                    width: 75.w,
                    child: image2,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 70.h,
                    width: 75.w,
                    child: image3,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 70.h,
                    width: 75.w,
                    child: image4,

                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        const HomeScreenBanner(),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heading(text: "Shop By"),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/i1.svg",
                          width: 50.w,
                          height: 50.h,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          height: 30.h,
                          width: 58.w,
                          child: Text(
                            "Bestselling Mobiles",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10.sp),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/i2.svg",
                          width: 50.w,
                          height: 50.h,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          height: 30.h,
                          width: 58.w,
                          child: Text(
                            "Verified Devices Only",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10.sp),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/i3.svg",
                          width: 50.w,
                          height: 50.h,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          height: 30.h,
                          width: 58.w,
                          child: Text(
                            "Like New Condition",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10.sp),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/i4.svg",
                          width: 50.w,
                          height: 50.h,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          height: 30.h,
                          width: 58.w,
                          child: Text(
                            "Phones with Warranty",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10.sp),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      heading(text: "Best Deals Near You"),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        "India",
                        style: TextStyle(
                            color: Colors.yellow.shade600,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      _showModalBottomSheet();
                    },
                    child: Text(
                      "Filter ",
                      style: TextStyle(
                        fontSize: 35.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              BlocConsumer<PostCubit, PostState>(
                listener: (context, state) {
                  // if(state is SearchLoadedState){
                  //   postCubit.fetchPosts();
                  // }
                  // else if(state is SearchLoadingState){
                  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("SearchLoadingState")));
                  //   postCubit.fetchPosts();
                  // }
                  // else if(state is SearchInitialState){
                  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("SearchInitialState")));
                  // }
                  // else if(state is PostLoadedState){
                  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("PostLoadedState")));
                  // }
                  // else if(state is PostErrorState){
                  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("PostErrorState")));
                  // }
                  // else{
                  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error")));
                  // }
                },
                builder: (context, state) {
                  if (state is PostLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is PostLoadedState) {
                    return SizedBox(
                      height: 580.h,
                      child: GridView.builder(
                          shrinkWrap: false,
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 20.0,
                            childAspectRatio: (220.h / 2) / (150.w),
                          ),
                          itemCount: state.posts.length,
                          itemBuilder: (context, index) {
                            return dealCard(
                                imagerurl: state
                                        .posts[index].defaultImage?.fullImage ??
                                    "",
                                mrp: formatPrice(state.posts[index].listingNumPrice
                                    .toString()),
                                name: state.posts[index].model!,
                                storage: state.posts[index].deviceStorage!,
                                condition: state.posts[index].deviceCondition!,
                                location: state.posts[index].listingState!,
                                date: state.posts[index].listingDate!,
                                islike: false);
                          }),
                    );
                  }
                  return const Center(
                    child: Text("Error!"),
                  );
                },
              ),
            ],
          ),
        )
      ],
    ));
  }
}

// Deal_Card(
// imagerurl:
// "https://buyapple.co.za/wp-content/uploads/2021/08/iphone-6s-plus-rose-gold-1.jpg",
// mrp: "5,500",
// name: "iphone 6s Plus",
// storage: "128 GB",
// condition: "Good",
// location: "Bhubaneshwar",
// date: "Jul 12th",
// islike: false),
