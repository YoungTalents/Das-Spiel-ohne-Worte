import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sign_writing/game_management.dart';
import 'package:sign_writing/settings.dart';
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

  List<Group> getAvailGroups() {
    List<List<Group>> allGroups = SystemSettings.gameGroups.map((groupName) => (mapGroups[groupName] as List<Group>)).toList();
    List<Group> groups = allGroups.expand((element) => element).toList();
    return groups;
  }

  void _initGameMap() {
    int i1, i2, i3;
    Random random = new Random();
    List<Group> availGroups = getAvailGroups();

    i1 = random.nextInt(availGroups.length);
    while ({null, i1}.contains(i2)) i2 = random.nextInt(availGroups.length);
    while ({null, i1, i2}.contains(i3)) i3 = random.nextInt(availGroups.length);
    
    print("Chosen Groups: " + availGroups[i1].name + ", " + availGroups[i2].name + ", " + availGroups[i3].name);
      gameMap = {
        generateContent(availGroups[i1].entries[0]) : 1,
        generateContent(availGroups[i1].entries[1]) : 1,
        generateContent(availGroups[i1].entries[2]) : 1,
        generateContent(availGroups[i2].entries[0]) : 2,
        generateContent(availGroups[i2].entries[1]) : 2,
        generateContent(availGroups[i2].entries[2]) : 2,
        generateContent(availGroups[i3].entries[0]) : 3,
        generateContent(availGroups[i3].entries[1]) : 3,
        generateContent(availGroups[i3].entries[2]) : 3
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
        child: Column(children: [
          Center(child: ElevatedButton(
            onPressed: () { 
              setState(() {
                initGame();
              }); },
            child: Text("Play Again"),), 
          ),
          Center(child: ElevatedButton(
            onPressed: () { 
              setState(() {
                Scaffold.of(context).openDrawer();
              }); },
            child: Text("Change Settings"),), 
          ),
          ]),
        visible: tiles.every((t) => t.status == TileStatus.Done) ,
        
      )]);
  }
}