import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.21, -0.98),
            end: Alignment(0.21, 0.98),
            colors: [Color(0xFF47BFDF), Color(0xFF4A91FF)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                wetherAppBar(width),
                weatherImage(height,weatherProvider),
                glassmorphicContainerTemp(height, width,weatherProvider),
                reportButton(height, width),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
