
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/cubit/music_cubit.dart';
import 'package:test_bloc/cubit/music_state.dart';
import 'package:test_bloc/data/music_data.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({
    super.key,
  });

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller =
        AnimationController(duration: const Duration(seconds: 30), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.repeat();

    player.onPlayerStateChanged.listen(
      (it) {
        switch (it) {
          case PlayerState.stopped:
            break;
          case PlayerState.completed:
            context
                .read<MusicCubit>()
                .nextMusic(player)
                .then((value) => getMaxDuration());
            break;
          default:
            break;
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  build(BuildContext context) {
    final MusicCubit musicCubit = context.read<MusicCubit>();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: BlocBuilder<MusicCubit, MusicState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RotationTransition(
                    turns: animation,
                    child: Container(
                      width: 260,
                      height: 260,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(130),
                          image: DecorationImage(
                              image: NetworkImage(
                                  musics[musicCubit.state.currentMusic].image),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                musics[musicCubit.state.currentMusic].name,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                musics[musicCubit.state.currentMusic].author,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white.withOpacity(0.6),
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder(
                stream: player.onPositionChanged,
                builder: (context, snapshot) {
                  return ProgressBar(
                    timeLabelTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    thumbColor: Colors.white,
                    progressBarColor: Colors.white,
                    baseBarColor: Colors.grey,
                    progress: snapshot.data ?? const Duration(seconds: 0),
                    total: maxDuration,
                    onSeek: (duration) {
                      player.seek(duration);
                      setState(() {});
                    },
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () async {
                        await musicCubit.backMusic(player);
                        getMaxDuration();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.skip_previous,
                          color: Colors.blue,
                          size: 25,
                        ),
                      )),
                  GestureDetector(
                      onTap: () async {
                        await musicCubit.playAndStopMusic(player);
                        getMaxDuration();
                      },
                      child: Container(
                          alignment: Alignment.center,
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Icon(
                            musicCubit.state.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: Colors.blue,
                            size: 40,
                          ))),
                  GestureDetector(
                      onTap: () async {
                        await musicCubit.nextMusic(player);
                        getMaxDuration();
                      },
                      child: Container(
                          alignment: Alignment.center,
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.skip_next,
                            color: Colors.blue,
                            size: 25,
                          ))),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
