import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(176, 34, 88, 52);

const List<Color> _colorThemes = [
  _customColor, // 0
  Colors.blue, // 1
  Colors.green, // 2
  Colors.pink, // 3
];

class AppTheme{
  final int selectedColor;

//  AppTheme({required this.selectedColor});

  AppTheme({this.selectedColor = 0}):assert(selectedColor >= 0 && selectedColor < _colorThemes.length, 'Colors must be between0 and ${_colorThemes.length}');

  ThemeData theme(){
    return ThemeData(
      //useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      brightness: Brightness.light // DarkMode con .dark
    );
  }
}