import 'package:SignWriting/environment.dart';
import 'package:SignWriting/sign_writing_page.dart';
import 'package:SignWriting/widgets/matching_game.dart';
import 'package:flutter/material.dart';

class TheGame extends StatelessWidget {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SignWritingPage(
      passkey: _scaffoldKey,
      title: "The Game",
      body: Container(
        padding: EdgeInsets.symmetric(vertical: wHeight * 0.02, horizontal: wWidth * 0.02),      
        child: Column(children: [
          Text("Match tiles with the same meaning.", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
          Container(
            padding: EdgeInsets.symmetric(horizontal: wWidth * 0.02, vertical: wHeight * 0.02),
            child:
              MatchingGame(map: {
                TextContent("1"):1,
                TextContent("2"):2,
                TextContent("3"):3, 
                VideoContent("https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4"):1,
                VideoContent("https://sample-videos.com/video123/mp4/240/big_buck_bunny_240p_1mb.mp4"):2,
                ImageContent(Image.network("https://icons.iconarchive.com/icons/iconarchive/red-orb-alphabet/256/Number-3-icon.png")):3,
                ImageTextContent(Image.network("https://icons.iconarchive.com/icons/iconarchive/red-orb-alphabet/256/Number-1-icon.png"), "pic 1"):1,
                ImageTextContent(Image.network("https://icons.iconarchive.com/icons/iconarchive/red-orb-alphabet/256/Number-2-icon.png"), "pic 2"):2,
                ImageTextContent(Image.network("https://icons.iconarchive.com/icons/iconarchive/red-orb-alphabet/256/Number-3-icon.png"), "pic 3"):3
              })
            )
        ])
      )
    );
  }
        
  Widget GameTile()  {
    return ElevatedButton(onPressed: () {  },
    child: null,);
  }
}