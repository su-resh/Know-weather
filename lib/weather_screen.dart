import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Weather App',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
           IconButton(
             icon: const Icon(Icons.refresh),
             onPressed: (){},
           ),
          ]),
          body: const Column(
            // main card
           children: [
            Placeholder(fallbackHeight: 250,
            child: Text("Main Card"),
            ),
           ],
          )
    );
  }
}
