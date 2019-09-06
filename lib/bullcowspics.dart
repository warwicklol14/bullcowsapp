import 'package:flutter/material.dart';

class BullCowsPics extends StatelessWidget {
  BullCowsPics({this.bullscowsList});
  final bullscowsList;
  final List<Widget> cowlist = List<Widget>();
  final List<Widget> bulllist = List<Widget>();
  final bullimgasset = const AssetImage('assets/bullnum.png');
  final cowimgasset = const AssetImage('assets/cownum.png');
  @override
  Widget build(BuildContext context) {
    int bulls = bullscowsList[0];
    int cows = bullscowsList[1];
    for (int i = 0 ; i < bulls; i++)
      bulllist.add(Image(image: bullimgasset,width: 40.0, height: 40.0,));
    for (int i = 0; i < cows; i++)
      cowlist.add(Image(image: cowimgasset,width: 40.0,height: 40.0,));
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0)
        ),
      ),
      padding: EdgeInsets.all(10.0),
      child: Wrap(
        runSpacing: 10.0,
        children: <Widget>[
          Wrap(
            children: bulllist
          ),
          Wrap(
            children: cowlist
          )
        ],
      ),
    );
  }
}