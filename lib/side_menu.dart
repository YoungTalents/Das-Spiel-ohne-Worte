import 'dart:math';
import 'dart:ui';

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
    Function callback = () { 
      if(matchingGameState != null) {
        matchingGameState.currentState.initGame();
      }
    };

    return Container(
      color: Colors.black.withAlpha(180), 
      width: max(wWidth * 0.35, 280),  
      // child: ClipRect(
       // clipBehavior: Clip.hardEdge,
        // child: BackdropFilter(

        // filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0, tileMode: TileMode.repeated), 
        // child: Container(color: Colors.grey.withOpacity(0.2),  
          child: Padding(
            
          padding: EdgeInsets.fromLTRB(wWidth * 0.05, wHeight * 0.05, wWidth * 0.05, wHeight * 0.05),
          child: Column(children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, wHeight * 0.03),
                  child: Container(child: Text("Settings", style: TextStyle(fontSize: 30, color: Colors.blueGrey)))),
              Padding(padding: EdgeInsets.fromLTRB(wWidth * 0.03, 0, 0, 0),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(children: <Widget>[
                        TextCheckBox(
                          onChanged: (bool value) {
                            setSystemSetting(PreferencesKey.SHOW_INTRO, value);
                            setState(() {});
                          },
                          text: "Show Intro on Start",
                          value: getSystemSetting(PreferencesKey.SHOW_INTRO),
                          color: Colors.blueGrey,
                        )
                      ]),
                      Padding(padding: EdgeInsets.symmetric(vertical: 20), child:
                        Row(
                          children: [Column(crossAxisAlignment: CrossAxisAlignment.start,
                            
                            children: [
                            Text(AppLocalizations.of(context).gameCategoriesTitle, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, decoration: TextDecoration.underline),),
                            
                            makeGameCategoryTextCheckBox("BASIC", AppLocalizations.of(context).categoryBasics, callback),
                            makeGameCategoryTextCheckBox("LETTERS", AppLocalizations.of(context).categoryLetters, callback),
                            makeGameCategoryTextCheckBox("NUMBERS", AppLocalizations.of(context).categoryNumbers, callback),
                            makeGameCategoryTextCheckBox("OTHER", AppLocalizations.of(context).categoryOthers, callback),
                          ]),
                        ])
                      )
                    ])
                )
            ])
          )
       // )))
    );
  }

  Widget makeGameCategoryTextCheckBox(categoryName, text, callback) {
    return TextCheckBox(
      onChanged: (bool value) {
        setState(() {
          setSystemSettingListItem(PreferencesKey.GAME_GROUPS, categoryName, value);
          callback();  
        });
      },
      text: text,
      value: (getSystemSetting(PreferencesKey.GAME_GROUPS) as List).contains(categoryName),
      color: Colors.blueGrey,
    );
  }
}