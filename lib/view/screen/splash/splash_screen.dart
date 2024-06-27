import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/view/controller/weather_provider.dart';
import 'package:weather_app/view/screen/home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key, required this.weatherProvider});

  WeatherProvider weatherProvider;

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 5),
      () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomeScreen(weatherProvider: weatherProvider),
        ));
      },
    );
    return Scaffold(
      body: (weatherProvider.weather == null && weatherProvider.list.isEmpty)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                        begin: Alignment(-0.21, -0.98),
                        end: Alignment(0.21, 0.98),
                        colors: [
                          Color(0xff142058),
                          Color(0xff454DB7),
                          Color(0xFF4A91FF),
                          Color(0xFF47BFDF),
                        ],
                      ),
              ),
              child: Center(
                child: Image.asset(
                  'asset/weather image/app logo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
    );
  }
}
