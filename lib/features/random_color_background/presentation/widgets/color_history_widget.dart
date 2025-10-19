import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_flutter_test_task/features/random_color_background/presentation/cubit/color_cubit.dart';

/// Widget displaying color history as horizontal scrollable chips.
///
/// Shows up to 10 colors in a horizontal row
class ColorHistoryWidget extends StatelessWidget {
  /// List of colors to display in history.
  final List<Color> colorHistory;

  /// Creates a [ColorHistoryWidget].
  const ColorHistoryWidget({required this.colorHistory, super.key});

  // UI constants
  static const double _containerHeight = 60.0;
  static const double _borderRadius = 30.0;
  static const double _backgroundOpacity = 0.3;
  static const double _chipSize = 44.0;
  static const double _chipBorderWidth = 2.0;
  static const double _chipPadding = 4.0;
  static const double _chipVerticalPadding = 8.0;
  static const double _fontSize = 12.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _containerHeight,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: _backgroundOpacity),
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: colorHistory.asMap().entries.map((entry) {
          final index = entry.key;
          final color = entry.value;

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: _chipPadding,
              vertical: _chipVerticalPadding,
            ),
            child: GestureDetector(
              onTap: () =>
                  context.read<ColorCubit>().restoreColorFromHistory(color),
              child: Container(
                width: _chipSize,
                height: _chipSize,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: _chipBorderWidth,
                  ),
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: _getContrastColor(color),
                      fontWeight: FontWeight.bold,
                      fontSize: _fontSize,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  /// Returns black for light backgrounds and white for dark ones.
  Color _getContrastColor(Color backgroundColor) {
    // Luminance calculation constants
    const double redWeight = 0.299;
    const double greenWeight = 0.587;
    const double blueWeight = 0.114;
    const double maxColorValue = 255.0;
    const double luminanceThreshold = 0.5;

    // Calculate luminance using standard formula
    final luminance =
        (redWeight * (backgroundColor.r * maxColorValue).round() +
            greenWeight * (backgroundColor.g * maxColorValue).round() +
            blueWeight * (backgroundColor.b * maxColorValue).round()) /
        maxColorValue;

    return luminance > luminanceThreshold ? Colors.black : Colors.white;
  }
}
