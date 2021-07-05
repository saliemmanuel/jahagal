import 'package:flutter/material.dart';
import 'package:jahagal/screens/workScreen.dart';
import 'package:jahagal/utils/route.dart';

import 'custumListTile.dart';

class HomeScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          CustumListTile(
            urlImg: 'img/danay.jpg',
            textCard: 'Danay Express',
            onPressed: () => pushNewPage(
                WorkScreen(
                  nomAgenceSelectionner: 'Danay Express',
                ),
                context),
          ),
          CustumListTile(
            urlImg: 'img/touris.jpg',
            textCard: 'Touristique Express',
            onPressed: () => pushNewPage(
                WorkScreen(
                  nomAgenceSelectionner: 'Touristique Express',
                ),
                context),
          ),
          CustumListTile(
            urlImg: 'img/diama.jpg',
            textCard: 'Diamaré Express',
            onPressed: () => pushNewPage(
                WorkScreen(
                  nomAgenceSelectionner: 'Diamarer Express',
                ),
                context),
          ),
        ],
      ),
    );
  }
}
