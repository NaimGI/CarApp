import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VedioYout extends StatefulWidget {
  const VedioYout(this.url);
  final String url;
  @override
  State<VedioYout> createState() => _VedioYoutState();
}

class _VedioYoutState extends State<VedioYout> {
  VideoPlayerController? _controller;

  late YoutubePlayerController _youtubcontroller;
  var videoId = '';
  @override
  void initState() {
    setState(() {
      videoId = YoutubePlayer.convertUrlToId(widget.url)!;
    });
    _initYouVideo(widget.url);

    super.initState();
  }

  _initYouVideo(url) {
    _controller = VideoPlayerController.network(url);
    _youtubcontroller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        hideThumbnail: true,
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 380,
      child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _youtubcontroller,
            onReady: () => debugPrint("Ready"),
            bottomActions: [
              CurrentPosition(),
            ],
          ),
          builder: (context, player) {
            return player;
          }),
    );
  }
}
