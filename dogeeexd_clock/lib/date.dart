import 'package:flutter/material.dart';

class Date extends StatelessWidget {
  final date;
  final textColor;
  final shadowColor;

  Date(this.date, this.textColor, this.shadowColor);

  @override
  Widget build(BuildContext context) {
    final fontSize = MediaQuery.of(context).size.width / 3.5;

    final dateTextStyle = TextStyle(
      color: textColor,
      fontFamily: 'Beon',
      fontSize: fontSize / 4.5,
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
        style: dateTextStyle,
        child: Text(date),
      ),
    );
  }
}
