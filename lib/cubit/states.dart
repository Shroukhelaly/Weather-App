import '../model/weather_model.dart';

class WeatherStates {}


class InitialState extends WeatherStates{}

class WeatherLoadedState extends WeatherStates{

  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);


}

class WeatherFailureState extends WeatherStates{

  final String error;

  WeatherFailureState(this.error);
}

