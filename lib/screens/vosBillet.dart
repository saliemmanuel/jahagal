import 'package:flutter/material.dart';
import 'package:jahagal/utils/route.dart';

import 'detailBillet.dart';

class VosBillet extends StatefulWidget {
  const VosBillet({Key key}) : super(key: key);

  @override
  _VosBilletState createState() => _VosBilletState();
}

class _VosBilletState extends State<VosBillet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Vos Billets",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
              title: Text("Billets acheter"),
              onTap: () => pushNewPage(Detail(), context)),
          ListTile(
              title: Text("Billets reserver"),
              onTap: () => pushNewPage(Detail2(), context))
        ],
      ),
    );
  }
}
