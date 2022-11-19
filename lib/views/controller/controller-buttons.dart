import 'package:flutter/material.dart';

import 'page_manager.dart';
import '../../services/audio-service/service_locator.dart';
import '../../services/notifiers/play_button_notifier.dart';
import '../../services/notifiers/repeat_button_notifier.dart';

class AudioControlButtons extends StatelessWidget {
  const AudioControlButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          RepeatButton(),
          PreviousSongButton(),
          PlayButton(),
          NextSongButton(),
          ShuffleButton(),
        ],
      ),
    );
  }
}

class RepeatButton extends StatelessWidget {
  const RepeatButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<RepeatState>(
      valueListenable: pageManager.repeatButtonNotifier,
      builder: (context, value, child) {
        Icon icon;
        switch (value) {
          case RepeatState.off:
            icon = const Icon(
              Icons.repeat,
              color: Colors.white70,
              size: 18,
            );
            break;
          case RepeatState.repeatSong:
            icon = const Icon(
              Icons.repeat_one,
              color: Colors.white,
              size: 18,
            );
            break;
          case RepeatState.repeatPlaylist:
            icon = const Icon(
              Icons.repeat,
              color: Colors.white,
              size: 18,
            );
            break;
        }
        return IconButton(
          icon: icon,
          onPressed: pageManager.repeat,
        );
      },
    );
  }
}

class PreviousSongButton extends StatelessWidget {
  const PreviousSongButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<bool>(
      valueListenable: pageManager.isFirstSongNotifier,
      builder: (_, isFirst, __) {
        return IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: Colors.white,
          ),
          onPressed: (isFirst) ? null : pageManager.previous,
        );
      },
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<ButtonState>(
      valueListenable: pageManager.playButtonNotifier,
      builder: (_, value, __) {
        switch (value) {
          case ButtonState.loading:
            return IconButton(
              icon: const Icon(
                Icons.play_arrow,
                size: 35,
                color: Colors.white54,
              ),
              onPressed: pageManager.wait,
            );
          case ButtonState.paused:
            return IconButton(
              icon: const Icon(
                Icons.play_arrow,
                size: 35,
                color: Colors.white,
              ),
              onPressed: pageManager.play,
            );
          case ButtonState.playing:
            return IconButton(
              icon: const Icon(
                Icons.pause,
                size: 35,
                color: Colors.white,
              ),
              onPressed: pageManager.pause,
            );
        }
      },
    );
  }
}

class NextSongButton extends StatelessWidget {
  const NextSongButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<bool>(
      valueListenable: pageManager.isLastSongNotifier,
      builder: (_, isLast, __) {
        return IconButton(
          icon: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 18,
          ),
          onPressed: (isLast) ? null : pageManager.next,
        );
      },
    );
  }
}

class ShuffleButton extends StatelessWidget {
  const ShuffleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<bool>(
      valueListenable: pageManager.isShuffleModeEnabledNotifier,
      builder: (context, isEnabled, child) {
        return IconButton(
          icon: (isEnabled)
              ? const Icon(
                  Icons.shuffle,
                  size: 18,
                  color: Colors.white70,
                )
              : const Icon(
                  Icons.shuffle,
                  color: Colors.grey,
                  size: 18,
                ),
          onPressed: pageManager.shuffle,
        );
      },
    );
  }
}

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<bool>(
      valueListenable: pageManager.isShuffleModeEnabledNotifier,
      builder: (context, isEnabled, child) {
        return IconButton(
          icon: (isEnabled)
              ? const Icon(
                  Icons.favorite_outline_rounded,
                  size: 18,
                  color: Colors.white70,
                )
              : const Icon(Icons.favorite_rounded,
                  color: Colors.purpleAccent, size: 18),
          onPressed: pageManager.shuffle,
        );
      },
    );
  }
}
