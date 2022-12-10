import 'dart:convert';

import '../Models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherData {
  Future<Weather> getData(var latitude, var longitude) async {
    String url =
        'https://api.weatherapi.com/v1/current.json?key=01fee3853e324e04a5162644220612&q=$latitude,$longitude&aqi=no';
    http.Response response = await http.get(Uri.parse(url));
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
