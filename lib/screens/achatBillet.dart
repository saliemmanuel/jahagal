import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jahagal/utils/route.dart';
import 'package:jahagal/widget/cardDialogue.dart';

import 'modePayement.dart';

class AchatBillet extends StatefulWidget {
  final String agence;

  const AchatBillet({Key key, this.agence}) : super(key: key);
  @override
  _AchatBilletState createState() => _AchatBilletState();
}

class _AchatBilletState extends State<AchatBillet> {
  List<CustumForme> list = [];
  CustumForme _custumForme = new CustumForme();
  @override
  void initState() {
    list.add(_custumForme);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Achat de billet",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            Column(
              children: list
                  .map((e) => CustumForme(
                        numero: '${list.length}',
                      ))
                  .toList(),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                          color: Colors.indigo,
                          child: Text(
                            "Ajouter une autre personne",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            CustumForme _custumForme = new CustumForme();
                            setState(() {
                              list.add(_custumForme);
                            });
                          }),
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                          color: Colors.green,
                          child: Text(
                            "Finaliser",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () => achat(widget.agence)),
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
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () => Navigator.pop(context)),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  achat(String agence) {
    if (nomEtprenom.text.isEmpty ||
        cni.text.isEmpty ||
        nb.text.isEmpty ||
        dropValClss == "Classe" ||
        dropValDest == "Destinantion" ||
        dropValDep == "Ville depart") {
      errorDialogueCard('Erreur', 'Remplisser tous les champs', context);
    } else if (dropValDest == dropValDep) {
      errorDialogueCard('Erreur',
          'La ville de depart doit être different de la destination', context);
    } else {
      simpleDialogueCardSansTitle('Veuillez patienter...', context);
      Timer(Duration(seconds: 1), () => Navigator.pop(context));
      Timer(
          Duration(seconds: 1),
          () => pushNewPage(
              ModePayement(
                  type: "Achat",
                  dropValClss: dropValClss,
                  dropValDep: dropValDep,
                  nb: nb.text,
                  nomEtprenom: nomEtprenom.text,
                  dropValDest: dropValDest,
                  agence: agence),
              context));

      // Timer(Duration(seconds: 3), () {
      //   errorDialogueCard('Effectuer', 'Achat effectuer.', context)
      //       .then((value) {
      //     nomEtprenom.clear();
      //     cni.clear();
      //     nb.clear();
      //   });
      // });

    }
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
  final String numero;

  const CustumForme({Key key, this.numero}) : super(key: key);
  @override
  _CustumFormeState createState() => _CustumFormeState();
}

TextEditingController nomEtprenom = new TextEditingController();
TextEditingController cni = new TextEditingController();
TextEditingController nb = new TextEditingController();

String dropValClss = "Classe";
String dropValDest = "Destinantion";
String dropValDep = "Ville depart";

