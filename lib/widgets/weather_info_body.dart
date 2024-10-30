import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit.dart';

import '../model/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  final WeatherModel weather;

  const WeatherInfoBody({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          'assetName',
        ),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  weatherModel.cityName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Last modified at ${(weatherModel.data.hour > 12 ? weatherModel.data.hour - 12 : weatherModel.data.hour).toString().padLeft(2, '0')}:${weatherModel.data.minute.toString().padLeft(2, '0')} ${weatherModel.data.hour > 12 ? "pm" : "am"}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: NetworkImage(
                        'https:${weatherModel.image}',
                      ),
                    ),
                    Text(
                      '${weatherModel.temp.round()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          'MaxTemp : ${weatherModel.maxTemp.round()}',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'MinTemp : ${weatherModel.minTemp.round()}',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  weatherModel.weatherCondition,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
