// import 'dart:ui';
// import 'package:appinio_video_player/appinio_video_player.dart';
// // import 'package:awesome_video_player/awesome_video_player.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:video_player_poc/gen/assets.dart';



// class AppinioVideoPlayerWidget extends StatefulWidget {
//   const AppinioVideoPlayerWidget({super.key, this.videoUri});

//   final String? videoUri;

//   @override
//   State<AppinioVideoPlayerWidget> createState() => _AppinioVideoPlayerWidgetState();
// }

// class _AppinioVideoPlayerWidgetState extends State<AppinioVideoPlayerWidget> {
//   late Future<void> _initializeVideoPlayerFuture;

//   late VideoPlayerController _controller;
//   late CustomVideoPlayerController _customController;

//   @override
//   void initState() {
//     super.initState();

//     _controller = VideoPlayerController.asset(Assets.videos.a4kVideo)
//       ..initialize().then((value) => setState(() {}));
//     _customController = CustomVideoPlayerController(
//         context: context,
//         videoPlayerController: _controller,
//         customVideoPlayerSettings: CustomVideoPlayerSettings(

//         )
//     );

//     _initializeVideoPlayerFuture = _controller.initialize();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: _initializeVideoPlayerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return Stack(
//               children: [
//                 AspectRatio(
//                   //Fixme 16/10
//                   aspectRatio: 16 / 10,
//                   child: AnimatedSwitcher(
//                     duration: Duration(seconds: 1),
//                     child: CustomVideoPlayer(
//                       customVideoPlayerController: _customController,
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           } else {
//             return Center(
//               child: CircularProgressIndicator(
//                 color: Color(0xff0C0C0C).withValues(alpha: 0.5),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
