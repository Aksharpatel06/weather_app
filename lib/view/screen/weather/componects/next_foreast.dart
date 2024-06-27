import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/weather_provider.dart';
Column nextForecasts(double height,WeatherProvider weatherProvider) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Next Forecast',
            style: GoogleFonts.overpass(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w800),
          ),
          const Icon(
            Icons.calendar_month_rounded,
            size: 22,
            color: Colors.white,
          )
        ],
      ),
      SizedBox(
        height: height * 0.02,
      ),
      SizedBox(
        height: height*0.45,
        child: Scrollbar(
          thickness: 8,
          trackVisibility: true,
          radius: const Radius.circular(5),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: List.generate(
                15,
                    (index) {
                  var random = Random();
                  int min = 27;
                  int max = 30;
                  int randomNumberInRange = min + random.nextInt(max - min + 1);
                  int minImg = 4;
                  int maxImg = 6;
                  int randomNumberImageInRange = minImg + random.nextInt(maxImg - minImg + 1);
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0,bottom: 8,left: 8,right: 24),
                    child: nextForecast(index,weatherProvider,randomNumberInRange,randomNumberImageInRange),
                  );
                },
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: height * 0.02,
      ),
    ],
  );
}

Row nextForecast(int index,WeatherProvider weatherProvider,int temp,int imageIndex) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        width: 70,
        child: Text(
          weatherProvider.dateTime.day+index+1<=30?'Jun,${weatherProvider.dateTime.day+index+1}':'Jul,0${(weatherProvider.dateTime.day+index+1)%30}',
          style: GoogleFonts.overpass(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w500),
        ),
      ),
      SizedBox(width: 50,child: Image.asset('asset/weather image/img$imageIndex.png')) ,
      Text(
        '$temp°',
        style: GoogleFonts.overpass(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w500),
      ),
    ],
  );
}
