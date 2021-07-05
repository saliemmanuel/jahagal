import 'package:flutter/material.dart';
import 'package:jahagal/models/colisModels.dart';
import 'package:jahagal/utils/globalVar.dart';
import 'package:jahagal/widget/cardDialogue.dart';

class EnvoiColis extends StatefulWidget {
  final String agence;

  const EnvoiColis({Key key, this.agence}) : super(key: key);
  @override
  _EnvoiColisState createState() => _EnvoiColisState();
}

class _EnvoiColisState extends State<EnvoiColis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Envoyer un colis",
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
  TextEditingController nature = new TextEditingController();
  TextEditingController des = new TextEditingController();
  TextEditingController code = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        custumTextField(
            nature, false, Icon(Icons.brunch_dining), "Nature colis"),
        SizedBox(height: 8.0),
        custumTextField(des, false, Icon(Icons.info), "Description"),
        SizedBox(height: 8.0),
        custumTextField(code, false, Icon(Icons.security), "Code du colis"),
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
                        // simpleDialogueCard  simpleDialogueCardSansTitle
                        if (nature.text.isEmpty ||
                            des.text.isEmpty ||
                            code.text.isEmpty)
                          errorDialogueCard(
                              'Erreur', 'Renseigner tous les champs', context);
                        else
                          errorDialogueCard(
                                  'Effectuer',
                                  'Votre colis à été pris en charge pour l\'envoi',
                                  context)
                              .then((value) {
                            Colis newColis = new Colis(
                                codeColis: code.text,
                                descriptionColis: des.text,
                                natureColis: nature.text,
                                status: "Pas livré");

                            listColis.add(newColis);
                            nature.clear();
                            des.clear();
                            code.clear();
                          });
                      }),
                ),
                SizedBox(width: 10.5),
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
      ],
    );
  }
}
