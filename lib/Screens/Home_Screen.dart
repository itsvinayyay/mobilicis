import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobilicis/Components/Custom_Button.dart';
import 'package:mobilicis/Components/Headings.dart';
import 'package:mobilicis/Components/HomeScreen_Banner.dart';
import 'package:mobilicis/Components/HomeScreen_BottomSheet.dart';
import 'package:mobilicis/Layouts/HomeScreen_Layout.dart';
import 'package:mobilicis/Components/HomeScreen_DealCard.dart';
import 'package:mobilicis/Logic/Cubits/Filter_Cubit/filter_cubit.dart';
import 'package:mobilicis/Logic/Cubits/Filter_Cubit/filter_state.dart';
import 'package:mobilicis/Logic/Cubits/Post_Cubit/post_cubit.dart';
import 'package:mobilicis/Logic/Cubits/Post_Cubit/post_state.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const String routeName = "./Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PostCubit postCubit = PostCubit();
  bool _isModalVisible = false;

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   print("InitState Called !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
  //   postCubit.refreshposts();
  // }
  //
  // @override
  // void didUpdateWidget(covariant HomeScreen oldWidget) {
  //   // TODO: implement didUpdateWidget
  //   super.didUpdateWidget(oldWidget);
  //   postCubit.refreshposts();
  // }

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
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;
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
                      decoration: BoxDecoration(
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
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (state is FilterLoadedState) {
                                return Expanded(
                                  child: SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Sheet_Heading(text: "Brand"),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        Filter_Scroll(state.filters["make"]),
                                        SizedBox(
                                          height: 25.h,
                                        ),
                                        Sheet_Heading(text: "Ram"),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        Filter_Scroll(state.filters["ram"]),
                                        SizedBox(
                                          height: 25.h,
                                        ),
                                        Sheet_Heading(text: "Storage"),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        Filter_Scroll(state.filters["storage"]),
                                        SizedBox(
                                          height: 25.h,
                                        ),
                                        Row(
                                          children: [
                                            Sheet_Heading(text: "Conditions"),
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
                                        Filter_Scroll(
                                            state.filters["condition"]),
                                        SizedBox(
                                          height: 25.h,
                                        ),
                                        Row(
                                          children: [
                                            Sheet_Heading(text: "Warranty"),
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
                                        Filter_Scroll(demoMaps["warranty"]),
                                        SizedBox(
                                          height: 25.h,
                                        ),
                                        Row(
                                          children: [
                                            Sheet_Heading(text: "Verification"),
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
                                        Filter_Scroll(demoMaps["verification"]),
                                        SizedBox(
                                          height: 25.h,
                                        ),
                                        Sheet_Heading(text: "Price"),
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
                                                  child: Text(
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
                                                  child: Text(
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
                                                  color: Color(0XFF2C2F45),
                                                ),
                                              ),
                                              Positioned(
                                                left: 10,
                                                bottom: 0,
                                                  child: CircleAvatar(
                                                backgroundColor:
                                                    Color(0XFF2C2F45),
                                                minRadius: 10.sp,
                                                maxRadius: 10.sp,
                                              )),
                                              Positioned(
                                                  right: 10,
                                                  bottom: 0,
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                    Color(0XFF2C2F45),
                                                    minRadius: 10.sp,
                                                    maxRadius: 10.sp,
                                                  ))
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 2.h,),
                                        CustomButton("Accept", MediaQuery.sizeOf(context).width, () { }),
                                      ],
                                    ),
                                  ),
                                );
                              }
                              return Text("An Error is there!");
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

  SizedBox Filter_Scroll(List<dynamic>? received_list) {
    return SizedBox(
      height: 40.h,
      width: MediaQuery.sizeOf(context).width,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...List.generate(
              received_list?.length ?? 0,
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
                    received_list?[index] ?? "",
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

  @override
  Widget build(BuildContext context) {
    return HomeScreen_Layout(
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
              Heading(text: "Buy Top Brands"),
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
                    child: Image.network(
                        "https://cdn.freebiesupply.com/images/thumbs/2x/apple-logo.png"),
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
                    child: Image.network(
                        "https://image-us.samsung.com/SamsungUS/home/samsung-logo-191-1.jpg"),
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
                    child: Image.network(
                        "https://www.freepnglogos.com/uploads/xiaomi-png/xiaomi-logo-logos-marcas-8.png"),
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
                    child: Image.network(
                        "https://cdn.iconscout.com/icon/free/png-256/free-vivo-1-285323.png"),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        HomeScreenBanner(),
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
              Heading(text: "Shop By"),
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
                      Heading(text: "Best Deals Near You"),
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
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is PostLoadedState) {
                    return SizedBox(
                      height: 580.h,
                      child: GridView.builder(
                          shrinkWrap: false,
                          physics: BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 20.0,
                            childAspectRatio: (220.h / 2) / (150.w),
                          ),
                          itemCount: state.posts.length,
                          itemBuilder: (context, index) {
                            return Deal_Card(
                                imagerurl: state
                                        .posts[index].defaultImage?.fullImage ??
                                    "",
                                mrp: state.posts[index].listingNumPrice
                                    .toString(),
                                name: state.posts[index].model!,
                                storage: state.posts[index].deviceStorage!,
                                condition: state.posts[index].deviceCondition!,
                                location: state.posts[index].listingState!,
                                date: state.posts[index].listingDate!,
                                islike: false);
                          }),
                    );
                  }
                  return Center(
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
