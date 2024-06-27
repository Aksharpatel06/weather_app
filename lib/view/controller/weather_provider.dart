import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/view/controller/helper/api_sarvice.dart';
import 'package:weather_app/view/modal/weather_modal.dart';
import '../modal/sreach_modal.dart';

class WeatherProvider extends ChangeNotifier {
  Weather? weather;
  DateTime dateTime = DateTime.now();
  String name = 'surat';
  String? isClicked;
  TextEditingController textEditingController = TextEditingController(text: 'surat');
  List<Location> list = [];

  WeatherProvider() {
    fetchData();
    getData();
  }

  Future<void> fetchData() async {
    ApiSarvice apiService = ApiSarvice();
    String? jsonData = await apiService.getData(isClicked ?? name);
    if (jsonData != null) {
      Map dataList = jsonDecode(jsonData);
      weather = Weather.getData(dataList);
      print(jsonData);
      notifyListeners();
      searchApi('surat');
    }
  }

  Future<void> searchApi(String name) async {
    ApiSarvice apiService = ApiSarvice();
    String? jsonData = await apiService.getSreachData(name);
    if (jsonData != null) {
      List dataList = jsonDecode(jsonData);
      list = dataList.map((e) => Location.fromJson(e)).toList();
      this.name = name;
      notifyListeners();
      print(list);
    }
  }

  void changeToController(String value) {
    textEditingController.text = value;
    notifyListeners();
  }

  Future<void> setData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('isClicked', name);
    notifyListeners();
  }

  Future<void> getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    isClicked = preferences.getString('isClicked');
    notifyListeners();
  }
}
