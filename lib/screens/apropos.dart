import 'package:flutter/material.dart';

class Apropos extends StatefulWidget {
  const Apropos({Key key}) : super(key: key);

  @override
  _AproposState createState() => _AproposState();
}

class _AproposState extends State<Apropos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
        title: Text(
          "A-propos",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          Card(
              child: ListTile(
                  leading: Icon(Icons.stay_primary_portrait),
                  title: Text("Jahagal v1.0.0"))),
          Card(
            child: ListTile(
              leading: Icon(Icons.info),
              title: Text(
                  "Jahagal a été conçu dans le cadre du projet  de fin du cycle de licence.Elle a vu le jour grâce aux etudiants : Houtene Singtoh August et Nabe Eugenie"),
            ),
          ),
        ],
      ),
    );
  }
}
