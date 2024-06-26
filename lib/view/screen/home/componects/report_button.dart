import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/view/controller/weather_provider.dart';
import 'package:weather_app/view/screen/weather/weather_screen.dart';

Widget reportButton(double height, double width,WeatherProvider weatherProvider,BuildContext context) {
  return CupertinoButton(
    onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => WeatherScreen(weatherProvider: weatherProvider),));
    },
    child: Column(
      children: [
        Container(
          width: width * 0.5,
          height: height * 0.08,
          alignment: Alignment.center,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 50,
                offset: Offset(-4, 8),
                spreadRadius: 4,
              )
            ],
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Forecast report',
                style: TextStyle(
                  color: Color(0xFF444D71),
                  fontSize: 18,
                  fontFamily: 'Overpass',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_up,
                color: Color(0xFF444D71),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
