class WeatherModel {
  final String cityName;
  final DateTime data;
  final double temp;
  final String? image;
  final double minTemp;
  final double maxTemp;
  final String weatherCondition;

  WeatherModel({
    required this.cityName,
    required this.data,
    required this.maxTemp,
    this.image,
    required this.weatherCondition,
    required this.minTemp,
    required this.temp,
  });

  factory WeatherModel.fromJSON(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      data: DateTime.parse(json['current']['last_updated']),
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
