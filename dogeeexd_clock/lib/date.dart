import 'package:flutter/material.dart';

class Date extends StatelessWidget {
  final _date;
  final _textColor;
  final _shadowColor;

  Date(this._date, this._textColor, this._shadowColor);

  @override
  Widget build(BuildContext context) {
    final _fontSize = MediaQuery.of(context).size.width / 3.5;

    final _dateTextStyle = TextStyle(
      color: _textColor,
      fontFamily: 'Beon',
      fontSize: _fontSize / 4.5,
      shadows: [
        Shadow(
          blurRadius: 8.0,
          color: _shadowColor,
          offset: Offset(0, 0),
        ),
      ],
    );

    return Container(
      child: DefaultTextStyle(
        style: _dateTextStyle,
        child: Text(_date),
      ),
    );
  }
}
