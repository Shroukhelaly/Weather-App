import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit.dart';
import 'package:weather_app/cubit/states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return GetWeatherCubit();
      },
      child: BlocProvider(
        create: (context) => GetWeatherCubit(),
        child: Builder(
          builder: (context) => BlocBuilder<GetWeatherCubit, WeatherStates>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    appBarTheme: AppBarTheme(
                      color: getThemeColor(
                        BlocProvider.of<GetWeatherCubit>(context)
                            .weatherModel
                            ?.weatherCondition,
                      ),
                    ),
                    scaffoldBackgroundColor: getThemeColor(
                        BlocProvider.of<GetWeatherCubit>(context)
                            .weatherModel
                            ?.weatherCondition)),
                home: const HomeView(),
              );
            },
          ),
        ),
      ),
    );
  }
}

Color getThemeColor(String? dayCondition) {
  switch (dayCondition) {
    case "Sunny":
      return Colors.yellow.withOpacity(0.7); // Clear, sunny conditions

    case "Partly cloudy":
      return Colors.lightBlue; // Partly cloudy conditions

    case "Cloudy":
      return Colors.blueGrey; // Cloudy

    case "Overcast":
      return Colors.grey; // Overcast

    case "Mist":
    case "Fog":
    case "Freezing fog":
      return Colors.blueGrey; // Misty or foggy conditions

    case "Patchy rain possible":
    case "Patchy light rain":
    case "Light rain":
    case "Light rain shower":
      return Colors.lightBlue; // Light rain conditions

    case "Moderate rain at times":
    case "Moderate rain":
    case "Moderate or heavy rain shower":
      return Colors.blue; // Moderate rain conditions

    case "Heavy rain at times":
    case "Heavy rain":
    case "Torrential rain shower":
      return Colors.indigo; // Heavy rain

    case "Patchy snow possible":
    case "Light snow":
    case "Patchy light snow":
    case "Light snow showers":
      return Colors.lightBlue; // Light snow

    case "Moderate snow":
    case "Patchy moderate snow":
    case "Moderate or heavy snow showers":
      return Colors.blueGrey; // Moderate snow

    case "Heavy snow":
    case "Patchy heavy snow":
    case "Blizzard":
      return Colors.grey; // Heavy snow, Blizzard

    case "Patchy light drizzle":
    case "Light drizzle":
      return Colors.lightGreen; // Drizzle conditions

    case "Freezing drizzle":
    case "Heavy freezing drizzle":
    case "Light freezing rain":
    case "Moderate or heavy freezing rain":
      return Colors.cyan; // Freezing rain/drizzle

    case "Thundery outbreaks possible":
    case "Patchy light rain with thunder":
      return Colors.deepPurple; // Thunderstorm

    case "Moderate or heavy rain with thunder":
    case "Patchy light snow with thunder":
    case "Moderate or heavy snow with thunder":
      return Colors.purple; // Thunder with rain/snow

    case "Ice pellets":
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
      return Colors.cyan; // Ice pellets or hail

    case "Blowing snow":
      return Colors.blueGrey; // Blowing snow conditions

    case "Light sleet":
    case "Moderate or heavy sleet":
    case "Light sleet showers":
    case "Moderate or heavy sleet showers":
      return Colors.blueGrey; // Sleet

    default:
      return Colors.blueGrey; // Default for unlisted or unclear conditions
  }
}
