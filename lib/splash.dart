import 'dart:async';
import 'package:flutter/material.dart';
import 'package:videoapp/tabbar.dart';

import 'Homepage.dart';
import 'animation.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Tabsbar())));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: size.height,
          color: Colors.cyan,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                color: Colors.white,
                child: const SizedBox.expand(
                  child: VariousDiscs(10),

                ),
              ),

          Text("Videos App",
                     style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold,color: Colors.black// background
                          // foreground


                        ),
                   ),



            ],
          ),

        ),

      ],
    );
  }
}
