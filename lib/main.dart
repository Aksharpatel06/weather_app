import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/view/controller/weather_provider.dart';
import 'package:weather_app/view/screen/home/home_screen.dart';
import 'package:weather_app/view/screen/weather/weather_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherProvider weatherProviderTrue = Provider.of<WeatherProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:WeatherScreen(weatherProvider: weatherProviderTrue,),
    );
  }
}
