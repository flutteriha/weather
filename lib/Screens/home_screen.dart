import 'package:flutter/material.dart';
import 'package:flutteriha_weather/Services/get_location.dart';
import 'package:flutteriha_weather/Services/weather_data.dart';

class HomeScreen extends StatelessWidget {
  var weatherData = WeatherData();
  var data;

  info() async {
    var position = await GetPosition();
    data = await weatherData.getData(position.latitude, position.longitude);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0XFF232A7A),
            Color(0XFF699FF3),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder(
          future: info(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          Text(
                            '${data.cityName}',
                            style: const TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.menu_open_rounded,
                            size: 50.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 96.0,
                          child: Image.network(
                            'https:${data.icon}',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          '${data.condition}',
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${data.temp.toInt()}° C',
                      style: const TextStyle(
                        fontSize: 150.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Divider(
                            color: Colors.grey,
                            indent: 190.0,
                            endIndent: 190.0,
                            height: 30.0,
                            thickness: 3.0,
                          ),
                          const SizedBox(height: 5.0),
                          const Text(
                            'Weather Today',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('images/wind.png'),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    '${data.wind} km/h',
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  const Text(
                                    'Wind',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('images/humidity.png',
                                      width: 64.0),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    '${data.humidity}',
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  const Text(
                                    'Humidity',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('images/wind-direction.png'),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    '${data.windDirection}',
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  const Text(
                                    'Wind Direction',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 15.0),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
