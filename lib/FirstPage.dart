import 'package:flutter/material.dart';
import 'package:whether/Customedate.dart';
import 'package:whether/SecondPage.dart';
import 'package:whether/Third.dart';
import 'package:whether/forthPage.dart';

import 'package:intl/intl.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    Duration DUR = new Duration(days: 1);
    Duration DUR2 = new Duration(days: 2);
    String tomorrow = DateFormat('yyyy-MM-dd').format(now.add(DUR));
    String AfterTom = DateFormat('yyyy-MM-dd').format(now.add(DUR2));
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          ColorFiltered(
            child: Image.asset(
              "assets/images/bg.jfif",
              scale: 5,
              fit: BoxFit.cover,
            ),
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.85,
            left: MediaQuery.of(context).size.width * 0.065,
            child: Container(
              child: Text(
                "Dubai",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    decoration: TextDecoration.underline,
                    letterSpacing: 2.0),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.72,
            left: MediaQuery.of(context).size.width * 0.065,
            child: Container(
              child: Text(
                "Welcome\nYour weather app",
                style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    letterSpacing: 0.1),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.045,
            right: MediaQuery.of(context).size.width * 0.05,
            child: Container(
              child: Column(
                children: [
                  FlatButton(
                    child: CoustomTime(
                        context, "Today's date", formattedDate.toString()),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondPage()),
                      );
                    },
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  FlatButton(
                    child: CoustomTime(context, "Tomorrow's date ", tomorrow),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => thirdPage()),
                      );
                    },
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  FlatButton(
                    child: CoustomTime(context, "after tomorrow", AfterTom),
                    onPressed: () async {
                      var response = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => forthPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
