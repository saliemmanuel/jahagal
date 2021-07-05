import 'package:flutter/material.dart';

class WorkScreenWidget extends StatelessWidget {
  final String title;
  final Color colorIcon;
  final IconData icon;
  final Function onPressed;

  const WorkScreenWidget(
      {Key key, this.title, this.colorIcon, this.icon, this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Row(
          children: [
            Container(
              height: 90.0,
              width: 100.0,
              color: Colors.black,
              child: Center(child: Icon(icon, size: 75.0, color: colorIcon)),
            ),
            SizedBox(width: 15.0),
            Text(title,
                style: TextStyle(fontSize: 25.5, fontWeight: FontWeight.bold))
          ],
        ),
      ),
      onTap: onPressed,
    );
  }
}
