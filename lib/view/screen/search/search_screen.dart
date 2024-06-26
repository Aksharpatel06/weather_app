import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/weather_provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherProvider weatherProvider =
    Provider.of<WeatherProvider>(context);
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: weatherProvider.textEditingController,
                  onChanged: (value) {
                    weatherProviderFalse.sreachApi(value);
                  },
                  decoration:  InputDecoration(
                    hintText: 'city name',
                    suffixIcon: IconButton(onPressed: () {
                      weatherProvider.fetchData();
                      Navigator.of(context).pop();
                    }, icon: Icon(Icons.arrow_forward)),
                    prefixIcon: Icon(Icons.search), // Add search icon here
                    border: OutlineInputBorder(), // Add outline border here
                  ),
                ),
              ),
              Consumer<WeatherProvider>(
                  builder: (context, provider, child) {
                    // if (provider.isLoading) {
                    //   return Center(
                    //     child: CircularProgressIndicator(
                    //       color: Colors.white,
                    //     ),
                    //   );
                    // }

                    // Check if songs are empty
                    if (provider.list.isEmpty) {
                      return Center(
                        child: Text('No songs found'),
                      );
                    }

                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                       weatherProvider.list
                            .length,
                        itemBuilder: (context, index) {
                          // Song song = Provider.of<MusicProvider>(context,
                          //     listen: true)
                          //     .songs[index];
                          return ListTile(

                            title: Text(provider.list[index].name, style: TextStyle(fontSize: 20)),
                            onTap: () {
                              provider.changeToController(provider.list[index].name);

                            },
                          );
                        });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
