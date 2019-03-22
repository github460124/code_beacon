import 'package:code_beacon/widget/homeChoosePage.dart';
import 'package:code_beacon/widget/homePage.dart';
import 'package:code_beacon/widget/morePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

main() {
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.indigo,
      ),
      home: MainPageControl(),
    );
  }
}

class MainPageControl extends StatefulWidget {
  @override
  _MainPageControlState createState() {
    // TODO: implement createState
    return _MainPageControlState();
  }
}

class _MainPageControlState extends State<MainPageControl> {
  int _CurrentIndex = 0;
  var bottomTitle = ['Home', 'Rooms', 'More'];
  var _pageList = [new HomePage(), new RoomChooseDemo(), new MorePage()];
  var _controller=PageController(initialPage: 0);
  final _DefaultColor=Colors.grey;
  final _ActiveColor=Colors.blue;

  Icon getIcon(int index) {
    switch (index) {
      case 0:
        return Icon(Icons.home);
      case 1:
        return Icon(Icons.room);
      case 2:
        return Icon(Icons.more_horiz);
    }
    //return Icon(Icons.accessibility);
  }

  Text getText(int index) {
    return Text(
      bottomTitle[index],
      style: TextStyle(fontSize: 10, color: Colors.blueGrey),
    );
  }

  @override
  Widget build(BuildContext context)
  {
    // TODO: implement build
    return Scaffold(
      //appBar: AppBar(),
      body: PageView(
        onPageChanged: (int index){setState(() {
          _CurrentIndex = index;
        });},
        physics: ScrollPhysics(),
        //scrollDirection: Axis.horizontal,
        //pageSnapping: true,
        controller: _controller,
        children: <Widget>[
            HomePage(),RoomChooseDemo(),MorePage(),
        ],
        //physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:_CurrentIndex,
        onTap: (index){
          _controller.jumpToPage(index);
          setState(() {
            _CurrentIndex=index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
           BottomNavigationBarItem(
            icon: getIcon(0),
            title: getText(0),
          ),
           BottomNavigationBarItem(
            icon: getIcon(1),
            title: getText(1),
          ),
           BottomNavigationBarItem(
            icon: getIcon(2),
            title: getText(2),
          ),

        ],
        iconSize: 32,
        fixedColor: Colors.indigo,
      ),
    );
  }
}
