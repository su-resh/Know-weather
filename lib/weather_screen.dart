import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/additional_info_item.dart';
import 'package:weather_app/hourly_forecast_item.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/secrets.dart';

double temp = 0.0; 

class WeatherScreen extends StatefulWidget {
  
  const WeatherScreen({super.key});

  
  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentWeather();
  }

  Future getCurrentWeather() async {
    try{
    final res = await http.get( 
      Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=Pokhara,nepal&APPID,nepal&APPID=$openWeatherAPIKEY')
    );
    final data = jsonDecode(res.body);

    if(data['cod'] != '200'){
      throw 'An unexpected error occured';
    }
    setState(()  {temp = data['list'] [0] ['main'] ['temp'];});
      
      }
    
    catch(e){
      throw e.toString();
    }
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
        appBar: AppBar(
            title: const Text(
              'Weather Forecast',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {},
              ),
            ]),
        body: temp == 0 ? const 
        CircularProgressIndicator():
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // main card
            children: [
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "$temp K",
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Icon(
                              Icons.cloud,
                              size: 50,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Rain",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Weather forecast cards
              const Text(
                "Weather Forecast",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    HourlyForecastItem(
                        time: '00:00',
                        icon: Icons.cloud,
                        tempreature: '300.12',
                      ),
                    HourlyForecastItem(
                        time: '03:00',
                        icon: Icons.sunny,
                        tempreature: '300.12',
                      ),
                    HourlyForecastItem(
                        time: '02:00',
                        icon: Icons.cloud,
                        tempreature: '300.12',
                      ),
                    HourlyForecastItem(
                        time: '03:00',
                        icon: Icons.sunny,
                        tempreature: '300.52',
                      ),
                    HourlyForecastItem(
                        time: '04:00',
                        icon: Icons.sunny,
                        tempreature: '300.42',
                      ),
                      
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //additional infromation  
                const Text(
                "Additional Information",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AdditionalInfoItem(
                    icon: Icons.water_drop,
                    label: "Humidity",
                    value: "80",
                  ),
                  AdditionalInfoItem(
                    icon: Icons.air,
                    label: "Wind Speed",
                    value: "5",
                  ),
                  AdditionalInfoItem(
                    icon: Icons.beach_access,
                    label:  "Pressure",
                    value: '1000',
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

