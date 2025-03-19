import 'package:flutter/material.dart';
import 'package:better_player_enhanced/better_player.dart';

class EnhancedVideoPlayerWidget extends StatefulWidget {
  const EnhancedVideoPlayerWidget({super.key, this.videoUri});

  final String? videoUri;

  @override
  State<EnhancedVideoPlayerWidget> createState() =>
      _EnhancedVideoPlayerWidgetState();
}

class _EnhancedVideoPlayerWidgetState extends State<EnhancedVideoPlayerWidget> {
  late BetterPlayerController _controller;

  final _key = GlobalKey();

  @override
  void initState() {
    super.initState();

    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      // "https://mena-jit-cdn-lb--aws--playco--com.vod-cdn.almanasa.tv/JIT/SPA/protech/MRHARLEYY2023MAR/88bb93d2340ceb9b91656647b4f706cf/MRHARLEYY2023MAR.ism/MRHARLEYY2023MAR.mpd",
      // "https://dash.akamaized.net/dash264/TestCasesHD/2b/qualcomm/1/MultiResMPEG2.mpd",
      // "https://bitmovin-a.akamaihd.net/content/MI201109210084_1/mpds/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.mpd",
      // "https://cdn.bitmovin.com/content/assets/sintel/sintel.mpd",
      // "https://s3.eu-central-1.amazonaws.com/accurate-player-demo-assets/dash/sintel.mpd",
      // "https://dash.akamaized.net/akamai/test/caption_test/ElephantsDream/elephants_dream_480p_heaac5_1.mpd",
      // "https://dash.akamaized.net/akamai/test/caption_test/ElephantsDream/elephants_dream_480p_heaac5_1_https.mpd",
      // "https://dash.akamaized.net/akamai/test/caption_test/ElephantsDream/ED-CM-5.1-DVD_length_fixed-653s-6-heaac-128000bps_seg.mp4",
      "https://d3bqrzf9w11pn3.cloudfront.net/sintel/sintel.mpd",
      videoFormat: BetterPlayerVideoFormat.dash,
      useAsmsSubtitles: true,
      // subtitles: BetterPlayerSubtitlesSource.single(
      //   type: BetterPlayerSubtitlesSourceType.memory,
      //   url:
      //       'https://dash.akamaized.net/akamai/test/caption_test/ElephantsDream/ElephantsDream_en.vtt',
      // ),
    );

    // BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
    //   BetterPlayerDataSourceType.network,
    //   "https://github.com/ThamerHussain/ThamerHussain.github.io/raw/refs/heads/main/xx.mp4",
    // );

    _controller = BetterPlayerController(
      BetterPlayerConfiguration(
        fit: BoxFit.fill,
        autoDetectFullscreenDeviceOrientation: true,
        autoDetectFullscreenAspectRatio: true,
        controlsConfiguration: BetterPlayerControlsConfiguration(
          enablePip: true,
          enableSubtitles: true,
          enableQualities: true,
          // pipMenuIcon: Icons.wallet,
        ),
        subtitlesConfiguration: BetterPlayerSubtitlesConfiguration(
          fontSize: 14,
          bottomPadding: 2,
          backgroundColor: Colors.black,
          fontColor: Colors.white,
          alignment: Alignment.bottomCenter,
        ),
      ),
      betterPlayerDataSource: betterPlayerDataSource,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text('Video Player POC'),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await _controller
                    .enablePictureInPicture(_key)
                    ?.then((_) => _controller.exitFullScreen());
              },
              child: Icon(Icons.picture_in_picture_alt),
            ),
          ),
          BetterPlayer(key: _key, controller: _controller),
        ],
      ),
    );
  }
}
