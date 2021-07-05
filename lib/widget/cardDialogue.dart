import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jahagal/utils/globalVar.dart';

Future simpleDialogueCard(String title, String msg, BuildContext context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 15.0),
              Text(msg)
            ],
          ),
        );
      });
}

Future simpleDialogueCardSansTitle(String msg, BuildContext context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 15.0),
              Text(msg)
            ],
          ),
        );
      });
}

Future errorDialogueCard(String title, String msg, BuildContext context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            TextButton(
              child: Text("Ok"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      });
}

Future simpleDialogueCardTextField(
    Widget textField,
    BuildContext context,
    String type,
    String nomEtprenom,
    String nb,
    String dropValClss,
    String dropValDep,
    String dropValDest,
    String agence) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: textField,
          actions: [
            MaterialButton(
              color: Colors.green,
              child: Text("Confirmer"),
              onPressed: () {
                Timer(Duration(seconds: 1), () => Navigator.pop(context));
                simpleDialogueCardSansTitle('Veuillez patienter...', context);
                Timer(Duration(seconds: 1), () => Navigator.pop(context));
                if (type == "Achat") {
                  var newList = [
                    {
                      "type": type,
                      "nomEtprenom": nomEtprenom,
                      "nb": nb,
                      "dropValClss": dropValClss,
                      "dropValDep": dropValDep,
                      "dropValDest": dropValDest,
                      "agence": agence,
                    }
                  ];
                  listBiA.addAll(newList);
                  Timer(
                      Duration(seconds: 1),
                      () => errorDialogueCard(
                          'Effectuer', '$type effectuer.', context));
                } else {
                  var newList = [
                    {
                      "type": type,
                      "nomEtprenom": nomEtprenom,
                      "nb": nb,
                      "dropValClss": dropValClss,
                      "dropValDep": dropValDep,
                      "dropValDest": dropValDest,
                      "agence": agence,
                    }
                  ];
                  listBiR.addAll(newList);
                  Timer(
                      Duration(seconds: 1),
                      () => errorDialogueCard(
                          'Effectuer', '$type effectuer.', context));
                }
              },
            ),
            MaterialButton(
              color: Colors.red,
              child: Text("Annuler"),
              onPressed: () => Navigator.pop(context),
            ),
            SizedBox(width: 10.5),
          ],
        );
      });
}
