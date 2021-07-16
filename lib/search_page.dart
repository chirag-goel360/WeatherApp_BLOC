import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/show_weather.dart';
import 'package:weather_bloc/weather_bloc.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final blocOfWeather = BlocProvider.of<BlocWeather>(context);
    TextEditingController controller = TextEditingController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            child: FlareActor(
              "assets/weather.flr",
              fit: BoxFit.contain,
              animation: "02d",
            ),
            height: 300,
            width: 300,
          ),
        ),
        BlocBuilder<BlocWeather, WeatherStates>(
          builder: (context, state) {
            if (state is WeatherNotSearched)
              return Container(
                padding: EdgeInsets.only(
                  left: 32,
                  right: 32,
                ),
                child: Column(
                  children: [
                    Text(
                      "Search Weather",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: controller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white70,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                            color: Colors.white70,
                            style: BorderStyle.solid,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            style: BorderStyle.solid,
                          ),
                        ),
                        hintText: "City Name",
                        hintStyle: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white70,
                      ),
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
                          blocOfWeather.add(
                            FetchWeatherData(
                              controller.text,
                            ),
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
            else if (state is WeatherLoading)
              return Center(
                child: CircularProgressIndicator(),
              );
            else if (state is WeatherLoaded)
              return ShowWeather(
                state.getWeather,
                controller.text,
              );
            else
              return Center(
                child: Column(
                  children: [
                    Text(
                      "Error",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
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
          },
        ),
      ],
    );
  }
}
