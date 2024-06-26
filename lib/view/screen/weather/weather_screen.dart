import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../controller/weather_provider.dart';

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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 25,
                      ),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      Text(
                        'Back',
                        style: GoogleFonts.overpass(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: width * 0.63,
                      ),
                      const Icon(
                        Icons.settings,
                        size: 25,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Today',
                      style: GoogleFonts.overpass(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      'Jun,${weatherProvider.dateTime.day}',
                      style: GoogleFonts.overpass(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      weatherProvider
                          .weather!.weatherForecast.forecastday[0].hour.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: (weatherProvider.dateTime.hour == index + 1)
                              ? GlassmorphicContainer(
                                  width: 70,
                                  height: 150,
                                  borderRadius: 20,
                                  blur: 20,
                                  padding: const EdgeInsets.all(40),
                                  alignment: Alignment.bottomCenter,
                                  border: 2,
                                  linearGradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        const Color(0xFFffffff)
                                            .withOpacity(0.30000001192092896),
                                        const Color(0xFFFFFFFF)
                                            .withOpacity(0.30000001192092896),
                                      ],
                                      stops: const [
                                        0.1,
                                        1,
                                      ]),
                                  borderGradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      const Color(0xFFffffff).withOpacity(0.5),
                                      const Color((0xFFFFFFFF))
                                          .withOpacity(0.5),
                                    ],
                                  ),
                                  child: timeAndTemp(
                                      height,
                                      '${weatherProvider.weather!.weatherForecast.forecastday[0].hour[index].tempC}°C',
                                      Image.network(
                                        'https:${weatherProvider.weather!.weatherForecast.forecastday[0].hour[index].condition.icon}',
                                        fit: BoxFit.cover,
                                      ),
                                      '${weatherProvider.dateTime.hour}'),
                                )
                              : timeAndTemp(
                                  height,
                                  '${weatherProvider.weather!.weatherForecast.forecastday[0].hour[index].tempC}°C',
                                  Image.network(
                                    'https:${weatherProvider.weather!.weatherForecast.forecastday[0].hour[index].condition.icon}',
                                    fit: BoxFit.cover,
                                  ),
                                  '${index + 1}'),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Next Forecast',
                      style: GoogleFonts.overpass(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w800),
                    ),
                    Icon(
                      Icons.calendar_month_rounded,
                      size: 25,
                      color: Colors.white,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column timeAndTemp(double height, String temp, Image image, String name) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          temp,
          style: GoogleFonts.overpass(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: 40, child: image),
        SizedBox(
          height: height * 0.02,
        ),
        Text(
          "$name:00",
          style: GoogleFonts.overpass(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
