import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:video_player/video_player.dart';

import 'package:chewie/chewie.dart';

class LmsVideoPlayer extends StatefulWidget {
  final String videourl;
  final String baseurl;

  const LmsVideoPlayer(
      {super.key, required this.baseurl, required this.videourl});

  @override
  State<LmsVideoPlayer> createState() => _LmsVideoPlayerState();
}

class _LmsVideoPlayerState extends State<LmsVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() {
    _videoPlayerController =
        // ignore: deprecated_member_use
        VideoPlayerController.network('${widget.baseurl}/${widget.videourl}')
          ..initialize().then((_) {
            setState(() {
              _chewieController = ChewieController(
                videoPlayerController: _videoPlayerController,
                aspectRatio: _videoPlayerController.value.aspectRatio,
                autoPlay: true,
                looping: true,
              );
            });
          }).catchError((error) {
            // Handle the error here if the video fails to load
            print('Error initializing video player: $error');
          });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(autoapply: true, title: 'Video Player'),
        body: Container(
          height: 250.h,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: _chewieController != null &&
                  _videoPlayerController.value.isInitialized
              ? Chewie(
                  controller: _chewieController!,
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primarybrown,
                  ),
                ),
        ));
  }
}
