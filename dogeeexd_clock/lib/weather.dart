import 'dart:ui';

import 'package:flutter/material.dart';
import './weather_icons_icons.dart';

class Weather extends StatelessWidget {
  final _weather;
  final _temperature;
  final _textColor;
  final _shadowColor;

  Weather(this._weather, this._temperature, this._textColor, this._shadowColor);

  @override
  Widget build(BuildContext context) {
    final _fontSize = MediaQuery.of(context).size.width / 3.5;
    final _weatherTextStyle = TextStyle(
      color: _textColor,
      fontFamily: 'Beon',
      fontSize: _fontSize / 6,
      shadows: [
        Shadow(
          blurRadius: 8.0,
          color: _shadowColor,
          offset: Offset(0, 0),
        ),
      ],
    );
    var _weatherIcon = WeatherIcons.sun_filled;

    if (_weather == 'cloudy') {
      _weatherIcon = WeatherIcons.cloud;
    } else if (_weather == 'rainy') {
      _weatherIcon = WeatherIcons.rain;
    } else if (_weather == 'snowy') {
      _weatherIcon = WeatherIcons.snow;
    } else if (_weather == 'sunny') {
      _weatherIcon = WeatherIcons.sun_filled;
    } else if (_weather == 'thunderstorm') {
      _weatherIcon = WeatherIcons.cloud_flash;
    } else if (_weather == 'windy') {
      _weatherIcon = WeatherIcons.cloud_wind;
    } else if (_weather == 'foggy') {
      _weatherIcon = WeatherIcons.fog_cloud;
    }

    return Container(
      child: DefaultTextStyle(
        style: _weatherTextStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              _weatherIcon,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(width: 10),
            Column(
              children: <Widget>[
                Text(_temperature),
                Text(_weather),
              ],
            )
          ],
        ),
      ),
    );
  }
}
