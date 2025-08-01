import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getxmvvm/resources/getx_localization/language.dart';
import 'package:getxmvvm/view/splash_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:
          (context, child) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            translations: Language(),

            ///urdu language
            // locale: Locale('ur','PK'),
            locale: Locale('en', 'US'),
            fallbackLocale: Locale('en', 'US'),
            home: SplashView(),
            // getPages:
            // AppRoutes.appRoutes()
          ),
    );
  }
}
