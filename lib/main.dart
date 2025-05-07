import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player_poc/tizen_video_player_widget.dart';
import 'enhanced_video_player_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.cyanAccent,
            brightness: Brightness.dark,
          ),
        ),
        home: Platform.isAndroid || Platform.isIOS
            ? EnhancedVideoPlayerWidget()
            : TizenVideoPlayerWidget(),
      );
}
