// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_pip_player/models/pip_settings.dart';
// import 'package:flutter_pip_player/pip_controller.dart';
// import 'package:flutter_pip_player/pip_player.dart';
// import 'package:river_player/river_player.dart';
//
// class RiverVideoPlayerWidget extends StatefulHookWidget {
//   const RiverVideoPlayerWidget({super.key, this.videoUri});
//
//   final String? videoUri;
//
//   @override
//   State<RiverVideoPlayerWidget> createState() => _RiverVideoPlayerWidgetState();
// }
//
// class _RiverVideoPlayerWidgetState extends State<RiverVideoPlayerWidget> {
//   late BetterPlayerController _controller;
//
//   final _key = GlobalKey();
//
//   @override
//   void initState() {
//     super.initState();
//
//     BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
//       BetterPlayerDataSourceType.network,
//       "https://github.com/ThamerHussain/ThamerHussain.github.io/raw/refs/heads/main/xx.mp4",
//     );
//
//     _controller = BetterPlayerController(
//       BetterPlayerConfiguration(
//         fit: BoxFit.fill,
//         autoDetectFullscreenDeviceOrientation: true,
//         autoDetectFullscreenAspectRatio: true,
//         controlsConfiguration: BetterPlayerControlsConfiguration(
//           enablePip: true,
//         ),
//       ),
//       betterPlayerDataSource: betterPlayerDataSource,
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // final ValueNotifier<Widget?> _widget = useState(null);
//     // WidgetsBinding.instance.addPostFrameCallback(
//     //   (_) => _widget.value = _key.currentWidget,
//     // );
//     final PipController _pipController = PipController(
//         settings: PipSettings(
//         ),
//         title: 'My Video');
//     Widget betterPlayer = BetterPlayer(key: _key, controller: _controller);
//     return Scaffold(
//       body: Stack(
//         // fit: StackFit.expand,
//         children: [
//           Column(
//             children: [
//               Expanded(
//                 child: AspectRatio(
//                   aspectRatio: 16 / 10,
//                   child: AnimatedSwitcher(
//                     duration: Duration(seconds: 1),
//                     child: betterPlayer,
//                   ),
//                 ),
//               ),
//               FilledButton(
//                 onPressed: () => _controller.enablePictureInPicture(_key),
//                 child: Text('Enter PIP'),
//               ),
//             ],
//           ),
//           PipPlayer(
//             controller: _pipController,
//             content: betterPlayer,
//             isPlaying: _controller.isPlaying() ?? false,
//             onPlayPause: () => setState(() => _controller.pause()),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _pipController.toggleVisibility(),
//         child: Icon(Icons.picture_in_picture_alt),
//       ),
//     );
//   }
// }
