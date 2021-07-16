import 'package:bloc/bloc.dart';
import 'package:weather_bloc/weather_class.dart';
import 'package:weather_bloc/weather_repository.dart';

class WeatherEvents {
  List<Object> get props => [];
}

class FetchWeatherData extends WeatherEvents {
  final String city;

  FetchWeatherData(
    this.city,
  );

  @override
  List<Object> get props => [city];
}

class Reset extends WeatherEvents {}

class WeatherStates {
  List<Object> get props => [];
}

class WeatherNotSearched extends WeatherStates {}

class WeatherLoading extends WeatherStates {}

class WeatherNotLoaded extends WeatherStates {}

class WeatherLoaded extends WeatherStates {
  final weather;

  WeatherLoaded(
    this.weather,
  );

  WeatherClass get getWeather => weather;

  @override
  List<Object> get props => [weather];
}

class BlocWeather extends Bloc<WeatherEvents, WeatherStates> {
  Repository repository;

  BlocWeather(
    this.repository,
  ) : super(WeatherNotSearched());

  @override
  Stream<WeatherStates> mapEventToState(WeatherEvents event) async* {
    if (event is FetchWeatherData) {
      yield WeatherLoading();
      try {
        WeatherClass weather = await repository.getWeather(
          event.city,
        );
        yield WeatherLoaded(
          weather,
        );
      } catch (_) {
        yield WeatherNotLoaded();
      }
    } else if (event is Reset) {
      yield WeatherNotSearched();
    }
  }
}
