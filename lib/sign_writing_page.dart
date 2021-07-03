import 'package:sign_writing/environment.dart';
import 'package:sign_writing/side_menu.dart';
import 'package:flutter/material.dart';

class SignWritingPage extends StatefulWidget {
  final Widget body;
  final String title;
  final Key passkey; 

  const SignWritingPage({Key key, this.body, this.passkey, this.title}) : super(key: key);

  @override
  _SignWritingPageState createState() => _SignWritingPageState();
}

class _SignWritingPageState extends State<SignWritingPage> with TickerProviderStateMixin {

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
    wWidth = MediaQuery.of(context).size.width;
    wHeight = MediaQuery.of(context).size.height;
    // GlobalKey _scaffoldKey = new GlobalKey();
    GlobalKey _scaffoldKey = this.widget.passkey;

    return Scaffold(
      key: _scaffoldKey,
      // drawerScrimColor: Colors.transparent,
      // drawer: SideMenu(),
      body: Container(color: Colors.black12,
        child: Container(
          width: wWidth,
          height: wHeight,
          child: Stack(children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: wWidth * 0.001, vertical: wHeight * 0.02 ),
              child:Column(children: [
                Container(height:30, child: 
                  Stack(children:[
                    Positioned(
                      top: -12,
                      right: 30,
                      child: Visibility(visible: false, // widget.title != "Main Menu",
                        child:IconButton(icon: Icon(Icons.arrow_back_ios_outlined, size: 24,),  onPressed: () { Navigator.pop(context); },)),),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Text(widget.title, textAlign: TextAlign.center, style: TextStyle(fontSize: 24),)
                      ]
                    )
                  ])
                ),
                widget.body,
              ])),
/*            Positioned(
              top: wHeight * 0.001,
              left: wWidth * 0.001,
              child: Container(
                child: IconButton(
                  iconSize: wWidth * 0.1 ,
                  icon: Icon(Icons.menu),
                  color: Colors.blueGrey,
                  onPressed: () { (_scaffoldKey.currentState as ScaffoldState).openDrawer(); },
                )
              )
            )*/
          ]),
        )
      )
    );
  }
}
