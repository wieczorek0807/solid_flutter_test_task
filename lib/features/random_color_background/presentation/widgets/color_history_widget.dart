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
  const ColorHistoryWidget({
    required this.colorHistory,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: colorHistory.asMap().entries.map((entry) {
          final index = entry.key;
          final color = entry.value;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            child: GestureDetector(
              onTap: () => context
                  .read<ColorCubit>()
                  .restoreColorFromHistory(color),
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: _getContrastColor(color),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
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
    // Calculate luminance using standard formula
    final luminance =
        (0.299 * (backgroundColor.r * 255.0).round() +
            0.587 * (backgroundColor.g * 255.0).round() +
            0.114 * (backgroundColor.b * 255.0).round()) /
        255;

    return luminance > 0.5 ? Colors.black : Colors.white;
  }
}
