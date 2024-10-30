import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/states.dart';
import 'package:weather_app/model/weather_model.dart';

import '../services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(InitialState());
   WeatherModel? weatherModel;

  getCurrentWeather({required String cityName}) async {
    try {
      weatherModel =
          (await WeatherService(Dio()).getCurrentWeather(cityName: cityName))!;

      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }
}
