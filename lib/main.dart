import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getxmvvm/resources/getx_localization/language.dart';
import 'package:getxmvvm/resources/routes/routes.dart';
import 'package:getxmvvm/view/home_view.dart';
import 'package:getxmvvm/view/splash_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // iPhone X design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          translations: Language(),

          ///urdu language
          // locale: Locale('ur','PK'),
          locale: Locale('en', 'US'),
          fallbackLocale: Locale('en', 'US'),
          home: HomeView(),

          //getPages:
          // AppRoutes.appRoutes()
        );
      },
    );
  }
}
