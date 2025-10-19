import 'package:flutter/material.dart';

/// State class for color management.
class ColorState {
  /// Current background color.
  final Color currentColor;

  /// List of color history (max 10 colors).
  final List<Color> colorHistory;

  /// Creates a [ColorState].
  const ColorState({required this.currentColor, required this.colorHistory});

  /// Creates initial state with white background.
  factory ColorState.initial() {
    return const ColorState(currentColor: Colors.white, colorHistory: []);
  }

  /// Creates a copy with updated values.
  ColorState copyWith({Color? currentColor, List<Color>? colorHistory}) {
    return ColorState(
      currentColor: currentColor ?? this.currentColor,
      colorHistory: colorHistory ?? this.colorHistory,
    );
  }
}
