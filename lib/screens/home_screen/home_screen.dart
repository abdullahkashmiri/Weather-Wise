import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_wise/screens/loading_screen/loading_screen.dart';
import 'package:weather_wise/services/api_service.dart';
import 'package:weather_wise/models/forecast_weather.dart';
import 'package:weather_wise/models/current_weather.dart';
import 'package:weather_wise/widgets/city_selector.dart';
import 'package:weather_wise/widgets/weather_component.dart';
import 'dart:developer';
import 'package:flutter/foundation.dart';

String selectedCity = 'Lahore';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // VARIABLES
  String currentWeatherImageLink = '';
  String currentTemp = '';
  String currentTempStatus = '';
  String currentTempFeelsLike = '';
  String rainPrep ='';
  String windSpeed = '';
  String windPressure = '';
  String humidity = '';
  String cloud = '';
  String uvIndex = '';

  List<String> popularCapitalCities = [
    'New York',
    'Tokyo', // Japan
    'Beijing', // China
    'Lahore', // Pakistan
    'Paris', // France
    'London', // United Kingdom
    'Berlin', // Germany
    'Rome', // Italy
    'Moscow', // Russia
    'Cairo', // Egypt
    'New Delhi', // India
    'Brasília', // Brazil
    'Washington, D.C.', // United States
    'Ottawa', // Canada
    'Buenos Aires', // Argentina
    'Canberra', // Australia
    'Seoul', // South Korea
    'Ankara', // Turkey
    'Mexico City', // Mexico
    'Pretoria', // South Africa
    'Madrid', // Spain
    'Stockholm', // Sweden
  ];

