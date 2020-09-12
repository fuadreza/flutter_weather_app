import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_weather_app/services/location_service.dart';
import 'package:flutter_weather_app/services/networking_service.dart';

import 'location_screen.dart';

const apiKey = 'a06f97c1412afa529629d81bf4070a5d';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    LocationService location = LocationService();

    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.getLatitude()}&lon=${location.getLongitude()}&appid=$apiKey&units=metric');

    // print('https://api.openweathermap.org/data/2.5/weather?lat=${location.getLatitude()}&lon=${location.getLongitude()}&appid=$apiKey');

    var weatherData = await networkHelper.getData();

    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      // print(weatherData);
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 60.0,
        ),
      ),
    );
  }
}
