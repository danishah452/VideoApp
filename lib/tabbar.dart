import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Homepage.dart';
import 'home2.dart';
import 'home3.dart';
import 'home4.dart';


class Tabsbar extends StatefulWidget {
  @override
  _TabsbarState createState() => _TabsbarState();
}

class _TabsbarState extends State<Tabsbar> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: DefaultTabController(
                  length: 4,
                  child: Scaffold(
                    appBar: AppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: const Color.fromRGBO(233, 248, 248, 1),
                      bottom: TabBar(
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                              width: 2.0, color: Colors.orange.shade700),
                          insets: EdgeInsets.symmetric(horizontal: 20),
                        ),
                        unselectedLabelColor: Colors.grey.shade500,
                        labelColor: Colors.orange.shade700,
                        labelPadding: EdgeInsets.all(5),
                        indicatorColor: Colors.red,
                        indicatorWeight: 1,
                        tabs: [
                          Tab( icon: Icon(Icons.video_collection),),
                          Tab( icon: Icon(Icons.home)),
                          Tab(icon: Icon(Icons.notification_important)),
                          Tab(icon: Icon(Icons.people)),
                        ],
                      ),
                      title: FittedBox(
                        child: Text("Video App",style: TextStyle(color: Colors.black),
                        ),
                        ),
                      ),

                    body: TabBarView(
                      children: [
                        Container(
                          child: Homepage(),
                        ),
                        // Container(
                        //   child: FilePickerDemo(),
                        // ),
                        // Container(
                        //   child: StockScreen(),
                        // ),
                        Container(
                          child: home2(),
                        ),
                        Container(
                          child: home3(),
                        ),
                        Container(
                          child: home4(),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
