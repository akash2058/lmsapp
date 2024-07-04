import 'package:flutter/material.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubePlayerView extends StatefulWidget {
  final String url;
  const YoutubePlayerView({super.key, required this.url});

  @override
  State<YoutubePlayerView> createState() => _YoutubePlayerViewState();
}

class _YoutubePlayerViewState extends State<YoutubePlayerView> {
  late YoutubePlayerController _controller;
  int _currentPosition = 0;

  @override
  void initState() {
    super.initState();
    _initController();
  }

  void _initController() {
    _controller = YoutubePlayerController.fromVideoId(
      videoId: YoutubePlayerController.convertUrlToId(widget.url) ?? '',
      autoPlay: true,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );

    _controller.listen((value) {
      setState(() {
        _currentPosition = value.playbackRate.toInt();
      });
    });
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_controller.value.playbackRate == 0) {
      _controller.seekTo(seconds: _currentPosition.toDouble());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(autoapply: true, title: 'YouTube Player'),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: Colors.white),
            child: YoutubePlayer(
              controller: _controller,
              aspectRatio: 16 / 9,
            ),
          ),
        ],
      ),
    );
  }
}
