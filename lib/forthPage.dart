import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:whether/Customedate.dart';

class forthPage extends StatefulWidget {
  @override
  _forthPageState createState() => _forthPageState();
}

class _forthPageState extends State<forthPage> {
  var _result;
  String myUrl =
      "http://api.openweathermap.org/data/2.5/forecast?id=292223&appid=6f7da9398f13d39116acfe188f142862";
  var temp;
  var Windspeed;
  var humidity;
  Future getData(int time) async {
    http.Response response = await http.get(myUrl);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      setState(() {
        this.temp = result["list"][time]["main"]["temp"];
        this.humidity=result["list"][time]["main"]["humidity"];
        this.Windspeed = result["list"][time]["wind"]["speed"];
        //   SharedPreferences sharedPreferences =
        //     SharedPreferences.getInstance();
        //sharedPreferences.setString("temp", temp);
        // sharedPreferences.setString("Windspeed", Windspeed);
      });
    }
    return false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData(3).then((result) {
      setState(() {
        _result = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_result == null) {
      return drawLoading();
    }
    {
      AlertDialog alert = AlertDialog(
          title: Text("My title"), content: Text("This is my message."));
    }
    double getMaxTemp = temp - 272.5;
    String finalTemp = getMaxTemp.toStringAsFixed(0) ;

    return Scaffold(
      body: Container(
        color: Color(0xff9ce6cd ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.83,
                left: MediaQuery.of(context).size.width * 0.065,
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        "sunny\nday\nwallk",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            letterSpacing: 0.1),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 20),
                  ),
                  Container(
                    height: 350,
                    padding: EdgeInsets.symmetric(vertical:20),
                    child: Image.asset('assets/images/cloudy.png'),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.70,
                left: MediaQuery.of(context).size.width * 0.030,
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right :25.0),
                        child: Text(
                          "Dubai",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              letterSpacing: 0.1),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            finalTemp ,
                            style: TextStyle(

                                color: Colors.white,

                                fontSize: 120,
                                letterSpacing: 0.01
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 60),
                            child: Text( "\u00b0", style: TextStyle(

                                color: Colors.white,

                                fontSize: 60,
                                letterSpacing: 0.01
                            ),),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.10,
                left: MediaQuery.of(context).size.width * 0.50,
                child: Row(
                  children: [
                    Container(
                        width: 120,
                        height: 75,
                        decoration: BoxDecoration(
                          color: Colors.white,

                          boxShadow: [
                            BoxShadow(
                              color: Colors.white70.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:8.0,top: 5),
                              child: Text("Wind" ,style: TextStyle(color: Colors.black45),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:11.0,top: 10),
                              child: Text("${Windspeed.toString()}Km/h" ,style: TextStyle( color: Colors.black54,fontSize: 22.0),),
                            ),
                          ],
                        )
                    ),
                    SizedBox(width: 10,),
                    Container(
                        width: 120,
                        height: 75,
                        decoration: BoxDecoration(
                          color: Colors.white,

                          boxShadow: [
                            BoxShadow(
                              color: Colors.white70.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:8.0,top: 5),
                              child: Text("Humidity" ,style: TextStyle(color: Colors.black45),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:11.0,top: 10),
                              child: Text("${humidity.toString()}%" ,style: TextStyle( color: Colors.black54,fontSize: 22.0),),
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget drawLoading() {
  return Container(
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}
