import 'package:flutter/material.dart';
import 'package:jahagal/screens/envoyerColis.dart';
import 'package:jahagal/screens/recevoirColis.dart';
import 'package:jahagal/utils/route.dart';
import 'package:jahagal/widget/workScreenWidget.dart';

import 'achatBillet.dart';
import 'reservationBillet.dart';

class WorkScreen extends StatefulWidget {
  final String nomAgenceSelectionner;

  const WorkScreen({Key key, this.nomAgenceSelectionner}) : super(key: key);
  @override
  _WorkScreenState createState() => _WorkScreenState();
}

class _WorkScreenState extends State<WorkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Agence ${widget.nomAgenceSelectionner}",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          WorkScreenWidget(
              colorIcon: Colors.cyan,
              icon: Icons.attach_money_rounded,
              title: "Achat de billet",
              onPressed: () => pushNewPage(
                  AchatBillet(agence: widget.nomAgenceSelectionner), context)),
          WorkScreenWidget(
              colorIcon: Colors.yellow,
              icon: Icons.download_rounded,
              title: "Reservation de billet",
              onPressed: () => pushNewPage(
                  ReservationScreen(agence: widget.nomAgenceSelectionner),
                  context)),
          WorkScreenWidget(
              colorIcon: Colors.teal,
              icon: Icons.upload_rounded,
              title: "Envoyer un colis",
              onPressed: () => pushNewPage(
                  EnvoiColis(agence: widget.nomAgenceSelectionner), context)),
          WorkScreenWidget(
              colorIcon: Colors.pink,
              icon: Icons.transit_enterexit,
              title: "Recevoir un colis",
              onPressed: () => pushNewPage(RecevoirColis(), context)),
        ],
      ),
    );
  }
}
