import 'package:flutter_test/flutter_test.dart';
import 'package:my_exoplayer/my_exoplayer.dart';
import 'package:my_exoplayer/my_exoplayer_platform_interface.dart';
import 'package:my_exoplayer/my_exoplayer_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMyExoplayerPlatform
    with MockPlatformInterfaceMixin
    implements MyExoplayerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MyExoplayerPlatform initialPlatform = MyExoplayerPlatform.instance;

  test('$MethodChannelMyExoplayer is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMyExoplayer>());
  });

  test('getPlatformVersion', () async {
    MyExoplayer myExoplayerPlugin = MyExoplayer();
    MockMyExoplayerPlatform fakePlatform = MockMyExoplayerPlatform();
    MyExoplayerPlatform.instance = fakePlatform;

    expect(await myExoplayerPlugin.getPlatformVersion(), '42');
  });
}
