import 'package:flutter/material.dart';
import 'package:jahagal/utils/route.dart';
import 'package:jahagal/widget/homeScreenWidget.dart';

import 'apropos.dart';
import 'vosBillet.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
        title: Text(
          "Jahagal",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Center(
                child: Text(
                  "Jahagal",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 55.0,
                  ),
                ),
              ),
            ),
            ListTile(
                leading: Icon(Icons.home, color: Colors.red),
                title: Text('Acceuil'),
                onTap: () => Navigator.pop(context)),
            Divider(),
            ListTile(
                leading: Icon(
                  Icons.attach_money_rounded,
                  color: Colors.lightGreenAccent,
                ),
                title: Text('Vos billets'),
                onTap: () => pushNewPage(VosBillet(), context)),
            Divider(),
            ListTile(
                leading: Icon(Icons.info, color: Colors.blue),
                title: Text('A propos'),
                onTap: () => pushNewPage(Apropos(), context)),
          ],
        ),
      ),
      body: HomeScreenWidget(),
    );
  }
}
