import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/search_page.dart';
import 'package:weather_bloc/weather_bloc.dart';
import 'package:weather_bloc/weather_repository.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Application',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: BlocProvider(
          create: (context) => BlocWeather(
            Repository(),
          ),
          child: SearchPage(),
        ),
      ),
    );
  }
}
