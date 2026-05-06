import 'dart:math';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'colors.dart';
import 'column_social_icon_test_1.dart';
import 'data_json.dart';
import 'left_panel_test_1.dart';


class TestPage3 extends StatefulWidget {
  @override
  _TestPage3State createState() => _TestPage3State();
}

class _TestPage3State extends State<TestPage3>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: items.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return RotatedBox(
      quarterTurns: 0,
      child: TabBarView(
        controller: _tabController,
        children: List.generate(items.length, (index) {
          return VideoPlayerItem(
            videoUrl: items[index]['videoUrl'],
            size: size,
            name: items[index]['name'],
            caption: items[index]['caption'],
            profileImg: items[index]['profileImg'],
          );
        }),
      ),
    );
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
  VideoPlayerController? _controller;
  bool _isPlaying = false;
  bool _disposed = false;

  Widget _playView(BuildContext context){
    final controller = _controller;
    if(controller!=null&&controller.value.isInitialized){
      return VideoPlayer(controller);
    } else {
      return Center(
        child: Text("Loading...",
          style: TextStyle(
              fontSize: 20,
              color: Colors.white60
          ),),
      );
    }

  }
  @override
  void initState(){
    super.initState();
    _initializeVideo();

  }
  _initializeVideo() {
    final controller = VideoPlayerController.network(widget.videoUrl);
    _controller = controller;
    setState((){});
    controller..initialize().then((_) {
      _controller?.addListener(_onControllerUpdate);
      _controller?.play();
      setState(() {});
    });
    _controller?.setLooping(true);
  }

  @override
  void dispose() {
    _disposed=true;
    _controller?.pause();
    _controller?.dispose();
    _controller= null;
    super.dispose();
  }

  Widget isPlaying(){
    return _controller!.value.isPlaying && _isPlaying  ? Container() : Icon(Icons.play_arrow,size: 80,color: white.withOpacity(0.5),);
  }
  String convertTwo(int value){
    return value < 10 ? "0$value" : "$value";
  }
  @override
  Widget build(BuildContext context) {
    final duration = _duration?.inSeconds ?? 0;
    final head = _position?.inSeconds ?? 0;
    final remained = max(0, duration - head);
    final mins = convertTwo(remained ~/ 60.0);
    final secs = convertTwo(remained % 60);

    return InkWell(
      onTap: () {
        setState(() {
          _controller!.value.isPlaying
              ? _controller?.pause()
              : _controller?.play();
        });
      },
      child: RotatedBox(
        quarterTurns: 0,
        child: Container(
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
                            debugPrint("${info.visibleFraction} of my widget is visible");
                            if(info.visibleFraction == 0){
                              _controller?.pause();
                            }
                            else{
                              _controller?.play();
                            }
                          },

                          child: _playView(context)),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                          ),
                          child: isPlaying(),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Container(
                    height: widget.size.height,
                    width: widget.size.width,
                    child: Padding(
                      padding:
                      const EdgeInsets.only(left: 15, top: 20, bottom: 10),
                      child: SafeArea(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            //HeaderHomePage(),
                            Expanded(
                                child: Row(
                                  children: <Widget>[
                                    LeftPanelTest1(
                                      size: widget.size,
                                      name: "${widget.name}",
                                      caption: "${widget.caption}",
                                    ),
                                    RightPanel(
                                      size: widget.size,
                                      profileImg: "${widget.profileImg}",
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height*0.845,
                  left: MediaQuery.of(context).size.width*0.85,
                  child: Text(
                    "$mins:$secs",
                    style: TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                        shadows: <Shadow>[
                          Shadow(
                              offset: Offset(0.0, 1.0),
                              blurRadius: 4.0,
                              color: Color.fromARGB(150, 0, 0, 0)
                          )
                        ]
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height*0.82,
                  child: SliderTheme(data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                    trackShape: RoundedRectSliderTrackShape(),
                    trackHeight: 2.0,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
                    thumbColor: Colors.white70,
                    overlayColor: Colors.white.withAlpha(32),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                    tickMarkShape: RoundSliderTickMarkShape(),
                    activeTickMarkColor: Colors.white,
                    inactiveTickMarkColor: Colors.grey,
                    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                    valueIndicatorColor: Colors.white70,
                    valueIndicatorTextStyle: TextStyle(
                        color: Colors.black
                    ),
                  ),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.9,
                        child: Slider(
                          value: max(0, min(_progress * 100, 100)),
                          min: 0,
                          max: 100,
                          divisions: 100,
                          label: _position?.toString().split(".")[0],
                          onChanged: (value) {
                            setState(() {
                              _progress = value * 0.01;
                            });
                          },
                          onChangeStart: (value) {
                            _controller?.pause();
                          },
                          onChangeEnd: (value) {
                            final duration = _controller?.value?.duration;
                            if(duration != null) {
                              var newValue = max(0, min(value, 99)) * 0.01;
                              var millis = (duration.inMilliseconds * newValue).toInt();
                              _controller?.seekTo(Duration(milliseconds: millis));
                              _controller?.play();
                            }
                          },
                        ),
                      )),
                ),
                Positioned(
                    top: widget.size.height*0.025,
                    child: Container(
                      height: widget.size.height*0.79,
                      width: widget.size.width,
                      child: GestureDetector(
                          onVerticalDragUpdate: (details) {
                            int sensitivity = 8;
                            if (details.delta.dy > sensitivity) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('     Daan e baam e swipe kor bolod'),
                                behavior: SnackBarBehavior.floating,
                                duration: Duration(seconds: 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                margin: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height - 150,
                                    right: 60,
                                    left: 60,
                                ),
                              ));
                              // Down Swipe
                            } else if(details.delta.dy < -sensitivity){
                              Navigator.pop(context);
                              // Up Swipe
                            }
                          }

                        // onPanUpdate: (details) {
                        //   // Swiping in right direction.
                        //   if (details.delta.dx > 0) {
                        //     Navigator.pop(context);
                        //   }
                        //
                        //   // Swiping in left direction.
                        //   if (details.delta.dx < 0) {}
                        // },
                      )
                )
                )

              ],
            )),
      ),
    );
  }

  Duration? _duration;
  Duration? _position;
  var _progress=0.0;
  var _onUpdateControllerTime;
  void _onControllerUpdate()async{
    if(_disposed){
      return;
    }
    _onUpdateControllerTime=0;
    final now = DateTime.now().microsecondsSinceEpoch;
    if(_onUpdateControllerTime>now){
      return;
    }
    _onUpdateControllerTime=now + 500;
    final controller = _controller;
    if(controller==null){
      debugPrint("Controller is null");
      return;
    }
    if(!controller.value.isInitialized){
      debugPrint("Controller cannot be initialized");
      return;
    }
    if(_duration == null){
      _duration = _controller?.value.duration;
    }
    var duration = _duration;
    if(duration == null) return;
    var position = await controller.position;
    _position = position;
    final playing = controller.value.isPlaying;
    if(playing){
      if (_disposed) return;
      setState(() {
        _progress = position!.inMilliseconds.ceilToDouble() / duration.inMilliseconds.ceilToDouble();
      });
    }
    _isPlaying = playing;
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
                    getProfileTest1(img: profileImg),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}