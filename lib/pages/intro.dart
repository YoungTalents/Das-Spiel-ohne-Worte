import 'package:sign_writing/environment.dart';
import 'package:sign_writing/game_management.dart';
import 'package:sign_writing/intro_slide.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sign_writing/pages/the_game.dart';
import 'package:sign_writing/widgets/game_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
     // getSlide2(),
     // getSlide3()
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
        height: wHeight,
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: wWidth * 0.001, vertical: wHeight * 0.02),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(height:wHeight * 0.1, /*color:Colors.red,*/ 
            child:Center(child:
              Text(AppLocalizations.of(context).introductionTitle, textAlign: TextAlign.center, style: TextStyle(fontSize: 24))
          )),
          Container(height:wHeight * 0.7, /*color:Colors.green,*/ 
            child: getSlide1()
            /*CarouselSlider(

              options: CarouselOptions(
                height: wHeight * 0.7,
                
                enableInfiniteScroll: false,
                //height: wHeight * 0.7,
                //viewportFraction: 0.7,
                autoPlay: false,
                // autoPlayInterval: autoPlayAnimationDuration: autoPlayCurve: pauseAutoPlayOnTouch:
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: [getSlide1()/*,getSlide2(),getSlide3()*/],
            )*/),
          Container(height:wHeight * 0.15, /*color: Colors.amber,*/ 
            child: Center(child:
            _currentIndex == slidesList.length - 1
              ? TextButton(onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => TheGame())); }, child: Text(AppLocalizations.of(context).intoductionButton, style: TextStyle(fontSize:30, fontWeight: FontWeight.bold),))
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
             )
             
             ) 
        ])
      )
    );
  }

  Widget getSlide(slide) {
    // return IntroSlide(
      // body: 
      return Container(
        padding: EdgeInsets.symmetric(horizontal: wWidth * 0.05),
        width: wWidth, 
        child: slide
      //)
    );
  }
/*
  Widget getSlide1() {
    return getSlide(
      Column(children: [
          Container(child:Text("The Goal", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
          Container(child:Text("Learn and remember 1 word in Sign Language", style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic))),
        ],),
    );
  }
*/
    Widget getSlide1() {
        var introTiles = [
          Tile(generateContent(exampleGroup.entries[0]), 1, 1),
          Tile(generateContent(exampleGroup.entries[1]), 2, 1),
          Tile(generateContent(exampleGroup.entries[2]), 3, 1)
        ];

        return getSlide( Container(height: wHeight * 0.7, /*color: Colors.blue,*/ child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(height: wHeight * 0.17, /*color: Colors.purple,*/ child:Center(child:Text(AppLocalizations.of(context).introductionText, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)))),
            Container(width: wHeight * 0.15, height: wHeight * 0.53, 
              child:ListView(
                // scrollDirection: Axis.horizontal,
                semanticChildCount: 3,
                shrinkWrap: true,
                children: introTiles.map((t) => Container(
                    height: wHeight * 0.15,
                    margin: EdgeInsets.all(4),
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration( 
                      color: Colors.transparent,
                      border: Border.all(color: Colors.black)
                    )   ,
                    child: t.content.getWidget(), 
                  )).toList(),
                )
              )
            ])
          )
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