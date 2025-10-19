import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_flutter_test_task/features/random_color_background/domain/services/random_color_background_service.dart';
import 'package:solid_flutter_test_task/features/random_color_background/presentation/cubit/color_state.dart';

/// Manages the background color state and history.
///
/// Emits new colors when requested using the injected color service.
/// Maintains a history of the last 10 colors.
class ColorCubit extends Cubit<ColorState> {
  final RandomColorBackgroundService _colorService;
  static const int _maxHistorySize = 10;

  /// Creates a [ColorCubit] with the given color service.
  ///
  /// Starts with a random color and empty history.
  ColorCubit(this._colorService) : super(ColorState.initial()) {
    // Generate initial random color
    _emitWithHistory(_colorService.getRandomColor());
  }

  /// Changes the background color to a new random one.
  void changeColor() {
    final newColor = _colorService.getRandomColor();
    _emitWithHistory(newColor);
  }

  /// Restores a color from history.
  void restoreColorFromHistory(Color color) {
    _emitWithHistory(color);
  }

  /// Emits a color and adds it to history.
  void _emitWithHistory(Color color) {
    List<Color> newHistory = List.from(state.colorHistory);
    newHistory.insert(0, color);

    // Keep only last 10 colors
    if (newHistory.length > _maxHistorySize) {
      newHistory = newHistory.take(_maxHistorySize).toList();
    }

    emit(state.copyWith(currentColor: color, colorHistory: newHistory));
  }

  /// Clears the color history.
  void clearHistory() {
    emit(state.copyWith(colorHistory: []));
  }
}
