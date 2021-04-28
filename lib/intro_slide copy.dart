import 'package:SignWriting/side_menu.dart';
import 'package:flutter/material.dart';

class IntroSlide extends StatefulWidget {
  final Widget body;
  final Key passkey;

  const IntroSlide({Key key, this.body, this.passkey}) : super(key: key); 

  @override
  _IntroSlideState createState() => _IntroSlideState();
}

class _IntroSlideState extends State<IntroSlide> with TickerProviderStateMixin {
  
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double wWidth = MediaQuery.of(context).size.width;
    double wHeight = MediaQuery.of(context).size.height;
    // GlobalKey _scaffoldKey = new GlobalKey();
    GlobalKey _scaffoldKey = this.widget.passkey;

    return Scaffold(
      key: _scaffoldKey,
      drawerScrimColor: Colors.transparent,
      drawer: SideMenu(),
      body: Container(
        width: wWidth,
        height: wHeight,
        child: Stack(children: <Widget>[
          widget.body,
          Positioned(
            top: wHeight * 0.02,
            left: -wWidth * 0.1,
            child: Container(
              child: IconButton(
                iconSize: wWidth * 0.2 ,
                icon: Icon(Icons.menu),
                color: Colors.white,
                onPressed: () { (_scaffoldKey.currentState as ScaffoldState).openDrawer(); },
              )
            )
          )
        ]),
      )
    );
  }
}
