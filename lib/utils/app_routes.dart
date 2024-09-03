import 'package:flutter/material.dart';
import 'package:wallpaper_app/screen/details/view/detail_screen.dart';
import 'package:wallpaper_app/screen/home/view/home_screen.dart';

Map<String,WidgetBuilder>app_routs= {

  "/":(context) => const HomeScreen(),
  "detail":(context) => const DetailScreen(),

};