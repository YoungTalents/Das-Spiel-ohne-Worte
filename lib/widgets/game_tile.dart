import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sign_writing/game_management.dart';
import 'package:video_player/video_player.dart';

class GameTile extends StatefulWidget{
  final int tileId;
  final Function callbackGameOver;

  GameTile({Key key, this.tileId, this.callbackGameOver}) : super(key: key);

  @override
  State<StatefulWidget> createState() => GameTileState();
}

class GameTileState extends State<GameTile> {
  Tile tile;
  GlobalKey key;

  @override
  void initState() {
    tile = tiles.singleWhere((element) => element.id == widget.tileId);
    key = widget.key;
    super.initState();
  }

  void setTileStatus(TileStatus tileStatus) {
    setState(() {
      tile.status = tileStatus;
    });
  }

  @override
  Widget build(BuildContext context) {

    print("building tile " + tile.id.toString()  + "(" + tile.group.toString() + ")");
    TileStatus status = tile.status;

    return Container( 
      child: status == TileStatus.Done
      ? null 
      : InkWell(
          onTap: status == TileStatus.Default
            ? () {
                onTileClick(tile);
                if (tiles.every((t) => t.status == TileStatus.Done))
                  widget.callbackGameOver();
            }
            : null,
          child: Container(
            margin: EdgeInsets.all(4),
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration( 
              color: Colors.white,
              border: Border.all(color: status == TileStatus.Chosen ? Colors.black : Colors.white)
            ),
            child: 
              Stack(
                fit: StackFit.expand,
                children: [
                  tile.content.getWidget(), 
                  Container(color:Colors.transparent)
                ]),
            ),
      )
    );
  } 

  onTileClick(Tile tile) {
    print("clicked tile " + tile.id.toString() + "/" + tile.group.toString() + "(" + tile.key.toString() + ")");
    setState(() {
      // if nothing is chosen yet - make the current group the selected tile's group
      if (currentGroup == null) currentGroup = tile.group;

      // if the selected tile belongs to the current group 
      if (currentGroup == tile.group) {
        // set its status in the list and locally to Chosen
        //tile.status = TileStatus.Chosen;
        (tiles.where((t) => (t == tile)).single).status = TileStatus.Chosen;
        
        // if all the group's tiles in the list are Chosen - 
        Set<Tile> setGroup = tiles.where((t) => t.group == currentGroup).toSet();
        if (setGroup.every((t) => t.status == TileStatus.Chosen)) {
          // set all list tiles and tiles to Done 
          tiles.where((t) => setGroup.contains(t))
            .forEach((element) { 
              //element.status = TileStatus.Done;
              element.key.currentState.setTileStatus(TileStatus.Done);
            });

          // clear current group 
          currentGroup = null;
        }
      // if selected tile does not belong to current group
      } else {
        // clear current group 
        currentGroup = null;

        // change all Chosen Tiles to Default
        tiles.where((t) => t.status == TileStatus.Chosen).forEach((element) {
            //element.status = TileStatus.Default;
            print("element to unchoose:  " + element.id.toString() + "/" + element.group.toString() + "(" + element.key.toString() + ")");
            print("element to unchoose:  " + element.id.toString() + "/" + element.group.toString() + "(" + element.key.toString() + ")");
            print("unchoosing " + element.key.currentState.tile.id.toString() + "/" + element.key.currentState.tile.group.toString() + "(" + element.key.currentState.tile.key.toString() + ")");
            print("unchoosing " + element.key.currentState.tile.id.toString() + "/" + element.key.currentState.tile.group.toString() + "(" + element.key.currentState.tile.key.toString() + "/" + element.key.currentState.key.toString() + ")");
            element.key.currentState.setTileStatus(TileStatus.Default);
          });
      }
    });
  }
}

enum TileStatus { Default, Chosen, Done }

abstract class TileContent {
  Widget getWidget();
}

TileContent generateContent(GroupItem contentDef) {
    TileContent tileContent;

    switch (contentDef.type) {
      case "Image": tileContent = ImageContent(Image.asset(contentDef.value)); break;
      case "Text": tileContent = TextContent(contentDef.value); break;
      case "Video": tileContent = VideoContent(contentDef.value); break;
    }

    return tileContent;
  }


class VideoContent extends TileContent {
  String _videoUrl;
  VideoPlayerController _controller;
  Future<void> isInitialized;

  VideoContent(videoUrl) {
    _videoUrl = videoUrl;
    _controller = VideoPlayerController.network(_videoUrl);
    _controller.setLooping(true);
    _controller.setVolume(0);
    _controller.play();
    isInitialized = _controller.initialize();
  }

  String getVideoUrl() {
    return _videoUrl;
  }

  @override
  Widget getWidget() {
    return // Stack(children: [
      AspectRatio(aspectRatio: _controller.value.aspectRatio, child: VideoPlayer(_controller))
      // , Container(color:Colors.transparent)])
      ;
  }

  void dispose() {
    _controller.dispose();
  }
}
class WidgetContent extends TileContent {
  
  Widget _widgetContent;

  WidgetContent(widget) {
    this._widgetContent = widget;
  }

  @override
  Widget getWidget() {
    return _widgetContent;
  }
}

class TextContent extends TileContent {
  String _widgetContent;

  TextContent(text) {
    this._widgetContent = text;
  }

  @override
  Widget getWidget() {
    return Center(child:Text(_widgetContent));
  }
}

class ImageContent extends TileContent {
  Image _widgetContent;

  ImageContent(image) {
    this._widgetContent = image;
  }

  @override
  Widget getWidget() {
    return _widgetContent;
  }
}

class ImageTextContent extends TileContent {
  Image _widgetImageContent;
  String _widgetTextContent;

  ImageTextContent(image, text) {
    this._widgetImageContent = image;
    this._widgetTextContent = text;
  }

  @override
  Widget getWidget() {
    return Stack(children:[
      Container(padding: EdgeInsets.only(bottom: 20), child:
      _widgetImageContent),
      Positioned(bottom:0, child:Text(_widgetTextContent))
    ]);
  }
}

class Tile {
  GlobalKey<GameTileState> key;
  int id;
  int group;
  TileContent content;
  TileStatus status;

  Tile(_content, _id, _group) { 
    this.content = _content;
    this.id = _id;
    this.group = _group;    
    status = TileStatus.Default;
    this.key = GlobalKey<GameTileState>();
  }
}