import 'package:SignWriting/environment.dart';
import 'package:SignWriting/pages/Games.dart';
import 'package:SignWriting/pages/basics.dart';
import 'package:SignWriting/pages/exercises.dart';
import 'package:SignWriting/pages/intro.dart';
import 'package:SignWriting/sign_writing_page.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  BuildContext mainMenuContext;

  @override
  Widget build(BuildContext context) {
    wWidth = MediaQuery.of(context).size.width;
    wHeight = MediaQuery.of(context).size.height;
    mainMenuContext = context;

    return SignWritingPage(
      passkey: _scaffoldKey,
      title: "Main Menu",
      body: 
        Column(children: [
          MainMenuButton(Basics(), "The Basics"),
          MainMenuButton(Excercises(), "Excercises"),
          MainMenuButton(Games(), "Games"),
          MainMenuButton(Intro(), "Introduction"),
        ])
    );
  }

  Widget MainMenuButton(_redir, _text) {
    return ElevatedButton(
      
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        
        //minimumSize: Size.fromWidth(0.5),
        elevation: 10,
        primary: Colors.blueGrey),
      child: Text(_text),
      onPressed: () { Navigator.push(mainMenuContext, MaterialPageRoute(builder: (context) => _redir)); }, );
  }
}