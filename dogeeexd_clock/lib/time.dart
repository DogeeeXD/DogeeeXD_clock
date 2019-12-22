import 'package:flutter/material.dart';

class Time extends StatelessWidget {
  final _hour;
  final _minute;
  final _second;
  final _ampm;
  final _textColor;
  final _shadowColor;

  Time(
    this._hour,
    this._minute,
    this._second,
    this._ampm,
    this._textColor,
    this._shadowColor,
  );

  @override
  Widget build(BuildContext context) {
    final _fontSize = MediaQuery.of(context).size.width / 3.5;

    final _defaultTextStyle = TextStyle(
      color: _textColor,
      fontFamily: 'Beon',
      fontSize: _fontSize,
      shadows: [
        Shadow(
          blurRadius: 8.0,
          color: _shadowColor,
          offset: Offset(0, 0),
        ),
      ],
    );

    final _subTextStyle = TextStyle(
      color: _textColor,
      fontFamily: 'Beon',
      fontSize: _fontSize / 3.5,
      shadows: [
        Shadow(
          blurRadius: 8.0,
          color: _shadowColor,
          offset: Offset(0, 0),
        ),
      ],
    );

    return Container(
        alignment: Alignment.center,
        child: DefaultTextStyle(
          style: _defaultTextStyle,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_hour),
              Text(':'),
              Text(_minute),
              DefaultTextStyle(
                style: _subTextStyle,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 28),
                    Text(_second),
                    SizedBox(width: 100),
                    Text(_ampm),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
