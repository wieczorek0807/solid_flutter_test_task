import 'dart:math';
import 'package:flutter/material.dart';

/// Utility class for generating random RGB colors.
/// 
/// Provides methods to create random colors.
class ColorGeneratorUtils {
  static final Random _random = Random();

  /// Generates a random color.
  static Color generateRandomColor() {
    return Color.fromARGB(
      255,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
  }
}
