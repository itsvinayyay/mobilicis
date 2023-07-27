import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobilicis/Components/headings_component.dart';
import 'package:mobilicis/Logic/Cubits/Search_cubit/search_cubit.dart';
import 'package:mobilicis/Logic/Cubits/Search_cubit/search_state.dart';


class SearchScreen extends StatefulWidget {
   const SearchScreen({Key? key}) : super(key: key);
  static const String routeName = "./Search";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  SearchCubit searchCubit = SearchCubit();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchTextChanged);
  }
  void _onSearchTextChanged() {
    final enteredSearch = _searchController.text;
    context.read<SearchCubit>().fetchSearches(enteredSearch);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF2C2F45),
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
                const Positioned(
                  right: 0,
                  top: 3,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    minRadius: 8,
                    maxRadius: 8,
                    child: Text(
                      "3",
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              color: const Color(0XFF2C2F45),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  autofocus: true,
                  controller: _searchController,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        FocusScope.of(context).unfocus();

                      },
                      child: const Icon(
                        Icons.clear_rounded,
                        color: Colors.grey,
                      ),),

                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Search with make and model..",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ),


                ),
              ),
            ),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is SearchLoadedState) {
                  List<dynamic>? makesList = state.searches['makes'];
                  List<dynamic>? modelsList = state.searches['models'];
                  return Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              heading(text: "Brand"),
                              SizedBox(
                                height: 15.h,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: makesList?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10.h),
                                    child: Text(makesList?[index] ?? ""),
                                  );
                                },
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              heading(text: "Models"),
                              SizedBox(
                                height: 15.h,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: modelsList?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10.h),
                                    child: Text(modelsList?[index] ?? ""),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
                if (state is SearchErrorState) {
                  return Center(
                    child: Text(state.error),
                  );
                }
                if (state is SearchInitialState) {
                  return Expanded(child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          heading(text: "Brand"),
                          SizedBox(
                            height: 15.h,
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          heading(text: "Models"),
                        ],
                      ),
                    ),
                  ));
                }
                return const Text("Here is an Error!");
              },
            )

          ],
        ),
      ),
    );
  }
}
