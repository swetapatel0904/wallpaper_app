import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:wallpaper_app/utils/api_helper.dart';

import '../model/home_model.dart';

class HomeProvider with ChangeNotifier {
  int index = 0;
  HomeModel? homeModel;

  Future<void> flowerGetData(String wallpaper) async {
    HomeModel? l4 = await APIHelper.helper.getData(wallpaper);
    if (l4 != null) {
      homeModel = l4;
      notifyListeners();
    }
  }

  Future<void> setWallPaper(wallpaper) async {
    try {
      var result = await AsyncWallpaper.setWallpaper(
        url: wallpaper,
        wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
        goToHome: true,
        toastDetails: ToastDetails.success(),
        errorToastDetails: ToastDetails.error(),
      );
    } on PlatformException {
      var result = 'Failed to get wallpaper.';
    }
  }

  Future<void> setWallPaper1(wallpaper1) async {
    try {
      var result = await AsyncWallpaper.setWallpaper(
        url: wallpaper1,
        wallpaperLocation: AsyncWallpaper.LOCK_SCREEN,
        goToHome: true,
        toastDetails: ToastDetails.success(),
        errorToastDetails: ToastDetails.error(),
      );
    } on PlatformException {
      var result = 'Failed to get wallpaper.';
    }
  }
}
