import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;
import 'WebD.dart';

class AppD extends StatefulWidget {
  const AppD({Key? key}) : super(key: key);

  @override
  _AppDState createState() => _AppDState();
}

class _AppDState extends State<AppD> {
  late String videoTitle;
  final List<String> _videoUrlList = [
    'VPvVD8t02U8',
    '7660DZ_HJqM','mnkzx3TwbV8','F9UC9DY-vIU','uoP4JKHgzDE','cxm9AHNDMPI','CD1Y2DmL5JM','x0uinJvhNxI','fgdpvwEWJ9M','oPH7rfJel9w'
  ];
  List <YoutubePlayerController> lYTC = [];
  String title = "";
  Map<String, dynamic> cStates = {};

  @override
  void initState() {
    super.initState();
    fillYTlists();
  }


  fillYTlists(){
    for (var element in _videoUrlList) {
      String _id = YoutubePlayer.convertUrlToId(element)!;
      YoutubePlayerController _ytController = YoutubePlayerController(
        initialVideoId: _id,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          enableCaption: true,
          captionLanguage: 'en',
        ),
      );
  _ytController.addListener(() {
  print('for $_id got isPlaying state ${_ytController.value.isPlaying}');
  if (cStates[_id] != _ytController.value.isPlaying) {
  if (mounted) {
  setState(() {
  cStates[_id] = _ytController.value.isPlaying;
  });
  }
  }
  });

  lYTC.add(_ytController);
}
}

@override
  void dispose() {
    for (var element in lYTC) {
      element.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 57, 89, 1),
      appBar: AppBar(backgroundColor: Colors.lightBlueAccent[100],
        title: const Text('App Development',
          style: TextStyle(color: Color.fromRGBO(33, 57, 89, 1)),),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 22),
        child: ListView.builder(
          itemCount: _videoUrlList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            YoutubePlayerController _ytController = lYTC[index];
            String _id = YoutubePlayer.convertUrlToId(_videoUrlList[index])!;
            String curState = 'undefined';
            if (cStates[_id] != null) {
              curState = cStates[_id]? 'playing':'paused';
            }
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
              child: Column(
                children: [
                  Container(
                    height: 240.0,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(60)),
                          child: YoutubePlayer(
                            width: 350,
                            controller: _ytController,
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: Colors.lightBlueAccent,
                            bottomActions: [
                              CurrentPosition(),
                              ProgressBar(isExpanded: true),
                              FullScreenButton(),
                            ],
                            onReady: () async {
                              var jsonData = await getDetail(_videoUrlList[index]);
                              title = jsonData['title'];
                              print('onReady for $index');
                            },
                            onEnded: (YoutubeMetaData _md) {
                              _ytController.seekTo(const Duration(seconds: 0));
                            },
                          ),
                        ),

                        Container(
                          height: 40,
                          color: Colors.white,
                          child: Text(title,style: TextStyle(color: Colors.pink,fontSize: 23),),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
Future<dynamic> getDetail(String userUrl) async {
  String embedUrl = "https://www.youtube.com/oembed?url=$userUrl&format=json";

  //store http request response to res variable
  var res = await http.get(Uri.parse(embedUrl));
  print("get youtube detail status code: " + res.statusCode.toString());

  try {
    if (res.statusCode == 200) {
      //return the json from the response
      return json.decode(res.body);

    } else {
      //return null if status code other than 200
      return null;
    }
  } on FormatException catch (e) {
    print('invalid JSON'+ e.toString());
    //return null if error
    return null;
  }
}