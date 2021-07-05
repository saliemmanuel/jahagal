import 'package:flutter/material.dart';

import 'screens/splashScreen.dart';
import 'utils/colorsApp.dart';

void main() => runApp(MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: ColorsApp.primaryColor,
          primaryIconTheme: IconThemeData(color: Colors.white)),
    ));
