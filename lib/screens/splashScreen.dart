import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jahagal/utils/route.dart';
import 'homeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    timerSplash();
    super.initState();
  }

  timerSplash() {
    Timer(Duration(seconds: 3), () async {
      pushNewPageRemoveUntil(HomeScreen(), context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("img/splash.png", height: 400.0),
                SizedBox(height: 15.0),
                Text(
                  "Jahagal",
                  style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "IndieFlower"),
                ),
                SizedBox(height: 15.0),
                Text("Houtene Singtoh.A et Nabe Eugenie",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
