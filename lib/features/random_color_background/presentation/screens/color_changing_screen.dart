import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_flutter_test_task/features/random_color_background/presentation/cubit/color_cubit.dart';
import 'package:solid_flutter_test_task/features/random_color_background/presentation/cubit/color_state.dart';
import 'package:solid_flutter_test_task/features/random_color_background/presentation/widgets/color_history_widget.dart';

/// Screen showing "Hello there" and changing background color on tap.
///
/// Uses [ColorCubit] to update colors and [GestureDetector] for taps.
class ColorChangingScreen extends StatelessWidget {
  /// Creates a [ColorChangingScreen].
  const ColorChangingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorCubit, ColorState>(
      builder: (context, colorState) {
        return GestureDetector(
          onTap: () => context.read<ColorCubit>().changeColor(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            color: colorState.currentColor,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  // Main content
                  Center(
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: _getContrastColor(colorState.currentColor),
                      ),
                      child: const Text('Hello there'),
                    ),
                  ),

                  // Color history
                  if (colorState.colorHistory.isNotEmpty)
                    Positioned(
                      bottom: 20,
                      left: 20,
                      right: 20,
                      child: ColorHistoryWidget(
                        colorHistory: colorState.colorHistory,
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
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

    // Calculate luminance
    final luminance =
        (redWeight * (backgroundColor.r * maxColorValue).round() +
            greenWeight * (backgroundColor.g * maxColorValue).round() +
            blueWeight * (backgroundColor.b * maxColorValue).round()) /
        maxColorValue;

    return luminance > luminanceThreshold ? Colors.black : Colors.white;
  }
}
