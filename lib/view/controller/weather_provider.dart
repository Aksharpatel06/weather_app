import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/view/controller/helper/api_sarvice.dart';
import 'package:weather_app/view/modal/weather_modal.dart';

class WeatherProvider extends ChangeNotifier{
  Weather? weather;
  DateTime dateTime =DateTime.now();


  WeatherProvider()
  {
    fetchData();
  }

  Future<void> fetchData()
  async {
    ApiSarvice apiSarvice = ApiSarvice();
    String? jsonData = await apiSarvice.getData();
    if (jsonData != null) {
      Map dataList = jsonDecode(jsonData);
      weather = Weather.getData(dataList);
      print(jsonData);
      notifyListeners();
    }
  }
}