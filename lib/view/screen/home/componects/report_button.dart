import 'package:flutter/material.dart';

Column reportButton(double height, double width) {
  return Column(
    children: [
      SizedBox(
        height: height * 0.1,
      ),
      Container(
        width: width * 0.5,
        height: height * 0.08,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: [
            const BoxShadow(
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
  );
}
