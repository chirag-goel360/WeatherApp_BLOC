class WeatherClass {
  final temperature;
  final pressure;
  final humidity;
  final maxTemperature;
  final minTemperature;

  WeatherClass(
    this.temperature,
    this.pressure,
    this.humidity,
    this.maxTemperature,
    this.minTemperature,
  );

  double get getTemperature => temperature - 273.15;
  double get getMaxTemperature => maxTemperature - 273.15;
  double get getMinTemperature => minTemperature - 273.15;

  factory WeatherClass.fromJson(Map<String, dynamic> jsonData) {
    return WeatherClass(
      jsonData["temp"],
      jsonData["pressure"],
      jsonData["humidity"],
      jsonData["temp_max"],
      jsonData["temp_min"],
    );
  }
}
