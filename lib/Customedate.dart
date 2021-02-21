import 'package:flutter/material.dart';

Widget CoustomTime(BuildContext context, String TextToday, String Time) {
  return Row(
    children: <Widget>[
      Container(
        padding: EdgeInsets.all(20.0),
        width: MediaQuery.of(context).size.width * 0.15,
        height: MediaQuery.of(context).size.height * 0.20,
        decoration: BoxDecoration(
            color: Color(0xFF6371AA),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))),
        child: RotatedBox(
          child: Center(
              child: Text(
                TextToday,
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              )),
          quarterTurns: 3,
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width * 0.70,
        height: MediaQuery.of(context).size.height * 0.20,
        decoration: BoxDecoration(
            color: Color(0xFFdadada),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                Time,
                style: TextStyle(
                  color: Color(0xff293242),
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
