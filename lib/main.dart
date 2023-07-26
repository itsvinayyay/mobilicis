import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilicis/Data/Models/Post_Model.dart';
import 'package:mobilicis/Data/Models/Search_Model.dart';
import 'package:mobilicis/Data/Repositories/Post_repository.dart';
import 'package:mobilicis/Logic/Cubits/Filter_Cubit/filter_cubit.dart';
import 'package:mobilicis/Logic/Cubits/Post_Cubit/post_cubit.dart';
import 'package:mobilicis/Screens/Home_Screen.dart';
import 'package:mobilicis/Screens/Search_Screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  PostRepository postRepository = PostRepository();
  // List<PostModel> postModels = await postRepository.fetchPosts();
  Map<String, List<dynamic>> getFilters = await postRepository.getFilters();

  // log(postModels.toString());
  log("Here goes Search!!!!!!!!!!");
  log(getFilters.toString());
  runApp(ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MyApp();
      }),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostCubit>(create: (context) => PostCubit(),),
        BlocProvider<FilterCubit>(create: (context) => FilterCubit(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: HomeScreen(),
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName :(context) => HomeScreen(),
          SearchScreen.routeName: (context) => SearchScreen(),
        },
      ),
    );
  }
}
