import 'package:sign_writing/environment.dart';
import 'package:sign_writing/pages/the_game.dart';
import 'package:sign_writing/sign_writing_page.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Games extends StatelessWidget {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  BuildContext gamesContext;

  @override
  Widget build(BuildContext context) {
    gamesContext = context;
    return SignWritingPage(
      passkey: _scaffoldKey,
      title: "Games",
      body: 
        Container(padding: EdgeInsets.symmetric(horizontal: wWidth*0.02, vertical: wHeight * 0.02),child:
          GridView.count(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            crossAxisCount: 3,
            children: [
              makeGameButton(TheGame(), "The Game", ""),
              makeGameButton(null, "City, Country, River", ""),
              makeGameButton(null, "Memory", ""),
              makeGameButton(null, "Cards", ""),
              makeGameButton(null, "Scrabble", ""), 
            ])
        )
    );
  }

  Widget makeGameButton(_redir, _text, _pic) {
    return GestureDetector (
      onTap: _redir == null ? () {Toast.show("Not available yet.", gamesContext);} : null,
      child: Container(
      padding: EdgeInsets.all(5),
      child:TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 10,
          primary: Colors.blueGrey),
        child: Text(_text),
        onPressed: _redir != null 
          ? () { Navigator.push(gamesContext, MaterialPageRoute(builder: (context) => _redir)); }
          : null
      )
    ));
  }
}
