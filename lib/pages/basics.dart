import 'package:flutter/material.dart';

import '../sign_writing_page.dart';

class Basics extends StatelessWidget {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  // BuildContext basicsContext;

  @override
  Widget build(BuildContext context) {
    // basicsContext = context;
    return SignWritingPage(
      passkey: _scaffoldKey,
      title: "Basics",
      body: Text(""));
    }
}