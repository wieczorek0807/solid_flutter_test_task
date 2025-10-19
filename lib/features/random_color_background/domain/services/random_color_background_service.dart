import 'package:flutter/material.dart';
import 'package:solid_flutter_test_task/features/random_color_background/utils/color_generator_utils.dart';

/// Service responsible for handling random background colors.
/// 
/// Contains logic for generating and managing random background colors.
class RandomColorBackgroundService {
  /// Generates a random color.
  /// 
  /// Returns a [Color] with random color.
  Color getRandomColor() {
    return ColorGeneratorUtils.generateRandomColor();
  }
}
