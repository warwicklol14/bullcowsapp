import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bullasset = AssetImage('assets/bull.png');
    var ampasset = AssetImage('assets/ampersand.png');
    var cowasset = AssetImage('assets/cow.png');
    var bullimg = Image(image: bullasset, width: 120.0, height: 120.0,);
    var ampimg = Image(image: ampasset,width: 118.0, height: 118.0,);
    var cowimg = Image(image: cowasset,width: 120.0,height: 120.0,);
    return Container (
      margin: const EdgeInsets.only(top: 20.0),
      child: Row(
        children: <Widget>[
          Container(child: bullimg,),
          Container(child: ampimg,),
          Container(child: cowimg,),
        ],
      )
    );
  }
}