import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';

import 'page_manager.dart';
import '../../services/audio-service/service_locator.dart';
import '../../services/notifiers/progress_notifier.dart';

class AudioProgressBar extends StatelessWidget {
  const AudioProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<ProgressBarState>(
      valueListenable: pageManager.progressNotifier,
      builder: (_, value, __) {
        return ProgressBar(
          progress: value.current,
          buffered: value.buffered,
          total: value.total,
          onSeek: pageManager.seek,
          timeLabelLocation: TimeLabelLocation.sides,
          timeLabelTextStyle: const TextStyle(color: Colors.white),
          timeLabelPadding: 5,
          thumbGlowColor: Colors.white54,
          thumbGlowRadius: 5,
          thumbRadius: 2.2,
          thumbColor: Colors.white,
          baseBarColor: Colors.grey,
          barHeight: 3,
          bufferedBarColor: Colors.white60,
          progressBarColor: Colors.white,
        );
      },
    );
  }
}
