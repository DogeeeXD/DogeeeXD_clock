import 'package:flutter/material.dart';

class Weather extends StatelessWidget {
  final weather;
  final temperature;
  final textColor;
  final shadowColor;

  Weather(this.weather, this.temperature, this.textColor, this.shadowColor);

  @override
  Widget build(BuildContext context) {
    final fontSize = MediaQuery.of(context).size.width / 3.5;

    final weatherTextStyle = TextStyle(
      color: textColor,
      fontFamily: 'Beon',
      fontSize: fontSize / 6,
      shadows: [
        Shadow(
          blurRadius: 8.0,
          color: shadowColor,
          offset: Offset(0, 0),
        ),
      ],
    );

    return Container(
      child: DefaultTextStyle(
        style: weatherTextStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.wb_sunny,
              color: Colors.white,
              size: 40,
            ),
            Column(
              children: <Widget>[
                Text(temperature),
                Text(weather),
              ],
            )
          ],
        ),
      ),
    );
  }
}
