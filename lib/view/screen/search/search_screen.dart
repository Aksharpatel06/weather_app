import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/view/screen/home/home_screen.dart';

import '../../controller/weather_provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherProvider weatherProvider = Provider.of<WeatherProvider>(context);
    WeatherProvider weatherProviderFalse =
        Provider.of<WeatherProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: (weatherProvider.weather!.currentModal.isDay == 1)
              ? const LinearGradient(
                  begin: Alignment(-0.21, -0.98),
                  end: Alignment(0.21, 0.98),
                  colors: [Color(0xFF47BFDF), Color(0xFF4A91FF)],
                )
              : const LinearGradient(
                  begin: Alignment(-0.21, -0.98),
                  end: Alignment(0.21, 0.98),
                  colors: [
                    Color(0xff142058),
                    Color(0xff454DB7),
                  ],
                ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(color: Color(0xffFCFCFC)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shadows: const [
                              BoxShadow(
                                color: Color(0x19000000),
                                blurRadius: 50,
                                offset: Offset(-4, 8),
                                spreadRadius: 4,
                              )
                            ],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: TextField(
                            controller: weatherProvider.textEditingController,
                            onChanged: (value) {
                              weatherProviderFalse.searchApi(value);
                            },
                            decoration: InputDecoration(
                              hintText: 'city name',
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    weatherProvider.fetchData();
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => HomeScreen(
                                          weatherProvider: weatherProvider),
                                    ));
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward,
                                    color: Color(0xff444E72),
                                  )),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Color(0xff444E72),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Recent Sreach',
                        style: GoogleFonts.overpass(
                          fontSize: 18,
                          color: const Color(0xff444E72),
                        ),
                      ),
                      Consumer<WeatherProvider>(
                          builder: (context, provider, child) {
                        if (provider.list.isEmpty) {
                          return const Center(
                            child: Text('No songs found'),
                          );
                        }

                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: weatherProvider.list.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  provider.list[index].name,
                                  style: GoogleFonts.overpass(
                                    fontSize: 20,
                                    color: const Color(0xff444E72),
                                  ),
                                ),
                                onTap: () {
                                  provider.changeToController(
                                      provider.list[index].name);
                                },
                              );
                            });
                      }),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    'asset/weather image/Mapsicle Map.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
