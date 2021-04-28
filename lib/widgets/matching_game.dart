import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MatchingGame extends StatefulWidget {
  final Map<Object, int> map;

  const MatchingGame({Key key, this.map}) : super(key: key);

  @override
  MatchingGameState createState() => MatchingGameState();
}

class MatchingGameState extends State<MatchingGame> {
  var shuffledTiles = [];
  int currentGroup;

  @override
  void initState() {
    super.initState();
    _initBoard();
  }

  void _initBoard() async {
    shuffledTiles.clear();

    for (int i = 0; i < widget.map.length; i++) {
      shuffledTiles.add(Tile(widget.map.keys.elementAt(i), i, widget.map.values.elementAt(i)));
    }

    shuffledTiles.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children:[
      GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        children: shuffledTiles.map((tile) => GameTile(tile)).toList()
      ),
      Visibility(
        visible: shuffledTiles.every((t) => t.status == TileStatus.Done) ,
        child: ElevatedButton(
          onPressed: () { setState(() {
            _initBoard();
          });  },
          child: Text("Play Again"),), 
      )
    ]);
  }

  Widget GameTile(Tile tile)  {
    return Container(padding: EdgeInsets.all(5), 
      child: tile.status == TileStatus.Done
      ? null 
      : ElevatedButton(
          onPressed: tile.status == TileStatus.Default
          ? () { setState(() {

            if (currentGroup == tile.group || currentGroup == null) {
              currentGroup = tile.group;
              (shuffledTiles.where((t) => (t == tile)).single).status = TileStatus.Chosen;
              
              if (shuffledTiles.where((t) => t.group == tile.group).every((element) => element.status == TileStatus.Chosen)) {
                shuffledTiles.where((t) => t.group == tile.group).forEach((element) {element.status = TileStatus.Done;});
                currentGroup = null;
              }
            } else {
              currentGroup = null;
              shuffledTiles.where((t) => t.status == TileStatus.Chosen).forEach((element) {element.status = TileStatus.Default;});
            }
          }); }
          : null,
          child: Text(tile.content),));
  }
}

enum TileStatus { Default, Chosen, Done }

class Tile {
  int id;
  int group;
  String content;
  TileStatus status;

  Tile(_content, _id, _group) { 
    this.content = _content;
    this.id = _id;
    this.group = _group;
    status = TileStatus.Default;
  }
}