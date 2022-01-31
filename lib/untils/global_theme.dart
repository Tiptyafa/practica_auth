import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData globalTheme() => ThemeData(
  splashColor: Colors.lightBlueAccent,

  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.light,
    primarySwatch: Colors.purple,
  ).copyWith(
    secondary: Colors.lightBlueAccent,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
        fontSize: 17.0,fontWeight: FontWeight.normal, color: Colors.purple),
    bodyText2: TextStyle(
        fontSize: 21.0,fontWeight: FontWeight.bold, color: Colors.purple),
    headline1: TextStyle(
        fontSize: 15.0,fontWeight: FontWeight.bold, color: Colors.purple),
    headline4: TextStyle(
        fontSize: 15.0,fontStyle: FontStyle.italic, color: Colors.purple),


  ),
);