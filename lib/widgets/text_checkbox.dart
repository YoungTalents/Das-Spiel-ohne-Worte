import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextCheckBox extends StatefulWidget {
  final bool value;
  final String text;
  final Function onChanged;
  final Color color;

  const TextCheckBox({Key key, this.value, this.text, this.onChanged, this.color}) : super(key: key);

  @override
  TextCheckBoxState createState() => TextCheckBoxState();
}

class TextCheckBoxState extends State<TextCheckBox> {
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            unselectedWidgetColor: Colors.blueGrey,  
            textSelectionHandleColor: Colors.amber        
          ),
          child: Checkbox(onChanged: this.widget.onChanged, value: this.widget.value, checkColor: this.widget.color, focusColor: this.widget.color, activeColor: Colors.white),
        ),
        Text( this.widget.text, style: TextStyle(color: this.widget.color, fontWeight: FontWeight.bold, fontSize: 20),),
      ],
    );
  }
}