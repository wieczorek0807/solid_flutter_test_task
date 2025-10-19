import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_flutter_test_task/features/random_color_background/services/random_color_background_service.dart';

/// Manages the background color state.
/// 
/// Emits new colors when requested using the injected color service.
class ColorCubit extends Cubit<Color> {
  /// Creates a [ColorCubit] with the given color service.
  /// 
  /// Starts with a white background.
  ColorCubit(this._colorService) : super(Colors.white);

  final RandomColorBackgroundService _colorService;

  /// Changes the background color to a new random one.
  void changeColor() {
    final newColor = _colorService.getRandomColor();
    emit(newColor);
  }
}
