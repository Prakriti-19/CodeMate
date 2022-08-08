import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class Videopage extends StatefulWidget {

  String cat;
  Videopage({required this.cat});
  @override
  _VideopageState createState() => _VideopageState();
}

class _VideopageState extends State<Videopage> {

  late VideoPlayerController controller;
  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  loadVideoPlayer(){
    String cat=widget.cat;
    controller = VideoPlayerController.network(cat);
    controller.addListener(() {
      setState(() {});
    });
    controller.initialize().then((value){
      setState(() {});
    });

  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: Text("Video Player in Flutter"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
          child: Column(
              children:[
                AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: VideoPlayer(controller),
                ),

                Container( //duration of video
                  child: Text("Total Duration: " + controller.value.duration.toString()),
                ),

                Container(
                    child: VideoProgressIndicator(
                        controller,
                        allowScrubbing: true,
                        colors:VideoProgressColors(
                          backgroundColor: Colors.blueAccent,
                          playedColor: Colors.white,
                          bufferedColor: Colors.white,
                        )
                    )
                ),

                Container(
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: (){
                            if(controller.value.isPlaying){
                              controller.pause();
                            }else{
                              controller.play();
                            }

                            setState(() {

                            });
                          },
                          icon:Icon(controller.value.isPlaying?Icons.pause:Icons.play_arrow)
                      ),

                      IconButton(
                          onPressed: (){
                            controller.seekTo(Duration(seconds: 0));

                            setState(() {

                            });
                          },
                          icon:Icon(Icons.stop)
                      )
                    ],
                  ),
                )
              ]
          )
      ),
    );
  }

}

