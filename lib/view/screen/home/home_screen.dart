import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/view/controller/weather_provider.dart';

import 'componects/glassmorphic_container_temp.dart';
import 'componects/report_button.dart';
import 'componects/weather_appbar.dart';
import 'componects/weather_image.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.weatherProvider});

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
          gradient: (weatherProvider.weather!.currentModal.isDay == 1)
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
          child: (weatherProvider.weather == null || weatherProvider.list.isEmpty)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      wetherAppBar(width,context),
                      weatherImage(height, weatherProvider),
                      glassmorphicContainerTemp(height, width, weatherProvider),
                      reportButton(height, width, weatherProvider, context),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
