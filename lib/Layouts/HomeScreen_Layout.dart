import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobilicis/Components/Headings.dart';
import 'package:mobilicis/Logic/Cubits/Post_Cubit/post_cubit.dart';
import 'package:mobilicis/Logic/Cubits/Post_Cubit/post_state.dart';
import 'package:mobilicis/Logic/Cubits/Search_cubit/search_cubit.dart';
import 'package:mobilicis/Screens/Home_Screen.dart';
import 'package:mobilicis/Screens/Search_Screen.dart';

class HomeScreen_Layout extends StatefulWidget {
  HomeScreen_Layout({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<HomeScreen_Layout> createState() => _HomeScreen_LayoutState();
}

class _HomeScreen_LayoutState extends State<HomeScreen_Layout> {
  // bool isFieldtapped = false;
  // TextEditingController _searchController = TextEditingController();
  // PostCubit postCubit = PostCubit();

  // @override
  // void initState() {
  //   super.initState();
  //   print("HomeLayout init called !!!!!!!!!!!!");
  //   _searchController.addListener(_onSearchTextChanged);
  // }

  // @override
  // void dispose() {
  //   _searchController.dispose();
  //   super.dispose();
  // }

  // void _onSearchTextChanged() {
  //   final enteredSearch = _searchController.text;
  //   context.read<PostCubit>().fetchSearches(enteredSearch);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Color(0XFF2C2F45),
        leading: Icon(
          Icons.menu,
          size: 40.sp,
        ),
        title: SvgPicture.asset(
          "assets/icons/logo.svg",
          color: Colors.white,
        ),
        elevation: 0,
        actions: [
          Row(
            children: [
              Text(
                "India",
                style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.location_pin,
                color: Colors.white,
                size: 35.sp,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h, right: 10.w),
            child: Stack(
              children: [
                Icon(
                  Icons.notifications_none_sharp,
                  weight: 20,
                  size: 40.sp,
                ),
                Positioned(
                  right: 0,
                  top: 3,
                  child: CircleAvatar(
                    child: Text(
                      "3",
                      style: TextStyle(fontSize: 10),
                    ),
                    backgroundColor: Colors.white,
                    minRadius: 8,
                    maxRadius: 8,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              color: Color(0XFF2C2F45),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                        value: SearchCubit(),
                        child: SearchScreen(),
                      ),
                    ),
                  );
                },
                child:  Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10.w,),
                  Icon(
                        Icons.search,
                        color: Colors.grey.shade700,
                        size: 25.sp,
                      ),
                      SizedBox(width: 10.w,),
                      Text("Search with make and model..", style: TextStyle(
                              color: Colors.grey.shade800,
                        fontSize: 14
                            ),),
                    ],
                  ),

                    // onFocusChange: (hasFocus) {
                    //   setState(() {
                    //     isFieldtapped = true;
                    //   });
                    // },
                    // child: TextFormField(
                    //   // controller: _searchController,
                    //   decoration: InputDecoration(
                    //     // suffixIcon: isFieldtapped
                    //     //     ? GestureDetector(
                    //     //         onTap: () {
                    //     //           setState(() {
                    //     //             isFieldtapped = false;
                    //     //
                    //     //           });
                    //     //         },
                    //     //         child: Icon(
                    //     //           Icons.clear_rounded,
                    //     //           color: Colors.grey,
                    //     //         ),)
                    //     //     : null,
                    //     prefixIcon: Icon(
                    //       Icons.search,
                    //       color: Colors.grey.shade700,
                    //       size: 25.sp,
                    //     ),
                    //     contentPadding:
                    //         EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                    //     enabledBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     hintText: "Search with make and model..",
                    //     hintStyle: TextStyle(
                    //       color: Colors.grey.shade700,
                    //     ),
                    //   ),
                    //   // onChanged: (value) {
                    //   //   postCubit.fetchSearches(value);
                    //   // },
                    //
                    //
                    // ),

                ),
              ),
            ),
            // isFieldtapped
            //     ? BlocBuilder<PostCubit, PostState>(
            //         builder: (context, state) {
            //           if (state is SearchLoadingState) {
            //             return Center(
            //               child: CircularProgressIndicator(),
            //             );
            //           }
            //           if (state is SearchLoadedState) {
            //             List<dynamic>? makesList = state.searches['makes'];
            //             List<dynamic>? modelsList = state.searches['models'];
            //             return Expanded(
            //               child: Container(
            //                 width: MediaQuery.of(context).size.width,
            //                 color: Colors.white,
            //                 child: Padding(
            //                   padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
            //                   child: SingleChildScrollView(
            //                     physics: BouncingScrollPhysics(),
            //                     child: Column(
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       children: [
            //                         Heading(text: "Brand"),
            //                         SizedBox(
            //                           height: 15.h,
            //                         ),
            //                         ListView.builder(
            //                           shrinkWrap: true,
            //                           physics: NeverScrollableScrollPhysics(),
            //                           itemCount: makesList?.length ?? 0,
            //                           itemBuilder: (context, index) {
            //                             return Text(makesList?[index] ?? "");
            //                           },
            //                         ),
            //                         SizedBox(
            //                           height: 25.h,
            //                         ),
            //                         Heading(text: "Models"),
            //                         SizedBox(
            //                           height: 15.h,
            //                         ),
            //                         ListView.builder(
            //                           shrinkWrap: true,
            //                           physics: NeverScrollableScrollPhysics(),
            //                           itemCount: modelsList?.length ?? 0,
            //                           itemBuilder: (context, index) {
            //                             return Padding(
            //                               padding: EdgeInsets.symmetric(vertical: 10.h),
            //                               child: Text(modelsList?[index] ?? ""),
            //                             );
            //                           },
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             );
            //           }
            //           if (state is SearchErrorState) {
            //             return Center(
            //               child: Text(state.error),
            //             );
            //           }
            //           if (state is SearchInitialState) {
            //             return Text("It is on initial!");
            //           }
            //           if (state is PostLoadedState) {
            //             return Text("It is on Post Loaded!");
            //           }
            //           return Text("Here is an Error!");
            //         },
            //       )
            //     :
            Expanded(child: SingleChildScrollView(child: widget.child)),
          ],
        ),
      ),
    );
  }
}
