// Copyright 2021 SweetsByRoshan Authors. All rights reserved.

import 'dart:ui' show Color;

import 'package:flutter/painting.dart';
// Color Pallette of Fluent Design System

// Fluent Color for COM Blue, Black, Red & Yellow
class FluentColor extends ColorSwatch<int> {
  const FluentColor(int primary, Map<int, Color> swatch)
      : super(primary, swatch);

  Color get shade25 => this[25];

  Color get shade50 => this[50];

  Color get shade100 => this[100];

  Color get shade200 => this[200];

  Color get shade300 => this[300];

  Color get shade400 => this[400];

  Color get shade500 => this[500];

  Color get shade600 => this[600];

  Color get shade700 => this[700];

  Color get shade800 => this[800];

  Color get shade900 => this[900];

  Color get shade950 => this[950];
}

// Fluent Color tints for COM Blue, Red & Yellow
class FluentTintColor extends ColorSwatch<int> {
  const FluentTintColor(int primary, Map<int, Color> swatch)
      : super(primary, swatch);

  Color get shade10 => this[10];

  Color get shade20 => this[20];

  Color get shade30 => this[30];

  Color get shade40 => this[40];
}

// Fluent Color Pallette
class FluentColors {
  FluentColors._();
// Transparent color
  static const Color transparent = Color(0x00000000);

// Black
  static const Color black = Color(0xFF000000);

// White
  static const Color white = Color(0xFFFFFFFF);

//Gray. Can be used as lighter shades of black
  static const FluentColor gray = FluentColor(
    _grayPrimaryValue,
    <int, Color>{
      25: Color(0xFFF8F8F8),
      50: Color(0xFFF1F1F1),
      100: Color(0xFFE1E1E1),
      200: Color(0xFFC8C8C8),
      300: Color(0xFFACACAC),
      400: Color(0xFF919191),
      500: Color(_grayPrimaryValue),
      600: Color(0xFF404040),
      700: Color(0xFF303030),
      800: Color(0xFF292929),
      900: Color(0xFF212121),
      950: Color(0xFF141414)
    },
  );
  static const int _grayPrimaryValue = 0xFF6E6E6E;

// Communications Blue. Avoid using in iOS directly.
  static const FluentColor blue = FluentColor(
    _bluePrimaryValue,
    <int, Color>{
      0: Color(_bluePrimaryValue),
      10: Color(0xFF106EBE),
      20: Color(0xFF005A9E),
      30: Color(0xFF004578),
    },
  );
  static const int _bluePrimaryValue = 0xFF0078D4;

// COM Blue tint.
  static const FluentTintColor blueTint = FluentTintColor(
    _blueTintPrimaryValue,
    <int, Color>{
      10: Color(_blueTintPrimaryValue),
      20: Color(0xFFC7E0F4),
      30: Color(0xFFDEECF9),
      40: Color(0xFFEFF6FC),
    },
  );
  static const int _blueTintPrimaryValue = 0xFF2B88D8;

// Red. To be used to indicate Danger or Error states
  static const FluentColor red = FluentColor(
    _redPrimaryValue,
    <int, Color>{
      0: Color(_redPrimaryValue),
      10: Color(0xFFBB2424),
      20: Color(0xFF8B1C1C),
      30: Color(0xFF6A1616),
    },
  );
  static const int _redPrimaryValue = 0xFFD92C2C;

// Red tint.
  static const FluentTintColor redTint = FluentTintColor(
    _redTintPrimaryValue,
    <int, Color>{
      10: Color(_redTintPrimaryValue),
      20: Color(0xFFEB9191),
      30: Color(0xFFFACFCF),
      40: Color(0xFFFFEBEB),
    },
  );
  static const int _redTintPrimaryValue = 0xFFE05454;

// Yellow. To be used to indicate warning or minor error states.
  static const FluentColor yellow = FluentColor(
    _yellowPrimaryValue,
    <int, Color>{
      0: Color(_yellowPrimaryValue),
      10: Color(0xFFDCAB00),
      20: Color(0xFF8A6B00),
      30: Color(0xFF745300),
    },
  );
  static const int _yellowPrimaryValue = 0xFFFFD335;

  static const FluentTintColor yellowTint = FluentTintColor(
    _yellowTintPrimaryValue,
    <int, Color>{
      10: Color(_yellowTintPrimaryValue),
      20: Color(0xFFFEDE78),
      30: Color(0xFFFFEBAB),
      40: Color(0xFFFFF2C8),
    },
  );
  static const int _yellowTintPrimaryValue = 0xFFFFD349;
}
