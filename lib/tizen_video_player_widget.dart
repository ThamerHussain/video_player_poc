import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// import 'package:video_player_tizen/video_player_tizen.dart';

class TizenVideoPlayerWidget extends StatefulWidget {
  const TizenVideoPlayerWidget({super.key, this.videoUri});

  final String? videoUri;

  @override
  State<TizenVideoPlayerWidget> createState() => _TizenVideoPlayerWidgetState();
}

class _TizenVideoPlayerWidgetState extends State<TizenVideoPlayerWidget> {
  late Future<void> _initializeVideoPlayerFuture;
  late VideoPlayerController _controller;

  // final _key = GlobalKey();

  @override
  void initState() {
    super.initState();

    // BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
    //   BetterPlayerDataSourceType.network,
    //   // "https://mena-jit-cdn-lb--aws--playco--com.vod-cdn.almanasa.tv/JIT/SPA/protech/MRHARLEYY2023MAR/88bb93d2340ceb9b91656647b4f706cf/MRHARLEYY2023MAR.ism/MRHARLEYY2023MAR.mpd",
    //   // "https://dash.akamaized.net/dash264/TestCasesHD/2b/qualcomm/1/MultiResMPEG2.mpd",
    //   // "https://bitmovin-a.akamaihd.net/content/MI201109210084_1/mpds/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.mpd",
    //   // "https://cdn.bitmovin.com/content/assets/sintel/sintel.mpd",
    //   // "https://s3.eu-central-1.amazonaws.com/accurate-player-demo-assets/dash/sintel.mpd",
    //   // "https://dash.akamaized.net/akamai/test/caption_test/ElephantsDream/elephants_dream_480p_heaac5_1.mpd",
    //   // "https://dash.akamaized.net/akamai/test/caption_test/ElephantsDream/elephants_dream_480p_heaac5_1_https.mpd",
    //   // "https://dash.akamaized.net/akamai/test/caption_test/ElephantsDream/ED-CM-5.1-DVD_length_fixed-653s-6-heaac-128000bps_seg.mp4",
    //   "https://d3bqrzf9w11pn3.cloudfront.net/sintel/sintel.mpd",
    //   videoFormat: BetterPlayerVideoFormat.dash,
    //   useAsmsSubtitles: true,
    //   // subtitles: BetterPlayerSubtitlesSource.single(
    //   //   type: BetterPlayerSubtitlesSourceType.memory,
    //   //   url:
    //   //       'https://dash.akamaized.net/akamai/test/caption_test/ElephantsDream/ElephantsDream_en.vtt',
    //   // ),
    // );

    // BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
    //   BetterPlayerDataSourceType.network,
    //   "https://github.com/ThamerHussain/ThamerHussain.github.io/raw/refs/heads/main/xx.mp4",
    // );

    _controller = VideoPlayerController.networkUrl(
      // formatHint: VideoFormat.dash,
      Uri.parse(
          // path:
          //     "https://s3.eu-central-1.amazonaws.com/accurate-player-demo-assets/dash/sintel.mpd"),
              "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
    );

    // _controller.initialize().then((_) => setState(() {}));

    _initializeVideoPlayerFuture = _controller.initialize();
    // _controller.play();
    //   BetterPlayerConfiguration(
    //     fit: BoxFit.fill,
    //     autoDetectFullscreenDeviceOrientation: true,
    //     autoDetectFullscreenAspectRatio: true,
    //     controlsConfiguration: BetterPlayerControlsConfiguration(
    //       enablePip: true,
    //       enableSubtitles: true,
    //       enableQualities: true,
    //       // pipMenuIcon: Icons.wallet,
    //     ),
    //     subtitlesConfiguration: BetterPlayerSubtitlesConfiguration(
    //       fontSize: 14,
    //       bottomPadding: 2,
    //       backgroundColor: Colors.black,
    //       fontColor: Colors.white,
    //       alignment: Alignment.bottomCenter,
    //     ),
    //   ),
    //   betterPlayerDataSource: betterPlayerDataSource,
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      setState(() {});
    });
    return Material(
      child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Stack(
                // alignment: Alignment.center,
                alignment: Alignment.bottomCenter,
                children: [
                  Scaffold(
                    appBar: AppBar(
                      backgroundColor:
                          Theme.of(context).colorScheme.inversePrimary,
                      title: Text('Video Player POC'),
                    ),
                  ),
                  VideoPlayer(_controller),
                  ClosedCaption(text: _controller.value.caption.text),
                  _ControlsOverlay(controller: _controller),
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(
                color: Color(0xffffffff).withValues(alpha: 0.5),
                // color: Color(0xff0C0C0C).withValues(alpha: 0.5),
              ),
            );
          }),
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({required this.controller});

  static const List<Duration> _exampleCaptionOffsets = <Duration>[
    Duration(seconds: -10),
    Duration(seconds: -3),
    Duration(seconds: -1, milliseconds: -500),
    Duration(milliseconds: -250),
    Duration.zero,
    Duration(milliseconds: 250),
    Duration(seconds: 1, milliseconds: 500),
    Duration(seconds: 3),
    Duration(seconds: 10),
  ];
  static const List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : const ColoredBox(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                      semanticLabel: 'Play',
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.topLeft,
          child: PopupMenuButton<Duration>(
            initialValue: controller.value.captionOffset,
            tooltip: 'Caption Offset',
            onSelected: (Duration delay) {
              controller.setCaptionOffset(delay);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<Duration>>[
                for (final Duration offsetDuration in _exampleCaptionOffsets)
                  PopupMenuItem<Duration>(
                    value: offsetDuration,
                    child: Text('${offsetDuration.inMilliseconds}ms'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.captionOffset.inMilliseconds}ms'),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (double speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<double>>[
                for (final double speed in _examplePlaybackRates)
                  PopupMenuItem<double>(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.playbackSpeed}x'),
            ),
          ),
        ),
      ],
    );
  }
}
