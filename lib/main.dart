import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/utils/app_routes.dart';

import 'screen/home/provider/home_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: HomeProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        routes: app_routs,
      ),
    ),
  );
}
