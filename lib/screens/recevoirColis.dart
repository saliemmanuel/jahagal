import 'package:flutter/material.dart';
import 'package:jahagal/models/colisModels.dart';
import 'package:jahagal/utils/globalVar.dart';
import 'package:jahagal/widget/cardDialogue.dart';

class RecevoirColis extends StatefulWidget {
  @override
  _RecevoirColisState createState() => _RecevoirColisState();
}

class _RecevoirColisState extends State<RecevoirColis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Recevoir un colis",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [SizedBox(height: 15.0), CustumForme()],
        ),
      ),
    );
  }
}

Widget custumTextField(TextEditingController controller, bool isPass,
    Icon prefixIcon, String hintText) {
  return Card(
    child: TextField(
      controller: controller,
      obscureText: isPass ? true : false,
      enableSuggestions: true,
      cursorColor: Colors.black,
      autocorrect: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          prefixIcon: prefixIcon,
          hintText: hintText,
          alignLabelWithHint: true),
    ),
  );
}

class CustumForme extends StatefulWidget {
  @override
  _CustumFormeState createState() => _CustumFormeState();
}

class _CustumFormeState extends State<CustumForme> {
  TextEditingController code = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        custumTextField(
            code, false, Icon(Icons.person), "Entrer le code du colis"),
        SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                      color: Colors.green,
                      child: Text(
                        "Valider",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        listColisRec.clear();
                        if (code.text.isEmpty) {
                          errorDialogueCard(
                              "Erreur", "Entre le code svp", context);
                        } else {
                          listColis.forEach((element) {
                            if (code.text == element.codeColis) {
                              Colis newColis = new Colis(
                                  codeColis: element.codeColis,
                                  descriptionColis: element.descriptionColis,
                                  natureColis: element.natureColis,
                                  status: element.status);
                              setState(() {
                                listColisRec.add(newColis);
                              });
                            }
                          });
                        }
                      }),
                ),
                SizedBox(
                  width: 10.5,
                ),
                Expanded(
                    child: MaterialButton(
                        color: Colors.red,
                        child: Text(
                          "Annuler",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () => Navigator.pop(context))),
              ]),
        ),
        listColisRec == null
            ? SizedBox()
            : Column(
                children: [
                  SizedBox(width: 20.5),
                  Text("- - - - - - - - - - - - - -"),
                  Column(
                    children: listColisRec.map((e) {
                      return Column(
                        children: [
                          ListTile(title: Text("Code colis : ${e.codeColis}")),
                          ListTile(
                              title: Text("Nature colis : ${e.natureColis}")),
                          ListTile(
                              title: Text(
                                  "Description colis : ${e.descriptionColis}")),
                          ListTile(title: Text("Status : ${e.status}"))
                        ],
                      );
                    }).toList(),
                  ),
                ],
              )
      ],
    );
  }
}
