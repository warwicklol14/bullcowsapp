import 'package:flutter/material.dart';
import 'bloc.dart';

class MainSection extends InheritedWidget {

  MainSection({Widget child}) :super(child:child);

  final bloc = Bloc();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static MainSection of(BuildContext context) => context.inheritFromWidgetOfExactType(MainSection);
}