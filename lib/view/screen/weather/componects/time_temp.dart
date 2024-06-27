import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/view/controller/weather_provider.dart';
Column todayTimeTemp(double height,WeatherProvider weatherProvider) {
  return Column(
    children: [
      SizedBox(
        height: height * 0.033,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Today',
            style: GoogleFonts.overpass(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w800),
          ),
          Text(
            'Jun,${weatherProvider.dateTime.day}',
            style: GoogleFonts.overpass(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
      SizedBox(
        height: height * 0.02,
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            weatherProvider
                .weather!.weatherForecast.forecastday[0].hour.length,
                (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
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
    ],
  );
}

Column timeAndTemp(double height, String temp, Image image, String name) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        temp,
        style: GoogleFonts.overpass(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
      SizedBox(
        height: height * 0.01,
      ),
      SizedBox(width: 40, child: image),
      SizedBox(
        height: height * 0.02,
      ),
      Text(
        "$name:00",
        style: GoogleFonts.overpass(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}
