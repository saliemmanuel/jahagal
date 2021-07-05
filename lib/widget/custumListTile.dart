import 'package:flutter/material.dart';

class CustumListTile extends StatelessWidget {
  final String urlImg;
  final String textCard;
  final Function onPressed;

  const CustumListTile({Key key, this.urlImg, this.textCard, this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        child: Card(
          child: Row(
            children: [
              Container(
                  height: 120.0,
                  width: 130.0,
                  child: Image.asset(
                    urlImg,
                    fit: BoxFit.cover,
                  )),
              SizedBox(width: 15.0),
              Text(textCard,
                  style: TextStyle(fontSize: 25.5, fontWeight: FontWeight.bold))
            ],
          ),
        ),
        onTap: onPressed,
      ),
    );
  }
}
