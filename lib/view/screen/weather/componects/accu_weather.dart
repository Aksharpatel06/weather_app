import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Row accuWeather(double width) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Icon(
        Icons.sunny,
        size: 25,
        color: Colors.white,
      ),
      SizedBox(
        width: width * 0.03,
      ),
      Text(
        'AccuWeather',
        style: GoogleFonts.overpass(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w400),
      ),
    ],
  );
}
