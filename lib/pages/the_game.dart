import 'package:das_spiel/environment.dart';
import 'package:das_spiel/sign_writing_page.dart';
import 'package:das_spiel/widgets/matching_game.dart';
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
                "1":1,
                "2":2,
                "3":3, 
                "A":1,
                "B":2,
                "C":3,
                "a": 1,
                "b":2,
                "c": 3
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