import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/weather_bloc.dart';
import 'package:weather_bloc/weather_class.dart';

class ShowWeather extends StatelessWidget {
  final WeatherClass weather;
  final String city;

  ShowWeather(
    this.weather,
    this.city,
  );

  String capitalize(String city) {
    return city[0].toUpperCase() + city.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 32,
        left: 32,
        top: 10,
      ),
      child: Column(
        children: [
          Text(
            capitalize(city),
            style: TextStyle(
              color: Colors.white70,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            weather.getTemperature.toStringAsFixed(2).toString() + "°C",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 50,
            ),
          ),
          Text(
            "Temperature",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    weather.getMinTemperature.toStringAsFixed(2).toString() +
                        "°C",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    "Min Temperature",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    weather.getMaxTemperature.toStringAsFixed(2).toString() +
                        "°C",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    "Max Temperature",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                backgroundColor: Colors.lightBlue,
              ),
              onPressed: () {
                BlocProvider.of<BlocWeather>(context).add(
                  Reset(),
                );
              },
              child: Text(
                "Search",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
