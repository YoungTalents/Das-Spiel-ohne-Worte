import 'package:SignWriting/environment.dart';
import 'package:SignWriting/intro_slide.dart';
import 'package:SignWriting/pages/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  int _currentIndex=0;
  List slidesList;

  @override
  void initState() {
    super.initState();
  }

  initSlidesList() {
    slidesList = [
      getSlide1(),
      getSlide2(),
      getSlide3()
    ];
  }
  
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];

    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    wWidth = MediaQuery.of(context).size.width;
    wHeight = MediaQuery.of(context).size.height;

    initSlidesList();
    
    return Scaffold(
      body: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: wWidth * 0.001, vertical: wHeight * 0.02),
        child:Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text("Introduction", textAlign: TextAlign.center, style: TextStyle(fontSize: 24))
            ]
          ),
          Column(children: <Widget>[
            CarouselSlider(
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  height: wHeight * 0.84,
                  viewportFraction: 1,
                  autoPlay: false,
                  // autoPlayInterval: autoPlayAnimationDuration: autoPlayCurve: pauseAutoPlayOnTouch:
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: [getSlide1(),getSlide2(),getSlide3()],
              ),
              _currentIndex == slidesList.length - 1
              ? Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => MainMenu())); }, child: Text("Got it!"))
              ],) 
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(slidesList, (index, url) {
                  return Container(
                    width: 10.0,
                    height: 10.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index ? Colors.blueAccent : Colors.grey,
                    ),
                  );
                }),
              ),
            ],
          )])));
  }

  IntroSlide getSlide(slide) {
    return IntroSlide(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: wHeight * 0.1, horizontal: wWidth * 0.13),
        width: wWidth, 
        child: slide
      )
    );
  }

  Widget getSlide1() {
    return getSlide(
      Column(children: [
          Container(child:Text("The Goal", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
          Container(child:Text("Learn and remember 1 word in Sign Language", style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic))),
        ],),
    );
  }

   Widget getSlide2() {
    return getSlide(
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Container(child:Text("Video Clips", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
        Container(child:Text("Even the simplest words of Sign Language are difficult to learn and remember.",style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic))),
      ],),
    );
  }

   Widget getSlide3() {
    return getSlide(Container(
      child: Column(children: [
        Container(child:Text("SignWriting", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
        Container(child:Text("One Picture tells more than 1000 words",style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic))),
        Container(child:Text("Clear. International. Visible.",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic))),
      ],),
    ));
  }
}