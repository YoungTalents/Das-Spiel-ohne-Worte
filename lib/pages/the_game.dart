// import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:sign_writing/environment.dart';
import 'package:sign_writing/sign_writing_page.dart';

import 'package:flutter/material.dart';
import 'package:sign_writing/widgets/matching_game.dart';

class TheGame extends StatelessWidget {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    wWidth = MediaQuery.of(context).size.width;
    wHeight = MediaQuery.of(context).size.height;

    return SignWritingPage(
      passkey: _scaffoldKey,
      title: "The Game",
      body: Container(
        padding: EdgeInsets.symmetric(vertical: wHeight * 0.02, horizontal: wWidth * 0.02),      
        child: Column(children: [
          Text("Match tiles with the same meaning.", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
          Container( height:wHeight*0.8, width: wHeight * 0.8,
            padding: EdgeInsets.symmetric(horizontal: wWidth * 0.02, vertical: wHeight * 0.02),
            child: SizedBox( height:wHeight*0.8, width: wHeight * 0.8, child: 
              MatchingGame(map: {
                ImageContent(Image.asset("assets/images/ic_image201.jpg")):1,
                ImageContent(Image.asset("assets/images/ic_image202.jpg")):2,
                ImageContent(Image.asset("assets/images/ic_image203.jpg")):3,

                //ImageContent(Image.asset("assets/images/ic_image201.jpg")):1,
                //ImageContent(Image.asset("assets/images/ic_image202.jpg")):2,
                //ImageContent(Image.asset("assets/images/ic_image203.jpg")):3,
                VideoContent("assets/videos/auto.mp4"):1,
                VideoContent("assets/videos/baum.mp4"):2,
                VideoContent("assets/videos/kaffee.mp4"):3,
                ImageContent(Image.asset("assets/images/ic_image101.jpg")):1,
                ImageContent(Image.asset("assets/images/ic_image102.jpg")):2,
                ImageContent(Image.asset("assets/images/ic_image103.jpg")):3
              }))
            )
        ])
      )
    );
  }
}