class _CustumFormeState extends State<CustumForme> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15.0),
        Text(
            "- - - - - - - - - - - - - -  Coupon numéros :  NOAB25${widget.numero} "),
        SizedBox(height: 15.0),
        custumTextField(
            nomEtprenom, false, Icon(Icons.person), "Nom et Prenom"),
        SizedBox(height: 8.0),
        custumTextField(cni, false, Icon(Icons.payment), "CNI"),
        SizedBox(height: 8.0),
        Card(
          child: Container(
            height: 60.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: Colors.grey)),
            child: Center(
              child: DropdownButton(
                  isExpanded: true,
                  underline: SizedBox(),
                  hint: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.commute,
                          size: 30.0,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 15.0),
                        Text(dropValClss),
                      ],
                    ),
                  ),
                  focusColor: Colors.black,
                  iconEnabledColor: Colors.black,
                  dropdownColor: Colors.white,
                  items: [
                    DropdownMenuItem(
                      child: Text("VIP",
                          style: TextStyle(
                            color: Colors.black,
                          )),
                      value: "VIP",
                    ),
                    DropdownMenuItem(
                      child: Text("Classique",
                          style: TextStyle(
                            color: Colors.black,
                          )),
                      value: "Classique",
                    ),
                  ],
                  onChanged: (s) {
                    setState(() {
                      dropValClss = s;
                    });
                  }),
            ),
          ),
        ),
        SizedBox(height: 8.0),
        Card(
          child: Container(
            height: 60.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: Colors.grey)),
            child: DropdownButton(
                hint: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.time_to_leave,
                        size: 30.0,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 15.0),
                      Text(dropValDep),
                    ],
                  ),
                ),
                isExpanded: true,
                underline: SizedBox(),
                focusColor: Colors.black,
                iconEnabledColor: Colors.black,
                dropdownColor: Colors.white,
                items: [
                  DropdownMenuItem(
                    child: Text("Maroua",
                        style: TextStyle(
                          color: Colors.black,
                        )),
                    value: "Maroua",
                  ),
                  DropdownMenuItem(
                    child: Text("Garoua",
                        style: TextStyle(
                          color: Colors.black,
                        )),
                    value: "Garoua",
                  ),
                  DropdownMenuItem(
                    child: Text("Mokolo",
                        style: TextStyle(
                          color: Colors.black,
                        )),
                    value: "Mokolo",
                  ),
                  DropdownMenuItem(
                    child: Text("Ngaoundere",
                        style: TextStyle(
                          color: Colors.black,
                        )),
                    value: "Ngaoundere",
                  ),
                  DropdownMenuItem(
                    child: Text("Yaounde",
                        style: TextStyle(
                          color: Colors.black,
                        )),
                    value: "Yaounde",
                  ),
                  DropdownMenuItem(
                    child: Text("Bertoua",
                        style: TextStyle(
                          color: Colors.black,
                        )),
                    value: "Bertoua",
                  ),
                ],
                onChanged: (s) {
                  setState(() {
                    dropValDep = s;
                  });
                }),
          ),
        ),
        SizedBox(height: 8.0),
        Card(
          child: Container(
            height: 60.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: Colors.grey)),
            child: DropdownButton(
                hint: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.emoji_transportation,
                        size: 30.0,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 15.0),
                      Text(dropValDest),
                    ],
                  ),
                ),
                isExpanded: true,
                underline: SizedBox(),
                focusColor: Colors.black,
                iconEnabledColor: Colors.black,
                dropdownColor: Colors.white,
                items: [
                  DropdownMenuItem(
                    child: Text("Maroua",
                        style: TextStyle(
                          color: Colors.black,
                        )),
                    value: "Maroua",
                  ),
                  DropdownMenuItem(
                    child: Text("Garoua",
                        style: TextStyle(
                          color: Colors.black,
                        )),
                    value: "Garoua",
                  ),
                  DropdownMenuItem(
                    child: Text("Mokolo",
                        style: TextStyle(
                          color: Colors.black,
                        )),
                    value: "Mokolo",
                  ),
                  DropdownMenuItem(
                    child: Text("Ngaoundere",
                        style: TextStyle(
                          color: Colors.black,
                        )),
                    value: "Ngaoundere",
                  ),
                  DropdownMenuItem(
                    child: Text("Yaounde",
                        style: TextStyle(
                          color: Colors.black,
                        )),
                    value: "Yaounde",
                  ),
                  DropdownMenuItem(
                    child: Text("Bertoua",
                        style: TextStyle(
                          color: Colors.black,
                        )),
                    value: "Bertoua",
                  ),
                ],
                onChanged: (s) {
                  setState(() {
                    dropValDest = s;
                  });
                }),
          ),
        ),
        SizedBox(height: 8.0),
        custumTextField(
            nb, false, Icon(Icons.person_add_alt_1), "Nombre de place"),
        SizedBox(height: 8.0),
      ],
    );
  }
}
