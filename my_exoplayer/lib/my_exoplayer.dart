import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'my_exoplayer_platform_interface.dart';

class MyExoplayer {
  static const MethodChannel _channel = MethodChannel('my_exoplayer');

  static Future getPlatformVersion() async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}

class ExoPlayerView extends StatefulWidget {
  final String? initialUrl;
  final bool autoPlay;
  final bool showControls;
  final BoxFit fit;
  final Function(bool)? onPlayerReady;
  final Function(Duration)? onPositionChanged;
  final Function()? onCompleted;

  const ExoPlayerView({
    super.key,
    this.initialUrl,
    this.autoPlay = false,
    this.showControls = true,
    this.fit = BoxFit.contain,
    this.onPlayerReady,
    this.onPositionChanged,
    this.onCompleted,
  });

  @override
  State<ExoPlayerView> createState() => ExoPlayerViewState();
}

class ExoPlayerViewState extends State<ExoPlayerView> {
  late final int _viewId;
  MethodChannel? _channel;
  Timer? _positionTimer;

  @override
  void initState() {
    super.initState();
    _viewId = hashCode;

    // Start position update timer if needed
    if (widget.onPositionChanged != null) {
      _positionTimer = Timer.periodic(const Duration(milliseconds: 500), (_) {
        _getCurrentPosition();
      });
    }
  }

  Future _getCurrentPosition() async {
    if (_channel == null) return;

    try {
      final position = await _channel!.invokeMethod('getCurrentPosition');
      if (position != null && widget.onPositionChanged != null) {
        widget.onPositionChanged!(Duration(milliseconds: position));
      }

      // Check if playback completed
      final duration = await _channel!.invokeMethod('getDuration');
      final isPlaying = await _channel!.invokeMethod('isPlaying');

      if (duration != null && position != null &&
          duration > 0 && position >= duration - 500 &&
          isPlaying == false && widget.onCompleted != null) {
        widget.onCompleted!();
      }
    } catch (e) {
      debugPrint('Error getting position: $e');
    }
  }

  @override
  void dispose() {
    _positionTimer?.cancel();
    _channel = null;
    super.dispose();
  }

  // Player control methods
  Future loadUrl(String url) async {
    await _channel?.invokeMethod('loadUrl', {'url': url});
  }

  Future play() async {
    await _channel?.invokeMethod('play');
  }

  Future pause() async {
    await _channel?.invokeMethod('pause');
  }

  Future seekTo(Duration position) async {
    await _channel?.invokeMethod(
        'seekTo',
        {'position': position.inMilliseconds}
    );
  }

  Future setVolume(double volume) async {
    await _channel?.invokeMethod('setVolume', {'volume': volume});
  }

  Future getDuration() async {
    final duration = await _channel?.invokeMethod('getDuration');
    return duration != null ? Duration(milliseconds: duration) : null;
  }

  @override
  Widget build(BuildContext context) {
    // Create the native view
    return AspectRatio(
      aspectRatio: 16 / 9, // Default aspect ratio
      child: AndroidView(
        viewType: 'my_exoplayer_view',
        onPlatformViewCreated: _onPlatformViewCreated,
        creationParams: {'url': widget.initialUrl},
        creationParamsCodec: const StandardMessageCodec(),
      ),
    );
  }

  void _onPlatformViewCreated(int id) {
    _channel = MethodChannel('my_exoplayer_$id');

    if (widget.initialUrl != null && widget.autoPlay) {
      play();
    }

    if (widget.onPlayerReady != null) {
      widget.onPlayerReady!(true);
    }
  }
}