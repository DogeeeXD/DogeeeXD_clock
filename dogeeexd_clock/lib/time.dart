import 'package:flutter/material.dart';

class Time extends StatelessWidget {
  final hour;
  final minute;
  final second;
  final ampm;
  final textColor;
  final shadowColor;

  Time(
    this.hour,
    this.minute,
    this.second,
    this.ampm,
    this.textColor,
    this.shadowColor,
  );

  @override
  Widget build(BuildContext context) {
    final fontSize = MediaQuery.of(context).size.width / 3.5;

    final defaultTextStyle = TextStyle(
      color: textColor,
      fontFamily: 'Beon',
      fontSize: fontSize,
      shadows: [
        Shadow(
          blurRadius: 8.0,
          color: shadowColor,
          offset: Offset(0, 0),
        ),
      ],
    );

    final subTextStyle = TextStyle(
      color: textColor,
      fontFamily: 'Beon',
      fontSize: fontSize / 3.5,
      shadows: [
        Shadow(
          blurRadius: 8.0,
          color: shadowColor,
          offset: Offset(0, 0),
        ),
      ],
    );

    return Container(
        alignment: Alignment.center,
        child: DefaultTextStyle(
          style: defaultTextStyle,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(hour),
              Text(':'),
              Text(minute),
              DefaultTextStyle(
                style: subTextStyle,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 28),
                    Text(second),
                    SizedBox(width: 100),
                    Text(ampm),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
