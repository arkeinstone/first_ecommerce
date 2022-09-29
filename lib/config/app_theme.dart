import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme{
  AppTheme._();

  // Custom reusable BorderRadius
  static BorderRadius borderRadius5 = BorderRadius.circular(5.0);
  static BorderRadius borderRadius8 = BorderRadius.circular(8.0);
  static BorderRadius borderRadius10 = BorderRadius.circular(10.0);
  static BorderRadius borderRadius12 = BorderRadius.circular(12.0);
  static BorderRadius borderRadius20 = BorderRadius.circular(20.0);

  // Custom reusable BorderSide
  static BorderSide blackBorderSide = const BorderSide(color: Colors.black, width: 1);

  // Custom reusable Padding
  static EdgeInsets paddingBottom8 = const EdgeInsets.only(bottom: 8.0);
  static EdgeInsets paddingTop10 = const EdgeInsets.only(top: 10.0);
  static EdgeInsets paddingRight5 = const EdgeInsets.only(right: 5.0);
  static EdgeInsets paddingTop100Bottom10 = const EdgeInsets.only(top: 100.0, bottom: 10.0);

  static EdgeInsets paddingAll5 = const EdgeInsets.all(5.0);
  static EdgeInsets paddingAll8 = const EdgeInsets.all(8.0);
  static EdgeInsets paddingAll10 = const EdgeInsets.all(10.0);
  static EdgeInsets paddingAll20 = const EdgeInsets.all(20.0);

  static EdgeInsets paddingHorizon20Vertical10 = const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0);
  static EdgeInsets paddingHorizon5Vertical30 = const EdgeInsets.symmetric(horizontal: 5.0, vertical: 30.0);
  static EdgeInsets paddingHorizon40Vertical10 = const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0);
  static EdgeInsets paddingHorizon8Vertical10 = const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0);
  static EdgeInsets paddingHorizon8Vertical16 = const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0);
  static EdgeInsets paddingHorizon20 = const EdgeInsets.symmetric(horizontal: 20.0);
  static EdgeInsets paddingVertical5 = const EdgeInsets.symmetric(vertical: 5.0);

  static EdgeInsets paddingFromL20T10R20B0 = const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0);

  // Custom reusable Align
  static AlignmentGeometry alignY008 = const Alignment(0.0, 0.8);
}