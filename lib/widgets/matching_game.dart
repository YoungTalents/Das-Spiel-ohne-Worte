import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

class MatchingGame extends StatefulWidget {
  final Map<TileContent, int> map;

  const MatchingGame({Key key, this.map}) : super(key: key);

  @override
  MatchingGameState createState() => MatchingGameState();
}

class MatchingGameState extends State<MatchingGame> {
  List<Tile> shuffledTiles = [];
  int currentGroup;

  @override
  void initState() {
    _initBoard();
    super.initState();
  }

  void dispose() {
    getAllVideoContents().forEach((vc) { vc.dispose(); });
    super.dispose();
  }

  Future<void> _initVideoPlayersFuture() async {
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

    for (int i = 0; i < widget.map.length; i++) {
      shuffledTiles.add(Tile(widget.map.keys.elementAt(i), i, widget.map.values.elementAt(i)));
    }

    shuffledTiles.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initVideoPlayersFuture(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Column(children:[
            GridView.count(
              mainAxisSpacing: 3,
              crossAxisSpacing: 3,
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
      }
    );
  }

  Widget GameTile(Tile tile)  {
    return Container(width:5, 
      child: tile.status == TileStatus.Done
      ? null 
      : ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            padding: EdgeInsets.all(3),
            side: BorderSide(width: 3, color: tile.status == TileStatus.Chosen ? Colors.black : Colors.white)
            ),
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
          child: tile.content.getWidget(),
      )
    );
  }
}

enum TileStatus { Default, Chosen, Done }

abstract class TileContent {
  Widget getWidget();
}

class VideoContent extends TileContent {
  String _videoUrl;
  VideoPlayerController _controller;
  Future<void> isInitialized;

  VideoContent(videoUrl) {
    _videoUrl = videoUrl;
    _controller = VideoPlayerController.network(_videoUrl);
    _controller.setLooping(true);
    _controller.play();
    _controller.setVolume(0);
    isInitialized = _controller.initialize();
  }

  String getVideoUrl() {
    return _videoUrl;
  }

  @override
  Widget getWidget() {
    return AspectRatio(aspectRatio: _controller.value.aspectRatio, child: VideoPlayer(_controller));
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
    return Text(_widgetContent);
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
  int id;
  int group;
  TileContent content;
  TileStatus status;

  Tile(_content, _id, _group) { 
    this.content = _content;
    this.id = _id;
    this.group = _group;
    status = TileStatus.Default;
  }
}