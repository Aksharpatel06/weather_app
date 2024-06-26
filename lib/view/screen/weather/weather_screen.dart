import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/weather_provider.dart';
import 'componects/accu_weather.dart';
import 'componects/appbar_today.dart';
import 'componects/next_foreast.dart';
import 'componects/time_temp.dart';

class WeatherScreen extends StatelessWidget {
  WeatherScreen({super.key, required this.weatherProvider});

  WeatherProvider weatherProvider;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    WeatherProvider weatherProviderFalse =
        Provider.of<WeatherProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: (weatherProvider.weather!.currentModal.isDay==1)
              ? const LinearGradient(
                  begin: Alignment(-0.21, -0.98),
                  end: Alignment(0.21, 0.98),
                  colors: [Color(0xFF47BFDF), Color(0xFF4A91FF)],
                )
              : const LinearGradient(
                  begin: Alignment(-0.21, -0.98),
                  end: Alignment(0.21, 0.98),
                  colors: [
                    Color(0xff142058),
                    Color(0xff454DB7),
                  ],
                ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                appBarToday(width, context),
                todayTimeTemp(height, weatherProvider),
                nextForecasts(height, weatherProvider),
                accuWeather(width),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
