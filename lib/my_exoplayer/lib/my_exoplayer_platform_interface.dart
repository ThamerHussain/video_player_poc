import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'my_exoplayer_method_channel.dart';

abstract class MyExoplayerPlatform extends PlatformInterface {
  /// Constructs a MyExoplayerPlatform.
  MyExoplayerPlatform() : super(token: _token);

  static final Object _token = Object();

  static MyExoplayerPlatform _instance = MethodChannelMyExoplayer();

  /// The default instance of [MyExoplayerPlatform] to use.
  ///
  /// Defaults to [MethodChannelMyExoplayer].
  static MyExoplayerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MyExoplayerPlatform] when
  /// they register themselves.
  static set instance(MyExoplayerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
