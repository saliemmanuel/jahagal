import 'package:flutter/material.dart';
import 'package:jahagal/utils/globalVar.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Detail billet",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: listBiA.isEmpty
            ? Card(child: Text("Aucun billet trouvé"))
            : ListView.builder(
                itemCount: listBiA == null ? 0 : listBiA.length,
                itemBuilder: (_, i) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                          "Coupon numéros :  NOAB25$i\nAgence : ${listBiA[i]['agence']}\nType : ${listBiA[i]['type']}\nNom et prenom : ${listBiA[i]['nomEtprenom']}\nNombre de place : ${listBiA[i]['nb']}\nClasse : ${listBiA[i]['dropValClss']}\nVille depart : ${listBiA[i]['dropValDep']}\nDestination : ${listBiA[i]['dropValDest']}"),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

class Detail2 extends StatefulWidget {
  @override
  _Detail2State createState() => _Detail2State();
}

class _Detail2State extends State<Detail2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Detail billet",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: listBiR.isEmpty
            ? Card(child: Text("Aucun billet trouvé"))
            : ListView.builder(
                itemCount: listBiR == null ? 0 : listBiR.length,
                itemBuilder: (_, i) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                          "Coupon numéros :  NOAB25$i\n Agence : ${listBiA[i]['agence']}\nType : ${listBiR[i]['type']}\nNom et prenom : ${listBiR[i]['nomEtprenom']}\nNombre de place : ${listBiR[i]['nb']}\nClasse : ${listBiR[i]['dropValClss']}\nVille depart : ${listBiR[i]['dropValDep']}\nDestination : ${listBiR[i]['dropValDest']}"),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
