import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_bloc/weather_class.dart';

// Get Your API key from "https://home.openweathermap.org/api_keys"
String key = "API KEY";

class Repository {
  Future<WeatherClass> getWeather(String city) async {
    String constURL = "https://api.openweathermap.org/data/2.5/weather?q=";
    String url = constURL + city + "&APPID=" + key;
    final result = await http.get(
      Uri.parse(
        url,
      ),
    );
    if (result.statusCode != 200) throw Exception();
    return parsedJson(
      result.body,
    );
  }

  WeatherClass parsedJson(final response) {
    final decodeData = json.decode(
      response,
    );
    final jsonWeather = decodeData["main"];
    return WeatherClass.fromJson(
      jsonWeather,
    );
  }
}
