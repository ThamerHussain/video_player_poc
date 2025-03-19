// import 'package:better_player_enhanced/better_player.dart';
// import 'package:flutter/material.dart';
//
// class EnhancedVideoPlayerWidget extends StatefulWidget {
//   const EnhancedVideoPlayerWidget({super.key, this.videoUri});
//
//   final String? videoUri;
//
//   @override
//   State<EnhancedVideoPlayerWidget> createState() => _EnhancedVideoPlayerWidgetState();
// }
//
// class _EnhancedVideoPlayerWidgetState extends State<EnhancedVideoPlayerWidget> {
//   late BetterPlayerController _controller;
//
//   final _key = GlobalKey();
//   @override
//   void initState() {
//     super.initState();
//
//     BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
//         BetterPlayerDataSourceType.network,
//         "https://github.com/ThamerHussain/ThamerHussain.github.io/raw/refs/heads/main/xx.mp4"
//     );
//
//     _controller = BetterPlayerController(
//       BetterPlayerConfiguration(fit: BoxFit.fill, controlsConfiguration: BetterPlayerControlsConfiguration(
//           enablePip: true
//       )),
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
//     return Scaffold(
//         body: Stack(
//           children: [
//             Column(
//               children: [
//                 AspectRatio(
//                   aspectRatio: 16 / 10,
//                   child: AnimatedSwitcher(
//                     duration: Duration(seconds: 1),
//                     child: BetterPlayer(
//                       key: _key,
//                       controller: _controller,
//                     ),
//                   ),
//                 ),
//                 FilledButton(
//                   onPressed:
//                       () => _controller.enablePictureInPicture(_key),
//                   child: Text('Enter PIP'),
//                 ),
//               ],
//             ),
//           ],
//         )
//     );
//   }
// }
