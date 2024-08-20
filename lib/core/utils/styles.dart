import 'package:flutter/material.dart';

abstract class Styles {
  static const mainValue = TextStyle(
    fontSize: 40.0,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static const signal = TextStyle(
    fontSize: 14.0,
    color: Colors.yellow,
    fontWeight: FontWeight.w500,
  );
  static const mainNames = TextStyle(
    fontSize: 36,
    height: 0,
    fontWeight: FontWeight.bold,
  );
  static const mainTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white70,
  );
  static const textFieldTitle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
  );
  static const textFieldHint = TextStyle(
    color: Colors.grey,
    fontSize: 20,
  );
}
