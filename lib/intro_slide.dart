import 'package:flutter/material.dart';

import 'environment.dart';

class IntroSlide extends StatefulWidget {
  final Widget body;

  const IntroSlide({Key key, this.body}) : super(key: key); 

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
   
    return Scaffold(

      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: wHeight * 0.1, horizontal: wWidth * 0.05),
        width: wWidth, 
        child: widget.body
      )
    );
  }
}
