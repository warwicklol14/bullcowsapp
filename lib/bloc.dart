import 'dart:async';
import 'package:rxdart/rxdart.dart';

class Bloc {
  String _originalword = '';
  String _guessword = '';
  List<int> _bullscowslist = List<int>();
  final _originalwordController  = StreamController<String>();
  final _guesswordController = StreamController<String>();
  final _bullsCowsSubject = BehaviorSubject<List<int>>();
  final _sumbitEventController = StreamController<int>();

  Sink<String> get originalSink => _originalwordController.sink;
  Sink<String> get guessSink => _guesswordController.sink;
  Sink<int> get sumbitEventSink => _sumbitEventController.sink;

  Stream<List<int>> get bullsCowsStream => _bullsCowsSubject.stream;

  Bloc() {
    _originalwordController.stream.listen(_setOriginal);
    _guesswordController.stream.listen(_setGuess);
    _sumbitEventController.stream.listen(_mapEventToState);
  }

  void _setOriginal(String org) {
    _originalword = org;
  }

  void _setGuess(String guess) {
    _guessword = guess;
  }

  void _mapEventToState(int event) {
    _bullscowslist = check(_originalword, _guessword);
    _bullsCowsSubject.add(_bullscowslist);
    print(_bullscowslist);
  }

  void dispose() {
    _originalwordController?.close();
    _guesswordController?.close();
    _bullsCowsSubject?.close();
    _sumbitEventController?.close();
  }

  List<int> check(String original,String guess) {
    int cows = 0;
    int bulls = 0;
    if (original.length != guess.length)
      return [-1,-1];
    int length = guess.length;
    for (int i = 0; i < length; i++) {
      int j = original.indexOf(guess[i]);
      if (j == -1)
        continue;
      if (i == j) {
        bulls++;
      }
      else if (i != j) {
        cows++;
      }
    }
    return [bulls,cows];
  }
}