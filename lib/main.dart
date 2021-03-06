import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/LocalDatabase/hive_database.dart';
import 'package:news_app/Pages/home.dart';
import 'package:news_app/Pages/login.dart';
import 'package:news_app/Pages/search_page.dart';
import 'package:news_app/Pages/splash.dart';
import 'package:news_app/configs/instance_binding.dart';
import 'package:news_app/configs/routes.dart';
import 'package:news_app/configs/size_config.dart';
import 'package:news_app/configs/theme_data.dart';
import 'package:news_app/customWidgets/article_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    ///initialize firebase and hive for local database
    await Firebase.initializeApp();
    await HiveDatabase.initialize();

  } catch (e) {
    log('error in firebase initializeApp ' + e.toString());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'NewsApp',
      initialRoute: Routes.initialRoutes,
      initialBinding: InstanceBinding(),
      routes: {
        Routes.initialRoutes: (context) => const Splash(),
        Routes.login: (context) => LoginPage(),
        Routes.homePage: (context) =>  MyHomePage(),
        Routes.newsDetailPage: (context) => ArticleDetails(),
        Routes.searchPage: (context) => SearchPage(),

      },
      theme: ThemeClass.themeData,
    );
  }
}


