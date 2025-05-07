// import 'package:flutter/material.dart';
// import 'package:video_player_poc/my_exoplayer/lib/my_exoplayer.dart';
//
// class VideoPlayerScreen extends StatefulWidget {
//   const VideoPlayerScreen({super.key});
//
//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }
//
// class _VideoPlayerScreenState extends State {
//   final ExoPlayerView _playerView = ExoPlayerView(
//     initialUrl: 'https://example.com/sample.mp4',
//     autoPlay: true,
//     onPlayerReady: (ready) {
//       debugPrint('Player is ready: $ready');
//     },
//     onPositionChanged: (position) {
//       debugPrint('Position: ${position.inSeconds}s');
//     },
//     onCompleted: () {
//       debugPrint('Playback completed');
//     },
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ExoPlayer Example'),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 300,
//             child: _playerView,
//           ),
//           OverflowBar(
//             children: [
//               ElevatedButton(
//                 onPressed: () => _playerView.play(),
//                 child: Icon(Icons.play_arrow),
//               ),
//               ElevatedButton(
//                 onPressed: () => _playerView.pause(),
//                 child: Icon(Icons.pause),
//               ),
//               ElevatedButton(
//                 onPressed: () => _playerView.seekTo(Duration(seconds: 30)),
//                 child: Text('Jump to 30s'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }