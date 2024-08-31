import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'bloc/weather_bloc_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset('assets/1.png');
      case >= 300 && < 400:
        return Image.asset('assets/2.png');
      case >= 500 && < 600:
        return Image.asset('assets/3.png');
      case >= 600 && < 700:
        return Image.asset('assets/4.png');
      case >= 700 && < 800:
        return Image.asset('assets/5.png');
      case == 800:
        return Image.asset('assets/6.png');
      case > 800 && <= 804:
        return Image.asset('assets/7.png');
      default:
        return Image.asset('assets/7.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(3, -0.3),
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.deepPurple, shape: BoxShape.circle),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, -1.2),
              child: Container(
                width: 300,
                height: 300,
                decoration:
                    BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-3, -0.3),
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.deepPurple, shape: BoxShape.circle),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
              child: Container(
                decoration: const BoxDecoration(color: Colors.transparent),
              ),
            ),
            BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
              builder: (context, state) {
                if (state is WeatherBlocSuccess) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                          40, 1.2 * kToolbarHeight, 40, 20),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '📍 ${state.weather.areaName}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Good Morning',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28),
                            ),
                          ),
                          Center(
                            child: getWeatherIcon(state.weather.weatherConditionCode!),
                          ),
                          Center(
                            child: Text(
                              '${state.weather.temperature!.celsius!.round()}°C',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 45),
                            ),
                          ),
                          Center(
                            child: Text(
                                state.weather.weatherMain!.toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              DateFormat('EEEE dd •').add_jm().format(state.weather.date!),
                              style: TextStyle(
                                color: Colors.grey,
                                //  fontWeight: FontWeight.w400,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/11.png',
                                    scale: 8,
                                  ),
                                  const SizedBox(width: 5),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Sunrise',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 17,
                                        ),
                                      ),
                                      Text(
                                        DateFormat().add_jm().format(state.weather.sunrise!),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/12.png',
                                    scale: 8,
                                  ),
                                  const SizedBox(width: 5),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Sunset',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 17,
                                        ),
                                      ),
                                      Text(
                                        DateFormat().add_jm().format(state.weather.sunset!),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Divider(
                            thickness: 0.4,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/13.png',
                                    scale: 8,
                                  ),
                                  const SizedBox(width: 3),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Temp Max',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 17,
                                        ),
                                      ),
                                      Text(
                                        "${state.weather.tempMax!.celsius!.round()} °C",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/14.png',
                                    scale: 8,
                                  ),
                                  const SizedBox(width: 5),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Temp Min',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 17,
                                        ),
                                      ),
                                      Text(
                                        "${state.weather.tempMin!.celsius!.round()} °C",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
