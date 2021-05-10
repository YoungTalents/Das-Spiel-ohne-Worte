import 'package:sign_writing/environment.dart';
import 'package:sign_writing/sign_writing_page.dart';
import 'package:sign_writing/widgets/matching_game.dart';
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
                ImageContent(Image.asset("assets/images/ic_image201.jpg")):1,
                ImageContent(Image.asset("assets/images/ic_image202.jpg")):2,
                ImageContent(Image.asset("assets/images/ic_image203.jpg")):3,
                ImageContent(Image.asset("assets/gifs/autogif.gif")):1,
                ImageContent(Image.asset("assets/gifs/baumgif.gif")):2,
                ImageContent(Image.asset("assets/gifs/kaffeegif.gif")):3,
                ImageContent(Image.asset("assets/images/ic_image101.jpg")):1,
                ImageContent(Image.asset("assets/images/ic_image102.jpg")):2,
                ImageContent(Image.asset("assets/images/ic_image103.jpg")):3
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