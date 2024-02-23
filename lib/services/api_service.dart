import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:weather_wise/models/forecast_weather.dart';
import 'dart:convert';
import 'package:weather_wise/models/current_weather.dart';

class ApiService {
  // Variables
  static const String apiKey = '05b90f0d7e11449b86a120313241602';
  static const String baseUrl = 'http://api.weatherapi.com/v1';

  // Functions
  Future<CurrentWeather> getCurrentWeather(String city) async {
    const String endpoint = '/current.json';
    try {
      final response = await http.get(
        Uri.parse('$baseUrl$endpoint?key=$apiKey&q=$city&aqi=no'),
      );
      if (kDebugMode) {
        print('current request: $baseUrl$endpoint?key$apiKey&q=$city&aqi=no');
      }
      if (response.statusCode == 200) {
        return CurrentWeather.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load current weather data');
      }
    } catch (e) {
      throw Exception('Exception: $e');
    }
  }

  Future<ForecastWeather?> getForecastWeather(String city) async {
    const String endpoint = '/forecast.json';
    try{
      final response = await http.get(
        Uri.parse('$baseUrl$endpoint?key=$apiKey&q=$city&aqi=no'),
      );
      if(kDebugMode) {
        print('forecast request: $baseUrl$endpoint?key=$apiKey&q=$city&aqi=no');
      }
      if(response.statusCode == 200){
        return ForecastWeather.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load forecast weather data');
      }
    } catch (e) {
      throw Exception('Exception: $e');
    }
  }
}