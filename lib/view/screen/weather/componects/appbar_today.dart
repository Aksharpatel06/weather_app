import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Padding appBarToday(double width,BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Row(
      children: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 25,
          ),
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
          width: width * 0.58,
        ),
        const Icon(
          Icons.settings,
          size: 25,
          color: Colors.white,
        )
      ],
    ),
  );
}