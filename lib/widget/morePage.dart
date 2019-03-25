import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      title: "",
      home: MorePage(),
    );
  }
}

class MorePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MorePageState();
  }
}

class _MorePageState extends State<MorePage> {
  double appBarAlpha = 0;


  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _ScaffoldKey=GlobalKey<ScaffoldState>();
    //var divideList = ListTile.divideTiles(context: context, tiles: myListTitle).toList();
    // TODO: implement build
    return Scaffold(
      //appBar: AppBar(),
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            removeTop: true,
            removeRight: true,
            removeLeft: true,
            context: context,
            child: NotificationListener(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification &&
                    scrollNotification.depth == 0) {
                  _OnScroll(scrollNotification.metrics.pixels);
                }
              },
              child: Container(
                child: ListView(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        SizedBox(
                          height: 256,
                          child: Image.asset(
                            'lib/image/room_choose_bar.png',
                            fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                        Positioned(
                          top: 80,
                          left: 140,
                          child: ClipOval(
                            //clipBehavior: Clip.antiAlias,
                            child: Image.asset(
                              "lib/image/tx.png",
                              fit: BoxFit.cover,
                              width: 120,
                              height: 120,
                            ),
                          ),
                        ),
                      ],
                    ),
                    getListTitle(0),
                    getListTitle(1),
                    getListTitle(2),
                    getListTitle(3),
                    getListTitle(4),
                    getListTitle(5),
                    Container(
                      child: SizedBox(
                        height: 800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Opacity(
            opacity: appBarAlpha,
            child: SizedBox(
              height: 100,
              child: AppBar(
                title: Text('个人信息'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _OnScroll(double pixels) {
    double alpha = pixels / 180;
    if (alpha > 1) alpha = 1;
    if (alpha < 0) alpha = 0;
    setState(() {
      appBarAlpha = alpha;
    });
  }

  Widget getListTitle(i) {
        return myListTitle[i];
  }
}

 List<Widget> myListTitle = <Widget>[
  ListTile(
    title: Text(
      '用户',
      style: TextStyle(fontSize: 20),
    ),
    leading: Icon(Icons.star_border),
    trailing: Icon(Icons.camera),

  ),
  ListTile(
    title: Text(
      '用户',
      style: TextStyle(fontSize: 20),
    ),
    leading: Icon(Icons.star_border),
    trailing: Icon(Icons.camera),
  ),
  ListTile(
    title: Text(
      '用户',
      style: TextStyle(fontSize: 20),
    ),
    leading: Icon(Icons.star_border),
    trailing: Icon(Icons.camera),
  ),
  ListTile(
    title: Text(
      '用户',
      style: TextStyle(fontSize: 20),
    ),
    leading: Icon(Icons.star_border),
    trailing: Icon(Icons.camera),
  ),
  ListTile(
    title: Text(
      '用户',
      style: TextStyle(fontSize: 20),
    ),
    leading: Icon(Icons.star_border),
    trailing: Icon(Icons.camera),
  ),
  ListTile(
    title: Text(
      '用户',
      style: TextStyle(fontSize: 20),
    ),
    leading: Icon(Icons.star_border),
    trailing: Icon(Icons.camera),
  ),
];
