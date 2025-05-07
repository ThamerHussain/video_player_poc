import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'my_exoplayer_platform_interface.dart';

/// An implementation of [MyExoplayerPlatform] that uses method channels.
class MethodChannelMyExoplayer extends MyExoplayerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('my_exoplayer');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
