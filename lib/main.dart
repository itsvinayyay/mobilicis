import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilicis/Logic/Cubits/Filter_Cubit/filter_cubit.dart';
import 'package:mobilicis/Logic/Cubits/Post_Cubit/post_cubit.dart';
import 'package:mobilicis/Screens/Home_Screen.dart';
import 'package:mobilicis/Screens/Notification_Screen.dart';
import 'package:mobilicis/Screens/Search_Screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // PostRepository postRepository = PostRepository();
  // // List<PostModel> postModels = await postRepository.fetchPosts();
  // Map<String, List<dynamic>> getFilters = await postRepository.getFilters();

  // log(postModels.toString());
  // log("Here goes Search!!!!!!!!!!");
  // log(getFilters.toString());
  HttpOverrides.global = MyHttpOverrides();
  runApp(ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const MyApp();
      }),);
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async{
  await Firebase.initializeApp();
  //Can print Message's title and body here!
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
          HomeScreen.routeName :(context) => const HomeScreen(),
          SearchScreen.routeName: (context) => const SearchScreen(),
          NotificationScreen.routeName: (context) => const NotificationScreen(),
        },
      ),
    );
  }
}
