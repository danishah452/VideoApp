
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';
import 'package:videoapp/categoriesmodel.dart';
import 'package:videoapp/videomodel.dart';

import 'Videoitems.dart';

class home4 extends StatefulWidget {
  const home4({Key key}) : super(key: key);

  @override
  _home4State createState() => _home4State();
}

class _home4State extends State<home4> {






  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color.fromRGBO(233, 248, 248, 1),

      ),
    );
  }




}