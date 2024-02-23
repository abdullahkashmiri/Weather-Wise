import 'package:flutter/material.dart';

class WeatherComponent extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final String label;

  const WeatherComponent({
    Key? key,
    required this.icon,
    required this.backgroundColor,
    required this.label,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: backgroundColor
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 12.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(icon, color: iconColor,
                  size: 30,),
                Text(
                  label,
                  style: const TextStyle(color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        )
    );
  }
}
