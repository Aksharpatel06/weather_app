import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/view/controller/helper/api_sarvice.dart';
import 'package:weather_app/view/modal/weather_modal.dart';

import '../modal/sreach_modal.dart';

class WeatherProvider extends ChangeNotifier {
  Weather? weather;
  DateTime dateTime = DateTime.now();

  WeatherProvider() {
    fetchData();
  }

  Future<void> fetchData() async {
    ApiSarvice apiSarvice = ApiSarvice();
    String? jsonData = await apiSarvice.getData(name);
    if (jsonData != null) {
      Map dataList = jsonDecode(jsonData);
      weather = Weather.getData(dataList);
      print(jsonData);
      notifyListeners();
      sreachApi('surat');
    }
  }

  String name = 'surat';
  TextEditingController textEditingController =
      TextEditingController(text: 'surat');
  List<Location> list = [];

  Future<void> sreachApi(String name) async {
    ApiSarvice apiSarvice = ApiSarvice();
    String? jsonData = await apiSarvice.getSreachData(name);
    if (jsonData != null) {
      List dataList = jsonDecode(jsonData);
      list = dataList
          .map(
            (e) => Location.fromJson(e),
          )
          .toList();
      this.name = name;
      notifyListeners();
      print(list);
      notifyListeners();
    }
  }

  void changeToController(String value) {
    String name = value;
    textEditingController = TextEditingController(text: name);
    notifyListeners();
  }
}
