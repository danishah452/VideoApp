



import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';
import 'package:videoapp/categoriesmodel.dart';
import 'package:videoapp/videomodel.dart';

import 'Videoitems.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Videos> data = <Videos>[];
  List<Categories> data1 = <Categories>[];

  String getDateAndTime(String rawDateAndTime) {
    var rawDate = DateTime.tryParse(rawDateAndTime);
    var formatter = DateFormat.yMMMMd('en_US');
    String formatted = formatter.format(rawDate);
    print("Date  in date formate: $formatted");

    return formatted;
  }

  String substring(int startIndex, [int endIndex]) {
    // TODO: implement substring
    throw UnimplementedError();
  }

  // String token = "d09b6845d531f06a3bd43bf9f2f8050db0a44102";
  // dynamic data1;
  //
  // Future<Categories?> AllCategories() async {
  //   try {
  //     final httpResponse = await http.get(Uri.parse(
  //         "https://services-pro.youonline.online/api/get_all_categories/"
  //     ), headers: {
  //       'Accept': 'application/json',
  //       'Authorization': 'Token d09b6845d531f06a3bd43bf9f2f8050db0a44102',
  //     });
  //
  //     print(
  //         'PP: Before Get Request in calling Ledger method, url: $httpResponse');
  //     if (httpResponse.statusCode == 200) {
  //       final parsed = json.decode(httpResponse.body);
  //       var convertDataToJson = jsonDecode(httpResponse.body);
  //       data1 = convertDataToJson;
  //       log('Parsed; $parsed');
  //       log('url is: ${httpResponse.request}');
  //       log('url is: ${httpResponse.body}');
  //       print(parsed);
  //       return parsed;
  //     }
  //   }
  //   catch (e) {
  //     log(e.toString());
  //     return null;
  //   }
  // }
  //

  Future<Videos> getvideosData() async {
    try {
      final httpResponse = await http.get(
          Uri.parse(
              "https://services-pro.youonline.online/api/get_all_video_posts/"),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Token d09b6845d531f06a3bd43bf9f2f8050db0a44102',
          });

      if (httpResponse.statusCode == 200) {
        Videos Vid = Videos.fromJson(
          json.decode(httpResponse.body),
        );
        if (kDebugMode) {
          print(httpResponse.body);
        }
        return Vid;
      } else {
        return null;
      }
    } catch (e) {
      log('Error in catch: ${e.toString()}');
      return null;
    }
  }


  Future<Categories> getcategoryData() async {
    try {
      final httpResponse = await http.get(
          Uri.parse(
              "https://services-pro.youonline.online/api/get_all_categories/"),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Token d09b6845d531f06a3bd43bf9f2f8050db0a44102',
          });

      if (httpResponse.statusCode == 200) {
        Categories Vid1 = Categories.fromJson(
          json.decode(httpResponse.body),
        );
        if (kDebugMode) {
          print(httpResponse.body);
        }
         return Vid1;
      } else {
        return null;
      }
    } catch (e) {
      log('Error in catch: ${e.toString()}');
      return null;
    }
  }






  @override
  void initState() {
     getcategoryData();
     getvideosData();
     VideoItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color.fromRGBO(233, 248, 248, 1),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(6, 10, 6, 0),
          child: Column(
            children: [
              Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Watch",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 10,),

              Container(
                height: 60,
                  // width: 600,
                  child: Category()),
SizedBox(height: 10,),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text("All Videos",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              //   ],
              // ),
          Container(
            height: MediaQuery.of(context).size.height*0.69,
            // width: 600,
            child:
              AllVideos(),),
            ],
          ),

        ),
      ),
    );
  }
  Widget Category(){
    return  FutureBuilder<Categories>(
        future: getcategoryData(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data.response.message.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Colors.grey.shade500,
                  child: SingleChildScrollView(

                    child: Row(

                      children: [
                        MaterialButton(

                          child: Text(
                            snapshot.data.response.message[index].title.toString(),style: TextStyle(color: Colors.black),
                          ),
                        ),


                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }


  Widget AllVideos(){
    return FutureBuilder<Videos>(
        future: getvideosData(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return ListView.builder(
              itemCount: 6,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Card(
                  color: const Color.fromRGBO(233, 248, 248, 1),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [


                        Container(
                          height: MediaQuery.of(context).size.height*0.3,

                          child: VideoItems(
                            videoPlayerController: VideoPlayerController.network(
                              snapshot.data.results[index].media[0].video.toString(),
                            ),
                            looping: true,
                            autoplay: true,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(8,0,8,8),
                          child: Container(
                            height: 30,
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(360.0),
                                  child: Image.network(
                                    "${snapshot.data.results[index].media[0].vidThumbnail.toString()}",
                                  ),
                                ),
                                SizedBox(width: 45),
                                Text(
                                  "${snapshot.data.results[index].media[0].description.substring(3,15).trimRight().toString()}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                                ),

                              ],
                            ),
                          ),
                        ),
                        Row(
mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text(
                              "${getDateAndTime(snapshot.data.results[index].media[0].createdAt.toString())}",
                            ),
                            SizedBox(width: 20,),
                            Text(
                              "${snapshot.data.results[index].media[0].totalViews.toString()} Views",
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }


}
