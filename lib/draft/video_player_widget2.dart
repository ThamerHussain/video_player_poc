// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:video_player_poc/animated_dialog.dart';
// import 'package:video_player_poc/gen/assets.dart';
//
//
//
// class VideoPlayerWidget extends StatefulWidget {
//   const VideoPlayerWidget({super.key, this.videoUri});
//
//   final String? videoUri;
//
//   @override
//   State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
// }
//
// class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
//   // late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;
//
//   late BetterPlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//
//        // saveAssetVideoToFile();
//     BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
//       BetterPlayerDataSourceType.file,
//       Assets.videos.a4kVideo,
//     );
//
//     _controller = BetterPlayerController(
//       BetterPlayerConfiguration(fit: BoxFit.fill),
//       betterPlayerDataSource: betterPlayerDataSource,
//     );
//
//     // // _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUri));
//     // _controller = VideoPlayerController.asset(Assets.videos.a4kVideo);
//     //
//     // _initializeVideoPlayerFuture = _controller.isVideoInitialized();
//     //
//     // // Todo: delete if looping isn't needed
//     // _controller.setLooping(true);
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
//     bool isPlaying = _controller.isPlaying() ?? false;
//     // bool isPlaying = _controller.isPlaying() ?? false;
//     // bool isPlaying = _controller.value.isPlaying;
//     return Scaffold(
//       body: FutureBuilder(
//         future: _initializeVideoPlayerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return Stack(
//               // alignment: Alignment.center,
//               children: [
//                 AspectRatio(
//                   //Fixme 16/10
//                   aspectRatio: 16 / 10,
//                   // aspectRatio: _controller.value.aspectRatio * 1.11,
//                   child: AnimatedSwitcher(
//                     duration: Duration(seconds: 1),
//                     child: BetterPlayer(
//                       controller: _controller,
//                     ),
//                   ),
//                   // child: VideoPlayer(_controller),
//                 ),
//                 // AnimatedOpacity(
//                 //   duration: const Duration(milliseconds: 500),
//                 //   opacity: isPlaying ? 0 : 1,
//                 //   child: InkWell(
//                 //     onTap:
//                 //         isPlaying
//                 //             ? () {
//                 //               _controller.pause();
//                 //               setState(() {});
//                 //             }
//                 //             : null,
//                 //     child: BackdropFilter(
//                 //       filter: ImageFilter.blur(sigmaX: 1.3, sigmaY: 1.3),
//                 //       child: Container(),
//                 //     ),
//                 //   ),
//                 // ),
//                 // AnimatedOpacity(
//                 //   duration: const Duration(milliseconds: 500),
//                 //   opacity: isPlaying ? 0 : 1,
//                 //   child: InkWell(
//                 //     onTap:
//                 //         () => setState(() {
//                 //           if (_controller.value.isPlaying) {
//                 //             _controller.pause();
//                 //           } else {
//                 //             _controller.play();
//                 //           }
//                 //         }),
//                 //     child: Container(
//                 //       width: 66.67,
//                 //       height: 66.67,
//                 //       decoration: BoxDecoration(
//                 //         color: Color(0xff0C0C0C).withValues(alpha: 0.5),
//                 //         borderRadius: BorderRadius.circular(66.67 / 2),
//                 //       ),
//                 //       child: Padding(
//                 //         padding: EdgeInsets.only(
//                 //           top: (10 * 2),
//                 //           right: (10 * 2),
//                 //           bottom: (10 * 2),
//                 //           left: (10 * 2) + (4 * 0.8325),
//                 //         ),
//                 //         child:
//                 //             _controller.value.isPlaying
//                 //                 // _controller.value.isPlaying
//                 //                 ? Assets.images.svg.pause.svg(
//                 //                   colorFilter: ColorFilter.mode(
//                 //                     Colors.white,
//                 //                     BlendMode.srcIn,
//                 //                   ),
//                 //                 )
//                 //                 : Assets.images.svg.play.svg(),
//                 //       ),
//                 //     ),
//                 //   ),
//                 // ),
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
