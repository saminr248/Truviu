import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:truviu_bvp/video_player_final/colors.dart';
import 'package:truviu_bvp/video_player_final/column_social_icon.dart';
import 'package:truviu_bvp/video_player_final/data_json.dart';
import 'package:truviu_bvp/video_player_final/left_panel.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'my_progress_bar.dart';

class Video extends StatefulWidget {
  const Video({Key? key}) : super(key: key);

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: courses.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size*0.9;

    return PageView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return VideoPlayerItem(
            videoUrl: courses[index]['videoUrl'],
            size: size,
            name: courses[index]['name'],
            caption: courses[index]['caption'],
            profileImg: courses[index]['profileImg'],
          );
        });
  }
}

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;
  final String name;
  final String caption;
  final String profileImg;
  VideoPlayerItem(
      {Key? key,
        required this.size,
        required this.name,
        required this.caption,
        required this.profileImg,
        required this.videoUrl})
      : super(key: key);

  final Size size;

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController _controller;
  bool playerReady = false;
  Widget _playView(BuildContext context) {
    final controller = _controller;
    if (controller.value.isInitialized) {
      return VideoPlayer(controller);
    } else {
      return const Center(
        child: Text(
          "Loading...",
          style: TextStyle(fontSize: 20, color: Colors.white60),
        ),
      );
    }
  }

  bool ready = true;
  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(widget.videoUrl);
    _controller.setLooping(true);
    initialize();
  }

  void initialize() async {
    await _controller.initialize();
    _controller.play();
    setState(() {});
  }

  @override
  void dispose() {
    if (_controller.value.isPlaying) _controller.pause();
    _controller.dispose();

    super.dispose();
  }

  Widget isPlaying() {
    return _controller.value.isPlaying || !_controller.value.isInitialized
        ? SizedBox()
        : Icon(
      Icons.play_arrow,
      size: 80,
      color: white.withOpacity(0.5),
    );
  }

  String convertTwo(int value) {
    return value < 10 ? "0$value" : "$value";
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _controller.value.isPlaying
              ? _controller.pause()
              : _controller.play();
        });
      },
      child: SwipeDetector(
        onSwipeUp: (offset) {
          Fluttertoast.showToast(
              msg: "Swipe left and right",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              textColor: Colors.white,
              fontSize: 16.0);
        },
        onSwipeDown: (offset) {
          Navigator.pop(context);
        },
        child: SizedBox(
            height: widget.size.height,
            width: widget.size.width,
            child: Stack(
              children: <Widget>[
                Container(
                  height: widget.size.height,
                  width: widget.size.width,
                  decoration: BoxDecoration(color: black),
                  child: Stack(
                    children: <Widget>[
                      VisibilityDetector(
                          key: Key("unique key"),
                          onVisibilityChanged: (VisibilityInfo info) {
                            debugPrint(
                                "${info.visibleFraction} of my widget is visible");
                            if (info.visibleFraction == 0) {
                              _controller.pause();
                            } else {
                              _controller.play();
                            }
                          },
                          child: _playView(context)),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(),
                          child: isPlaying(),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: SizedBox(
                    height: widget.size.height,
                    width: widget.size.width,
                    child: Padding(
                      padding:
                      const EdgeInsets.only(left: 15, top: 20, bottom: 10),
                      child: SafeArea(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                                child: Row(
                                  children: <Widget>[
                                    LeftPanel(
                                      size: widget.size,
                                      name: "${widget.name}",
                                      caption: "${widget.caption}",
                                    ),
                                    // RightPanel(
                                    //   size: widget.size,
                                    //   profileImg: "${widget.profileImg}",
                                    // ),
                                  ],
                                )),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: MyVideoProgressIndicator(
                                _controller,
                                allowScrubbing: true,
                                colors: VideoProgressColors(
                                    playedColor: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Positioned(
                //     top: widget.size.height * 0.025,
                //     child: SizedBox(
                //         // height: widget.size.height * 0.79,
                //         height: widget.size.height,
                //         width: widget.size.width,
                //         child: GestureDetector(onPanUpdate: (details) {
                //           if (details.delta.dy > 0) {
                //             print("Dragging in +Y direction");
                //           } else {
                //             print("Dragging in -Y direction");
                //           }
                //         }, onVerticalDragUpdate: (details) {
                //           int sensitivity = 8;
                //           if (ready) {
                //             if (details.delta.dy > sensitivity) {
                //               Fluttertoast.showToast(
                //                   msg: "Swipe left and right",
                //                   toastLength: Toast.LENGTH_SHORT,
                //                   gravity: ToastGravity.TOP,
                //                   timeInSecForIosWeb: 1,
                //                   textColor: Colors.white,
                //                   fontSize: 16.0);
                //               ready = false;
                //               setState(() {});
                //               // Down Swipe
                //             } else if (details.delta.dy < -sensitivity) {
                //               Navigator.pop(context);
                //               // Up Swipe
                //             }
                //           }
                //         }, onVerticalDragEnd: (details) {
                //           ready = true;
                //           setState(() {});
                //         })))
              ],
            )),
      ),
    );
  }
}

class RightPanel extends StatelessWidget {
  final String profileImg;
  const RightPanel({
    Key? key,
    required this.size,
    required this.profileImg,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: size.height,
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.125,
            ),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    getProfile(img: profileImg),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class MyVideoProgressIndicator extends StatefulWidget {
  const MyVideoProgressIndicator(
      this.controller, {
        Key? key,
        this.colors = const VideoProgressColors(),
        required this.allowScrubbing,
        this.padding = const EdgeInsets.only(top: 5.0),
      }) : super(key: key);

  final VideoPlayerController controller;

  final VideoProgressColors colors;

  final bool allowScrubbing;
  final EdgeInsets padding;

  @override
  State<MyVideoProgressIndicator> createState() =>
      _MyVideoProgressIndicatorState();
}

class _MyVideoProgressIndicatorState extends State<MyVideoProgressIndicator> {
  _MyVideoProgressIndicatorState() {
    listener = () {
      if (!mounted) {
        return;
      }
      setState(() {});
    };
  }

  late VoidCallback listener;

  VideoPlayerController get controller => widget.controller;

  VideoProgressColors get colors => widget.colors;

  @override
  void initState() {
    super.initState();
    controller.addListener(listener);
  }

  @override
  void deactivate() {
    controller.removeListener(listener);
    super.deactivate();
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    if (duration.inHours != 0) {
      return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    } else {
      return "$twoDigitMinutes:$twoDigitSeconds";
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget progressIndicator;
    if (controller.value.isInitialized) {
      final int duration = controller.value.duration.inMilliseconds;
      final int position = controller.value.position.inMilliseconds;

      int maxBuffering = 0;
      for (final DurationRange range in controller.value.buffered) {
        final int end = range.end.inMilliseconds;
        if (end > maxBuffering) {
          maxBuffering = end;
        }
      }

      progressIndicator = Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          Row(
            children: [
              Flexible(
                child: ProgressBar(
                  progressBarColor: Colors.white,
                  thumbColor: Colors.white,
                  bufferedBarColor: Colors.white10,
                  baseBarColor: Colors.black26,
                  progress: Duration(milliseconds: position),
                  total: Duration(milliseconds: duration),
                  buffered: Duration(milliseconds: maxBuffering),
                  timeLabelLocation: TimeLabelLocation.none,
                  onSeek: (value) {
                    controller.seekTo(value);
                  },
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '${_printDuration(Duration(milliseconds: position))} / ${_printDuration(Duration(milliseconds: duration))}',
                style: TextStyle(color: Colors.white, fontSize: 12),
              )
            ],
          ),
        ],
      );
    } else {
      progressIndicator = LinearProgressIndicator(
        value: null,
        valueColor: AlwaysStoppedAnimation<Color>(colors.playedColor),
        backgroundColor: colors.backgroundColor,
      );
    }
    final Widget paddedProgressIndicator = Padding(
      padding: widget.padding,
      child: progressIndicator,
    );
    if (widget.allowScrubbing) {
      return _VideoScrubber(
        controller: controller,
        child: paddedProgressIndicator,
      );
    } else {
      return paddedProgressIndicator;
    }
  }
}

class _VideoScrubber extends StatefulWidget {
  const _VideoScrubber({
    required this.child,
    required this.controller,
  });

  final Widget child;
  final VideoPlayerController controller;

  @override
  _VideoScrubberState createState() => _VideoScrubberState();
}

class _VideoScrubberState extends State<_VideoScrubber> {
  bool _controllerWasPlaying = false;

  VideoPlayerController get controller => widget.controller;

  @override
  Widget build(BuildContext context) {
    void seekToRelativePosition(Offset globalPosition) {
      final RenderBox box = context.findRenderObject()! as RenderBox;
      final Offset tapPos = box.globalToLocal(globalPosition);
      final double relative = tapPos.dx / box.size.width;
      final Duration position = controller.value.duration * relative;
      controller.seekTo(position);
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: widget.child,
      onHorizontalDragStart: (DragStartDetails details) {
        if (!controller.value.isInitialized) {
          return;
        }
        _controllerWasPlaying = controller.value.isPlaying;
        if (_controllerWasPlaying) {
          controller.pause();
        }
      },
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        if (!controller.value.isInitialized) {
          return;
        }
        seekToRelativePosition(details.globalPosition);
      },
      onHorizontalDragEnd: (DragEndDetails details) {
        if (_controllerWasPlaying &&
            controller.value.position != controller.value.duration) {
          controller.play();
        }
      },
      onTapDown: (TapDownDetails details) {
        if (!controller.value.isInitialized) {
          return;
        }
        seekToRelativePosition(details.globalPosition);
      },
    );
  }
}
