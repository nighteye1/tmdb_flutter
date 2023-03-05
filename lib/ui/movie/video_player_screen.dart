import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmdb_app/ui/components/poppins_style.dart';
import 'package:tmdb_app/utils/app_colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  final String videoId;
  const VideoPlayerScreen({
    super.key,
    required this.videoUrl,
    required this.videoId,
  });

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: widget.videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
        ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    AutoOrientation.landscapeAutoMode();
    _controller.addListener(() {
      if (_controller.value.playerState == PlayerState.ended) {
        if (mounted) {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeRight,
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.portraitDown,
            DeviceOrientation.portraitUp,
          ]);
          AutoOrientation.fullAutoMode();
          Navigator.of(context).pop();
        }
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YoutubePlayer(
        controller: _controller,
        topActions: [
          GestureDetector(
            onTap: () {
              _controller.pause();
              if (mounted) {
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.landscapeRight,
                  DeviceOrientation.landscapeLeft,
                  DeviceOrientation.portraitDown,
                  DeviceOrientation.portraitUp,
                ]);
                AutoOrientation.fullAutoMode();
                Navigator.of(context).pop();
              }
            },
            child: Container(
              width: 100.w,
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.skyBlue,
              ),
              padding: const EdgeInsets.all(10),
              child: FittedBox(
                child: Text(
                  'Done',
                  style: poppinsStyle(
                    fSize: 18.sp,
                    fColor: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
