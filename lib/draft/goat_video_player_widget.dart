// import 'package:flutter/material.dart';
// import 'package:flutter_pip_player/pip_controller.dart';
// import 'package:goat_player/goat_player.dart';

// class GoatVideoPlayerWidget extends StatefulWidget {
//   const GoatVideoPlayerWidget({super.key, this.videoUri});

//   final String? videoUri;

//   @override
//   State<GoatVideoPlayerWidget> createState() => _GoatVideoPlayerWidgetState();
// }

// class _GoatVideoPlayerWidgetState extends State<GoatVideoPlayerWidget> {
//   late BetterPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();

//     BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
//       BetterPlayerDataSourceType.network,
//       "https://github.com/ThamerHussain/ThamerHussain.github.io/raw/refs/heads/main/xx.mp4"
//     );

//     _controller = BetterPlayerController(
//       BetterPlayerConfiguration(fit: BoxFit.fill),
//       betterPlayerDataSource: betterPlayerDataSource,
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           AspectRatio(
//             aspectRatio: 16 / 10,
//             child: AnimatedSwitcher(
//               duration: Duration(seconds: 1),
//               child: BetterPlayer(
//                 controller: _controller,
//               ),
//             ),
//           ),
//         ],
//       )
//     );
//   }
// }
