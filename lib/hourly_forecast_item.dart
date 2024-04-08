import 'package:flutter/material.dart';
class HourlyForecastItem extends StatelessWidget {
  final String time;
  final String tempreature;
  final IconData icon;

  const HourlyForecastItem({
    super.key,
    required this.time,
    required this.tempreature,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
                        elevation: 6,
                        child: Container(
                          width: 100,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Text(
                                time,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Icon(
                                icon,
                                size: 30,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                tempreature,
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
  }
}