// FUNCTIONS
  void updateSelectedCity(String newCity) {
    setState(() {
      selectedCity = newCity;
    });
  }

  void updateData(AsyncSnapshot currentWeatherSnapshot) async {
    CurrentWeather? currentWeather = currentWeatherSnapshot.data;
    currentWeatherImageLink =
    'https:${currentWeather?.current?.condition?.icon}';
    currentTemp = ' ${currentWeather?.current?.tempC?.toInt()}°';
    currentTempStatus = currentWeather?.current?.condition?.text ?? '';
    currentTempFeelsLike =
    'Feels like ${currentWeather?.current?.feelslikeC?.toInt()}°';
    rainPrep = ' ${currentWeather?.current?.precipIn ?? 0.0}%' ;
    windSpeed = ' ${currentWeather?.current?.windKph ?? 0.0} km/h';
    windPressure = ' ${currentWeather?.current?.pressureIn ?? 0.0} In';
    humidity = ' ${currentWeather?.current?.humidity ?? 0}' ;
    cloud = ' ${currentWeather?.current?.cloud ?? 0}%';
    uvIndex = ' ${currentWeather?.current?.uv ?? 0.0}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ApiService().getCurrentWeather(selectedCity),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          }
          if (snapshot.hasError) {
            log('LOG-> Snapshot Error: ${snapshot.error}');
            return Center(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Some Error Occurred ${snapshot.error}',
                style: const TextStyle(color: Colors.white),),
            ));
          } else {
            updateData(snapshot);
            DateTime currentDate = DateTime.now();
            String formattedDate = DateFormat.yMMMMd().format(currentDate);
            return SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF1A237E), Colors.black],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, left: 15.0),
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'Today: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: formattedDate,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                    )
                                  ),
                                ],
                              ),
                            ),
                            const Expanded(child: SizedBox.shrink()),
                            IconButton(
                                onPressed: () {

                                }, icon: const Icon(Icons.menu,
                              color: Colors.white,))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Row(
                          children: [
                            CitySelector(dropDownItems: popularCapitalCities,
                              initialSelectedValue: selectedCity,
                              onCitySelected: updateSelectedCity,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 3.0),
                        child: SizedBox(
                          width: 150.0,
                          height: 150.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              currentWeatherImageLink,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: currentTemp,
                              style: TextStyle(
                                fontSize: 60,
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'C',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3.0),
                        child: Text(
                          currentTempStatus,
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold
                          ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3.0),
                        child: Text(currentTempFeelsLike,
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 14.0
                          ),),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF1A237E), Colors.black],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),color: Colors.blue.shade900,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            //------------
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Colors.grey.withOpacity(0.3),
                                          ),  child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const Text('🌧',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 28.0,
                                              ),),
                                            Text(rainPrep,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.0,
                                              ),),
                                          ],
                                        ),
                                      )),
                                    ),
                                    const SizedBox(width: 15.0,),
                                    WeatherComponent(icon: Icons.air, backgroundColor: Colors.grey.withOpacity(0.3), label: windSpeed, iconColor: Colors.white,),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    WeatherComponent(icon: Icons.track_changes_sharp, backgroundColor: Colors.grey.withOpacity(0.3), label: windPressure, iconColor: Colors.grey,),
                                    const SizedBox(width: 15.0,),
                                    WeatherComponent(icon: Icons.cloud, backgroundColor: Colors.grey.withOpacity(0.3), label: cloud, iconColor: Colors.white,),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    WeatherComponent(icon: Icons.sunny, backgroundColor: Colors.grey.withOpacity(0.3), label: uvIndex, iconColor: Colors.yellow,),
                                    const SizedBox(width: 15.0,),
                                    WeatherComponent(icon: Icons.water_drop_sharp, backgroundColor: Colors.grey.withOpacity(0.3), label: humidity, iconColor: Colors.blue,),
                                  ],
                                ),
                              ),
                              //----------------
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: SizedBox(
                                    height: 200.0,
                                    child: ForcastWeather()),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class ForcastWeather extends StatelessWidget {
  const ForcastWeather({super.key});


  // Functions
  Future<ForecastWeather?> fetchData() async {
    try {
      return await ApiService().getForecastWeather(selectedCity);
    } catch (e) {
      if (kDebugMode) {
        print('Exception: $e');
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchData(),
        builder: (context, AsyncSnapshot<ForecastWeather?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          ForecastWeather? forecastWeather = snapshot.data;
          List<Forecastday>? forecastDays = forecastWeather?.forecast?.forecastday;
          return ListView.builder(
            itemBuilder: (context, index) {
              ForecastWeather? forecastWeather = snapshot.data;
              List<Forecastday>? forecastDays = forecastWeather?.forecast?.forecastday;

              if (forecastDays != null && index < forecastDays.length) {
                Forecastday selectedDay = forecastDays[index];
                List<Hour>? hours = selectedDay.hour;

                DateTime currentDateTime = DateTime.now();
                int? currentHourIndex = hours?.indexWhere((hour) =>
                DateTime.parse(hour.time ?? "").hour == currentDateTime.hour);

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, hourIndex) {
                    Hour? selectedHour = hours?[hourIndex];
                    String inputTime = selectedHour?.time ?? "";
                    double? tempC = selectedHour?.tempC ?? 0.0;
                    int? rainPrep = selectedHour?.chanceOfRain ?? 0;
                    DateTime dateTime = DateTime.parse(inputTime);
                    String formattedTime = DateFormat.jm().format(dateTime).toLowerCase();

                    final isPast = hourIndex < (currentHourIndex ?? 0);
                    final isCurrent = hourIndex == (currentHourIndex ?? 0);

                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.white),
                            color: isPast
                                ? Colors.grey.shade700 // Color for past hours
                                : isCurrent
                                ? Colors.blue // Color for current hour
                                : Colors.transparent, // Color for upcoming hours
                          ),
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Text(
                                formattedTime,
                                style: const TextStyle(color: Colors.white),
                              ),
                              const Expanded(child: SizedBox(width: 5.0)),
                              Text(
                                '🌧 $rainPrep',
                                style: const TextStyle(color: Colors.white),
                              ),
                              const Expanded(child: SizedBox(width: 5.0)),
                              Text(
                                '$tempC°C',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: hours?.length,
                );

              }
              return null;
            },
            itemCount: forecastDays?.length ?? 0,
          );
        });
  }
}
