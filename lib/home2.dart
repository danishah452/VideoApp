
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';
import 'package:videoapp/categoriesmodel.dart';
import 'package:videoapp/videomodel.dart';

import 'Videoitems.dart';

class home2 extends StatefulWidget {
  const home2({Key key}) : super(key: key);

  @override
  _home2State createState() => _home2State();
}

class _home2State extends State<home2> {






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