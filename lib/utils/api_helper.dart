import 'dart:convert';

import 'package:http/http.dart' as http;

import '../screen/home/model/home_model.dart';

class APIHelper {
  static APIHelper helper = APIHelper._();

  APIHelper._();

  Future<HomeModel?> getData(String wallpaper) async {
    String link =
        "https://pixabay.com/api/?key=45766724-f4e523c1afc00c9568f301182=$wallpaper";
    var response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      HomeModel model = HomeModel.mapToModel(json);
      return model;
    }
    return null;
  }
}
