import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sign_writing/game_management.dart';
import 'package:sign_writing/widgets/game_tile.dart';

class MatchingGame extends StatefulWidget {
  const MatchingGame({Key key}) : super(key: key);

  @override
  MatchingGameState createState() => MatchingGameState();
}

class MatchingGameState extends State<MatchingGame> {
  Map<TileContent, int> gameMap;
  List<Tile> shuffledTiles = [];
  List<Widget> tilesList = [];

  TileContent generateContent(GroupItem contentDef) {
    TileContent tileContent;

    switch (contentDef.type) {
      case "Image": tileContent = ImageContent(Image.asset(contentDef.value)); break;
      case "Text": tileContent = TextContent(contentDef.value); break;
      case "Video": tileContent = VideoContent(contentDef.value); break;
    }

    return tileContent;
  }

  void _initGameMap() {
    int i1, i2, i3;
    Random random = new Random();
    
    i1 = random.nextInt(groups.length);
    while ({null, i1}.contains(i2)) i2 = random.nextInt(groups.length);
    while ({null, i1, i2}.contains(i3)) i3 = random.nextInt(groups.length);
    
    print("Chosen Groups: " + groups[i1].name + ", " + groups[i2].name + ", " + groups[i3].name);
      gameMap = {
        generateContent(groups[i1].entries[0]) : 1,
        generateContent(groups[i1].entries[1]) : 1,
        generateContent(groups[i1].entries[2]) : 1,
        generateContent(groups[i2].entries[0]) : 2,
        generateContent(groups[i2].entries[1]) : 2,
        generateContent(groups[i2].entries[2]) : 2,
        generateContent(groups[i3].entries[0]) : 3,
        generateContent(groups[i3].entries[1]) : 3,
        generateContent(groups[i3].entries[2]) : 3
        /*ImageContent(Image.asset("assets/images/ic_image201.jpg")):1,
        ImageContent(Image.asset("assets/images/ic_image202.jpg")):2,
        ImageContent(Image.asset("assets/images/ic_image203.jpg")):3,

        //ImageContent(Image.asset("assets/images/ic_image201.jpg")):1,
        //ImageContent(Image.asset("assets/images/ic_image202.jpg")):2,
        //ImageContent(Image.asset("assets/images/ic_image203.jpg")):3,
        VideoContent("assets/videos/auto.mp4"):1,
        VideoContent("assets/videos/baum.mp4"):2,
        VideoContent("assets/videos/kaffee.mp4"):3,
        ImageContent(Image.asset("assets/images/ic_image101.jpg")):1,
        ImageContent(Image.asset("assets/images/ic_image102.jpg")):2,
        ImageContent(Image.asset("assets/images/ic_image103.jpg")):3*/
      }; 
  }

  @override
  void initState() {
    initGame();
    super.initState();
  }

  void initGame() {
    _initGameMap();
    _initBoard();
  }

  void dispose() {
    getAllVideoContents().forEach((vc) { vc.dispose(); });
    super.dispose();
  }

  Future<void> _initVideoPlayersFuture() async {
    if (!tiles.every((t) => t.status == TileStatus.Done))
      getAllVideoContents().forEach((element) async {
        await element.isInitialized;
      });
  }

  List<VideoContent> getAllVideoContents() {
    List<Tile> videoItems = shuffledTiles.where((Tile t) => t.content is VideoContent).toList();
    return videoItems.map((vi) => vi.content as VideoContent).toList();
  }

  void _initBoard() async {
    shuffledTiles.clear();

    for (int i = 0; i < gameMap.length; i++) {
      shuffledTiles.add(Tile(gameMap.keys.elementAt(i), i, gameMap.values.elementAt(i)));
    }

    shuffledTiles.shuffle();
    tiles = shuffledTiles;
    // tilesList = tiles.map((tile) => GestureDetector(onTap: () {print("tap " + tile.id.toString()); },  child:GameTile(key: ObjectKey(tile), tile: tile))).toList();
    //GestureDetector a = tilesList.first;
  }

  @override
  Widget build(BuildContext context) {
    print("building game");
    return Stack(children: [
      FutureBuilder(
        future: _initVideoPlayersFuture(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          } else {
            return GridView.count(
                mainAxisSpacing: 3,
                crossAxisSpacing: 3,
                shrinkWrap: true,
                crossAxisCount: 3,
                children: tiles.map((tile) => GameTile(key: tile.key, tileId: tile.id, callbackGameOver: () => { setState((){}) })).toList()
              );
          }
        }),
      Visibility(
        child: Container(
          child: Center(child: ElevatedButton(
          onPressed: () { 
            setState(() {
              initGame();
            }); },
    
          child: Text("Play Again"),), 
        )),
        visible: tiles.every((t) => t.status == TileStatus.Done) ,
        
      )]);
  }
}