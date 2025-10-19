import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:solid_flutter_test_task/features/random_color_background/domain/services/random_color_background_service.dart';
import 'package:solid_flutter_test_task/features/random_color_background/presentation/cubit/color_cubit.dart';
import 'package:solid_flutter_test_task/features/random_color_background/presentation/screens/color_changing_screen.dart';

void main() {
  runApp(const MyApp());
}

/// Main application widget.
///
/// Provides the ColorCubit to the widget tree and sets up the app.
class MyApp extends StatelessWidget {
  /// Creates a [MyApp].
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ColorCubit(RandomColorBackgroundService()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Random Color Background',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const ColorChangingScreen(),
      ),
    );
  }
}
