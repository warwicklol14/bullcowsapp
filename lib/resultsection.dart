import 'package:flutter/material.dart';
import 'mainsection.dart';
import 'bullcowspics.dart';

class ResultSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stream = MainSection.of(context);
    return StreamBuilder(
        stream: stream.bloc.bullsCowsStream,
        initialData: [1,1],
        builder: (context, snapshot) {
          if (snapshot.hasError)
          return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.none: return Text('Select lot');
            case ConnectionState.waiting:  return Text('Awaiting input...');
            case ConnectionState.active: return BullCowsPics(bullscowsList:snapshot.data);
            case ConnectionState.done: return Text('\$${snapshot.data} (closed)');
          }
          return null; // unreachable        
        },
    );
  }
}
