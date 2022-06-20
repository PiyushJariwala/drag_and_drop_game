import 'package:drag_and_drop_game/screen/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=> HomeScreen(),
      },
    ),
  );
}
