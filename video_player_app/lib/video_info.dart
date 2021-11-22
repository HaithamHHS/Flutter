import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'colors.dart' as color;

class Video_info extends StatefulWidget {
  @override
  _Video_infoState createState() => _Video_infoState();
}

class _Video_infoState extends State<Video_info> {
  List videoinfo = [];

  _initData() {
    DefaultAssetBundle.of(context)
        .loadString('json/videoinfo.json')
        .then((value) {
      setState(() {
        videoinfo = json.decode(value);
      });
    });
  }

  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  bool _disposed = false;
  int _videoindexcontrol = -1;

  @override
  void dispose() {
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  bool _play = false;
  bool _status = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _play == false
            ? BoxDecoration(
                gradient: LinearGradient(
                    begin: const FractionalOffset(0.0, 0.4),
                    end: Alignment.bottomCenter,
                    colors: [
                    color.AppColor.gradientFirst.withOpacity(0.8),
                    color.AppColor.gradientSecond.withOpacity(0.9)
                  ]))
            : BoxDecoration(color: color.AppColor.gradientSecond),
        child: Column(
          children: [
            _play == false
                ? Container(
                    padding: EdgeInsets.only(top: 60, left: 25, right: 25),
                    width: MediaQuery.of(context).size.width,
                    height: 280,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 20,
                                  color: color.AppColor.secondPageIconColor,
                                )),
                            Expanded(child: Container()),
                            Icon(
                              Icons.info_outline,
                              size: 20,
                              color: color.AppColor.secondPageIconColor
                                  .withOpacity(0.4),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          'Legs Toning',
                          style: TextStyle(
                              fontSize: 25,
                              color: color.AppColor.secondPageTitleColor),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'And Glutes Workout',
                          style: TextStyle(
                              fontSize: 25,
                              color: color.AppColor.secondPageTitleColor),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 95,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  gradient: LinearGradient(colors: [
                                    color.AppColor
                                        .secondPageContainerGradient1stColor,
                                    color.AppColor
                                        .secondPageContainerGradient2ndColor
                                  ])),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.timer,
                                    size: 20,
                                    color: color.AppColor.secondPageIconColor,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '60 mins',
                                    style: TextStyle(
                                        color: color
                                            .AppColor.secondPageTitleColor),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 230,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  gradient: LinearGradient(colors: [
                                    color.AppColor
                                        .secondPageContainerGradient1stColor,
                                    color.AppColor
                                        .secondPageContainerGradient2ndColor
                                  ])),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.handyman,
                                    size: 20,
                                    color: color.AppColor.secondPageIconColor,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    'Ressistant Band  ,  skettlebell',
                                    style: TextStyle(
                                        color: color
                                            .AppColor.secondPageTitleColor),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                : Container(
                    child: Column(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(top: 50, left: 15, right: 20),
                          margin: EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back,
                                size: 20,
                                color: color.AppColor.secondPageTopIconColor,
                              ),
                              Expanded(child: Container()),
                              Icon(
                                Icons.info,
                                size: 20,
                                color: color.AppColor.secondPageTopIconColor,
                              )
                            ],
                          ),
                        ),
                        _videoplay(context),
                        _Videostatus(context),
                      ],
                    ),
                  ),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(75))),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Circut 1 : Legs Toning',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: color.AppColor.circuitsColor),
                      ),
                      Expanded(child: Container()),
                      Row(
                        children: [
                          Icon(
                            Icons.loop,
                            size: 25,
                            color: Colors.blue.shade200,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            '3 Sets',
                            style: TextStyle(
                                color: color.AppColor.circuitsColor,
                                fontSize: 15),
                          ),
                          SizedBox(
                            width: 30,
                          )
                        ],
                      )
                    ],
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          _videoindex(index);
                          setState(() {
                            _play = true;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          height: 120,
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(videoinfo[index]
                                                ['thumbnail']))),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        videoinfo[index]['title'],
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        videoinfo[index]['time'],
                                        style: TextStyle(fontSize: 15),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 70,
                                    height: 15,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey.shade300),
                                    child: Center(child: Text('15s Rest')),
                                  ),
                                  Row(
                                    children: [
                                      for (int i = 0; i < 100; i++)
                                        Container(
                                          width: 3,
                                          height: 1,
                                          decoration: BoxDecoration(
                                              color: i % 2 == 0
                                                  ? Colors.blue
                                                  : Colors.white),
                                        )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: videoinfo.length,
                  ))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  String convertTwo(int value) {
    return value < 10 ? "0$value" : "$value";
  }

  Widget _Videostatus(BuildContext context) {
    final noMute = (_controller?.value.volume ?? 0) > 0;
    final duration = _duration?.inSeconds ?? 0;
    final head = _position?.inSeconds ?? 0;
    final remind = max(0, duration - head);
    final mins = convertTwo(remind ~/ 60.0);
    final secs = convertTwo(remind % 60);

    return Column(mainAxisSize: MainAxisSize.min, children: [
      SliderTheme(
          data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.red[700],
              inactiveTrackColor: Colors.red[100],
              trackShape: RoundedRectSliderTrackShape(),
              trackHeight: 2.0,
              thumbShape: RoundSliderThumbShape(),
              thumbColor: Colors.redAccent,
              valueIndicatorShape: PaddleSliderValueIndicatorShape(),
              valueIndicatorColor: Colors.redAccent,
              valueIndicatorTextStyle: TextStyle(color: Colors.white)),
          child: Slider(
            min: 0,
            max: 100,
            divisions: 100,
            label: _position?.toString().split('.')[0],
            value: max(0, min(_progress * 100, 100)),
            onChanged: (value) {
              setState(() {
                _progress = value * 0.01;
              });
            },
            onChangeStart: (value) {
              _controller?.pause();
            },
            onChangeEnd: (value) {
              final duration = _controller?.value.duration;
              if (duration != null) {
                var newvalue = max(0, min(value, 99)) * 0.01;
                var millis = (duration.inMicroseconds * newvalue).toInt();
                _controller?.seekTo(Duration(microseconds: millis));
                _controller?.play();
              }
            },
          )),
      Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        margin: EdgeInsets.only(bottom: 10),
        color: color.AppColor.gradientSecond,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  print('$duration , $head ');
                  if (noMute) {
                    _controller?.setVolume(0.0);
                  } else {
                    _controller?.setVolume(1.0);
                  }
                  setState(() {});
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Container(
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                          blurRadius: 5.0,
                          offset: Offset(0.0, 0.0),
                          color: color.AppColor.gradientSecond)
                    ]),
                    height: 60,
                    child: noMute
                        ? Icon(
                            Icons.volume_up,
                            size: 35,
                            color: Colors.white,
                          )
                        : Icon(Icons.volume_off, size: 36, color: Colors.white),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () async {
                    _status = true;
                    print('$duration');
                    final index = _videoindexcontrol -= 1;
                    if (index >= 0) {
                      _videoindex(index);
                    } else {
                      Get.snackbar('video', '',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: color.AppColor.gradientSecond,
                          messageText: Text('No videos to show ',
                              style: TextStyle(color: Colors.white)),
                          icon: Icon(
                            Icons.face,
                            size: 20,
                          ));
                    }
                  },
                  child: Icon(
                    Icons.fast_rewind,
                    size: 36,
                    color: Colors.white,
                  )),
              TextButton(
                  onPressed: () async {
                    setState(() {
                      if (_status) {
                        _status = false;
                        _controller?.pause();
                      } else {
                        _status = true;
                        _controller?.play();
                      }
                    });
                  },
                  child: _status
                      ? Icon(
                          Icons.pause,
                          size: 36,
                          color: Colors.white,
                        )
                      : Icon(
                          Icons.play_arrow,
                          size: 36,
                          color: Colors.white,
                        )),
              TextButton(
                  onPressed: () async {
                    _status = true;
                    final index = _videoindexcontrol += 1;
                    if (index >= 0 && index <= videoinfo.length - 1) {
                      _videoindex(index);
                    } else {
                      Get.snackbar('video', '',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: color.AppColor.gradientSecond,
                          messageText: Text(
                              'No More videos to show , Congrats !!',
                              style: TextStyle(color: Colors.white)),
                          icon: Icon(
                            Icons.face,
                            size: 20,
                       ));
                    }
                  },
                  child: Icon(
                    Icons.fast_forward,
                    color: Colors.white,
                    size: 36,
                  )),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  "$mins : $secs",
                  style: TextStyle(fontSize: 18, color: Colors.white, shadows: [
                    Shadow(
                        blurRadius: 3.0,
                        offset: Offset(0.0, 1.0),
                        color: color.AppColor.gradientSecond)
                  ]),
                ),
              ),
            ]),
      ),
    ]);
  }

  var onupdatetime;

  Duration? _duration;
  Duration? _position;

  var _progress = 0.0;

  void _videocontrol() async {
    if (_disposed) {
      return;
    }
    onupdatetime = 0;
    final now = DateTime.now().microsecondsSinceEpoch;
    if (onupdatetime > now) {
      return;
    }
    onupdatetime = now + 50;

    final controller = _controller;
    if (controller == null) {
      print('null value !');
    }
    if (!controller!.value.isInitialized) {
      print('initialize please !');
    }
    if (_duration == null) {
      _duration = _controller?.value.duration;
    }
    var duration = _duration;
    if (duration == null) return;

    var position = await controller.position;
    _position = position;
    final isplaying = controller.value.isPlaying;
    if (isplaying) {
      if (_disposed) return;
      setState(() {
        _progress = position!.inMilliseconds.ceilToDouble() /
            duration.inMilliseconds.ceilToDouble();
      });
    }
    _status = isplaying;
  }

  Widget _videoplay(BuildContext context) {
    final contorller = _controller;
    if (contorller != null && contorller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          width: 300,
          height: 300,
          child: VideoPlayer(contorller),
        ),
      );
    } else {
      return AspectRatio(
          aspectRatio: 16 / 9, child: Center(child: Text('Please Wait !!')));
    }
  }

  _videoindex(int index) async {
    final controller =
        VideoPlayerController.network(videoinfo[index]['videoUrl']);
    final _old = _controller;
    _controller = controller;
    if (_old != null) {
      _old.removeListener(_videocontrol);
      _old.pause();
    }
    setState(() {});
    controller
      ..initialize().then((_) {
        _videoindexcontrol = index;
        _old?.dispose();
        controller.addListener(() => _videocontrol);
        controller.play();
        setState(() {
        
        });
      });
  }
}
