import 'dart:ui';

import 'package:sign_writing/main.dart';
import 'package:sign_writing/settings.dart';
import 'package:sign_writing/widgets/text_checkbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  SideMenu({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> with SingleTickerProviderStateMixin {
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncInit();
    });
  }

  void _asyncInit() async {
    
  }

  @override
  Widget build(BuildContext context) {
    double wWidth = MediaQuery.of(context).size.width;
    double wHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), 
          child: Padding(
            padding: EdgeInsets.fromLTRB(wWidth * 0.05, wHeight * 0.05, wWidth * 0.05, wHeight * 0.05),
            child: Column(children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, wHeight * 0.03),
                  child: Container(child: Text("Title", style: TextStyle(fontSize: 30, color: Colors.blueGrey)))),
              Padding(
                  padding: EdgeInsets.fromLTRB(wWidth * 0.03, 0, 0, 0),
                  child: Column(children: [
                          Row(children: <Widget>[
                              TextCheckBox(
                                onChanged: (bool value) {
                                  prefs.setBool(PreferencesKey.SHOW_INTRO, value);
                                  setState(() {});
                                },
                                text: "Show Intro on Start",
                                value: getSystemSetting(PreferencesKey.SHOW_INTRO),
                                color: Colors.blueGrey,
                              ),
                            ]),
                          ])
                )
            ])
          )
        )
    );
  }
}
