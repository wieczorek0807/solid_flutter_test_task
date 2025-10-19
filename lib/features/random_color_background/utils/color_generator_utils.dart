import 'dart:math';
import 'package:flutter/material.dart';

/// Utility class for generating random RGB colors.
///
/// Provides methods to create random colors.
class ColorGeneratorUtils {
  static final Random _random = Random();

  // Color generation constants
  static const int _alphaChannel = 255;
  static const int _maxColorValue = 256;

  /// Generates a random color.
  static Color generateRandomColor() {
    return Color.fromARGB(
      _alphaChannel,
      _random.nextInt(_maxColorValue),
      _random.nextInt(_maxColorValue),
      _random.nextInt(_maxColorValue),
    );
  }
}
