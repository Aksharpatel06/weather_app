import 'package:flutter/material.dart';
import 'package:weather_app/view/screen/search/search_screen.dart';

Widget wetherAppBar(double width, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        const Icon(
          Icons.location_on_outlined,
          color: Colors.white,
          size: 25,
        ),
        SizedBox(
          width: width * 0.04,
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const SearchScreen(),
            ));
          },
          child: const Text(
            'Suart',
            style: TextStyle(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          width: width * 0.03,
        ),
        const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.white,
        ),
        SizedBox(
          width: width * 0.45,
        ),
        Stack(
          children: [
            const Icon(
              Icons.notifications_none,
              size: 28,
              color: Colors.white,
            ),
            Positioned(
              left: 13,
              top: 5,
              child: Container(
                height: 7,
                width: 7,
                decoration: const BoxDecoration(
                    color: Colors.redAccent, shape: BoxShape.circle),
              ),
            )
          ],
        )
      ],
    ),
  );
}
