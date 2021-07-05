import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jahagal/widget/cardDialogue.dart';

import 'achatBillet.dart';

class ModePayement extends StatefulWidget {
  final String type;
  final String agence;
  final String nomEtprenom;
  final String nb;
  final String dropValClss;
  final String dropValDep;
  final String dropValDest;

  const ModePayement(
      {Key key,
      this.type,
      this.nomEtprenom,
      this.nb,
      this.dropValClss,
      this.dropValDep,
      this.dropValDest,
      this.agence})
      : super(key: key);

  @override
  _ModePayementState createState() => _ModePayementState();
}

class _ModePayementState extends State<ModePayement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.green,
          title: Text(
            "Mode de payement",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 8.0,
            children: [
              InkWell(
                  child: Image.asset('img/om.jpg', fit: BoxFit.fill),
                  onTap: validationPayement),
              InkWell(
                  child: Image.asset('img/eumobile.png', fit: BoxFit.fill),
                  onTap: validationPayement),
              InkWell(
                  child: Image.asset('img/mtnmomo.jpg', fit: BoxFit.fill),
                  onTap: validationPayement),

              // Container(
              //   child: Image.asset('img/possa.PNG', fit: BoxFit.fill),
              // ),
            ],
          ),
        ));
  }

  validationPayement() {
    TextEditingController code;
    simpleDialogueCardSansTitle('Veuillez patienter...', context);
    Timer(Duration(seconds: 1), () => Navigator.pop(context));

    Timer(
        Duration(seconds: 1),
        () => simpleDialogueCardTextField(
            custumTextField(
                code, false, Icon(Icons.phone), "Numero de telephone"),
            context,
            widget.type,
            widget.nomEtprenom,
            widget.nb,
            widget.dropValClss,
            widget.dropValDep,
            widget.dropValDest,
            widget.agence));
  }
}
