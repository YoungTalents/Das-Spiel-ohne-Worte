import 'package:das_spiel/sign_writing_page.dart';
import 'package:flutter/material.dart';

class Excercises extends StatelessWidget {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  // BuildContext exercisesContext;

  @override
  Widget build(BuildContext context) {
    // exercisesContext = context;
    return SignWritingPage(
      passkey: _scaffoldKey,
      title: "Excercises",
      body: Text(""));
    }
}
