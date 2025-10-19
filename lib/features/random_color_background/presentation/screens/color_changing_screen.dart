import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_flutter_test_task/features/random_color_background/presentation/cubit/color_cubit.dart';

/// Screen showing "Hello there" and changing background color on tap.
///
/// Uses [ColorCubit] to update colors and [GestureDetector] for taps.
class ColorChangingScreen extends StatelessWidget {
  /// Creates a [ColorChangingScreen].
  const ColorChangingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorCubit, Color>(
      builder: (context, backgroundColor) {
        return GestureDetector(
          onTap: () => context.read<ColorCubit>().changeColor(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            color: backgroundColor,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: _getContrastColor(backgroundColor),
                  ),
                  child: const Text('Hello there'),
                ),
              ),
            ),
          ),
        );
      },
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
