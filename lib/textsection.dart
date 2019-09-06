import 'package:flutter/material.dart';
import 'mainsection.dart';

class TextSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sink = MainSection.of(context);
    var checkmarkasset = AssetImage('assets/checked.png');
    var cancelasset = AssetImage('assets/cancel.png');
    var originaltextcontroller = TextEditingController();
    var guesstextcontroller = TextEditingController();
    return Container(
      margin: const EdgeInsets.only(top: 40.0,left: 10.0,right: 10.0,bottom: 10.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  controller: originaltextcontroller,
                  decoration: InputDecoration(
                    hintText: 'Enter the original word',
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0)
                      ) 
                    )
                  ),
                ),
              ),
              IconButton(
                icon: Image(image:cancelasset,width: 40.0,height: 40.0,),
                onPressed: () {
                  originaltextcontroller.text = '';
                },
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  controller: guesstextcontroller,
                  decoration: InputDecoration(
                    hintText: 'Enter the word guessed',
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0)
                      )
                    )
                  ),
                ),
              ),
              IconButton(
                icon: Image(image:cancelasset,width: 40.0,height: 40.0,),
                onPressed: () {
                  guesstextcontroller.text = '';
                },
              )
            ],
          ),
          IconButton(
            icon: Image(image: checkmarkasset,width: 80.0,height: 80.0,),
            onPressed: () {
              sink.bloc.originalSink.add(originaltextcontroller.text);
              sink.bloc.guessSink.add(guesstextcontroller.text);
              sink.bloc.sumbitEventSink.add(1);
            },
          ),
        ],
      ),
    );
  }
}