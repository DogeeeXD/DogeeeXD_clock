// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:digital_clock/date.dart';
import 'package:digital_clock/time.dart';
import 'package:digital_clock/weather.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum _Element {
  background,
  text,
  shadow,
}

final _lightTheme = {
  _Element.background: Color(0xFF17202A),
  _Element.text: Colors.white,
  _Element.shadow: Colors.blueAccent,
};

final _darkTheme = {
  _Element.background: Color(0xFF2A1717),
  _Element.text: Colors.white,
  _Element.shadow: Colors.red,
};

/// A basic digital clock.
///
/// You can do better than this!
class DigitalClock extends StatefulWidget {
  const DigitalClock(this.model);
  final ClockModel model;

  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(DigitalClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  void _updateModel() {
    setState(() {
      // Cause the clock to rebuild when the model changes.
    });
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();
      // Update once per minute. If you want to update every second, use the
      // following code.
      /* _timer = Timer(
        Duration(minutes: 1) -
            Duration(seconds: _dateTime.second) -
            Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      ); */
      // Update once per second, but make sure to do it at the beginning of each
      // new second, so that the clock is accurate.
      _timer = Timer(
        Duration(seconds: 1) - Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final _colors = Theme.of(context).brightness == Brightness.light
        ? _lightTheme
        : _darkTheme;
    final _date = DateFormat.yMMMEd().format(_dateTime);
    final _hour =
        DateFormat(widget.model.is24HourFormat ? 'HH' : 'hh').format(_dateTime);
    final _minute = DateFormat('mm').format(_dateTime);
    final _second = DateFormat('ss').format(_dateTime);
    final _ampm = DateFormat('a').format(_dateTime);
    final _weather = widget.model.weatherString;
    final _temperature = widget.model.temperatureString;
    final _textColor = _colors[_Element.text];
    final _shadowColor = _colors[_Element.shadow];

    return Container(
        color: _colors[_Element.background],
        alignment: Alignment.center,
        child: Column(children: <Widget>[
          Date(_date, _textColor, _shadowColor),
          Time(_hour, _minute, _second, _ampm, _textColor, _shadowColor),
          Weather(_weather, _temperature, _textColor, _shadowColor),
        ]));
  }
}
