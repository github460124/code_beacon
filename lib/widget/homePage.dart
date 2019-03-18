import 'package:code_beacon/widget/device_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

main() {
  //debugPaintSizeEnabled = true;
  runApp(MyApp());
}

typedef SetProgress<double> = void Function(double value);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  final title;


  const HomePage({Key key, this.title}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var isExpandedTemp = false;
  VoidCallback _showBottomSheetCallback;
  double progress = 0.0;
  var isCold=true;
  var test=1;

  void _iconButtonPressRediusTemperature(){//减少温度

    if(progress >= 1 / 48)
      progress -=1/48;
    setState(() {

    });

  }

  void _iconButtonPressAddTemperature(){//增加温度
    if(progress <= 1-1/48)
      progress +=1/48;
    setState(() {
      test++;
      print(this.widget);
    });
    //this.progressChanged(progress);
    print('button2 pressed-----');
  }
  void _iconButtonPressSetCold(){
    setState(() {
      isCold = !isCold;
    });
    print('button3 pressed-----');
  }
  void _iconButtonPressSetAuto(){
    print('button3 pressed-----');
  }
  void _iconButtonPressSetHot(){
    print('button3 pressed-----');
  }
  void _iconButtonPressSpeedLow(){
    print('button3 pressed-----');
  }
  void _iconButtonPressSpeedMid(){
    print('button3 pressed-----');
  }
  void _iconButtonPressSpeedHigh(){
    print('button3 pressed-----');
  }
  void _iconButtonPressOn(){
    print('button3 pressed-----');
  }
  void _iconButtonPressOff(){
    print('button3 pressed-----');
  }

  @override
  void initState() {
    super.initState();
    print('InitState here---');
    _showBottomSheetCallback = _showBottomSheet;
  }

  _showBottomSheet() {
    setState(() {
      print(this.widget);
      // disable the button
      _showBottomSheetCallback = null;
    });
    _scaffoldKey.currentState
        .showBottomSheet<void>((BuildContext context) {
          final ThemeData themeData = Theme.of(context);
          return Container(
            decoration: BoxDecoration(
                border:
                    Border(top: BorderSide(color: themeData.disabledColor))),
            child: getBottomSheet(),
            /*Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                  'This is a Material persistent bottom sheet. Drag downwards to dismiss it.',
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: themeData.accentColor, fontSize: 24.0)),
            ),
            */
          );
        })
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              // re-enable the button
              _showBottomSheetCallback = _showBottomSheet;
            });
          }
        });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(<Widget>[
                Container(
                  //padding: EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: getTopFrame(),
                      ),
                      Container(
                        child: getHomeScnes(),
                        //padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      ),
                      Container(
                        child: getSecurityView(),
                      ),
                      /*Containe r(
                        child: getBottomSheet(),
                      ),*/
                    ],
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }

  expansionCallback(context, temp) {
    print("press panel");
    setState(() {
      if (isExpandedTemp == temp) isExpandedTemp = !isExpandedTemp;
    });
  }

  _onPressed04() {}

  _onPressed03() {}

  _onPressed02() {}

  _onPressed01() {}

  final String _ItemValue1 = "Iten one";
  final String _ItemValue2 = "Iten two";
  final String _ItemValue3 = "Iten three";
  String isItemChecked = "Item one";

  _OnSelectedItem(String value) {
    setState(() {
      isItemChecked = value;
    });
  }

  Widget getTopFrame() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          /*
          SingleChildScrollView(  //
            padding: EdgeInsets.all(10),
            child: ExpansionPanelList(
              children: [
                ExpansionPanel(
                  body: Text("City Home"),
                  headerBuilder: (context,isExpanded){
                    return Text("12345");
                  },
                  isExpanded: isExpandedTemp,
                ),
              ],
              expansionCallback: expansionCallback,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: RaisedButton(
              padding: EdgeInsets.all(0),
              elevation: 0,
              color: Colors.white,
              onPressed: _onHomeChoose,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "City Home",
                    style: TextStyle(fontSize: 36, color: Colors.black54,),
                    textAlign: TextAlign.start,
                  ),
                  Icon(
                    Icons.expand_more,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          */
          Container(
            child: ListTile(
                title: Text("$isItemChecked"),
                trailing: PopupMenuButton(
                  onSelected: _OnSelectedItem,
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuItem<String>>[
                        CheckedPopupMenuItem(
                          value: _ItemValue1,
                          checked: isItemChecked == _ItemValue1 ? true : false,
                          child: Text("$_ItemValue1 "),
                        ),
                        CheckedPopupMenuItem(
                          value: _ItemValue2,
                          child: Text("$_ItemValue2 "),
                          checked: isItemChecked == _ItemValue2 ? true : false,
                        ),
                        CheckedPopupMenuItem(
                          value: _ItemValue3,
                          child: Text("$_ItemValue3 "),
                          checked: isItemChecked == _ItemValue3 ? true : false,
                        ),
                      ],
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Text(
              "this is discribe,this is discribe,this is discribe,this is discribe,this is discribe,",
              style: TextStyle(fontSize: 18, color: Colors.black26),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Image.asset(
                'lib/image/bkg.png',
                fit: BoxFit.cover,
                color: Colors.white,
                colorBlendMode: BlendMode.colorBurn,
              ),
            ),
            /*child: Card(
              elevation: 20,
              shape: RoundedRectangleBorder(),
              child: Image.asset('lib/image/bkg.jpg',fit: BoxFit.cover,color: Colors.white,colorBlendMode: BlendMode.colorBurn,),
            ),*/
          ),
        ],
      ),
    );
  }

  Widget getHomeScnes() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            //margin: EdgeInsets.only(top: 16),
            child: Text(
              "HOME SENCE",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20, color: Colors.blueGrey),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            color: Colors.white,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      width: 160,
                      height: 90,
                      alignment: Alignment.center,
                      child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                        splashColor: Colors.red,
                        highlightColor: Colors.blue,
                        disabledColor: Colors.white,
                        color: Colors.white,
                        elevation: 10,
                        onPressed: _showBottomSheetCallback,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Icons.wb_sunny,
                              color: Colors.yellow,
                            ),
                            Text("早上好",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                                textAlign: TextAlign.start),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      //padding: EdgeInsets.all(10),
                      width: 160,
                      height: 90,
                      alignment: Alignment.center,
                      child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                        splashColor: Colors.red,
                        highlightColor: Colors.blue,
                        disabledColor: Colors.white,
                        color: Colors.white,
                        elevation: 10,
                        onPressed: _onPressed02,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Icons.brightness_2,
                              color: Colors.black54,
                            ),
                            Text(
                              "晚上好",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        //padding: EdgeInsets.all(10),
                        width: 160,
                        height: 90,
                        alignment: Alignment.center,
                        child: RaisedButton(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                          splashColor: Colors.red,
                          highlightColor: Colors.blue,
                          disabledColor: Colors.white,
                          color: Colors.white,
                          elevation: 10,
                          onPressed: _onPressed03,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                Icons.accessibility,
                                color: Colors.blue,
                              ),
                              Text("回家",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  textAlign: TextAlign.start),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        //padding: EdgeInsets.all(10),
                        width: 160,
                        height: 90,
                        alignment: Alignment.center,
                        child: RaisedButton(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                          splashColor: Colors.red,
                          highlightColor: Colors.blue,
                          disabledColor: Colors.white,
                          color: Colors.white,
                          elevation: 10,
                          onPressed: _onPressed04,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                Icons.departure_board,
                                color: Colors.redAccent,
                              ),
                              Text(
                                "出行",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getSecurityView() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            //title
            alignment: Alignment.topLeft,
            child: Text(
              "HOME SECURITY",
              style: TextStyle(fontSize: 20, color: Colors.blueGrey),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            color: Colors.white,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      width: 160,
                      height: 90,
                      alignment: Alignment.center,
                      child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                        splashColor: Colors.red,
                        highlightColor: Colors.blue,
                        disabledColor: Colors.white,
                        color: Colors.white,
                        elevation: 10,
                        onPressed: _onPressed01,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Icons.wb_sunny,
                              color: Colors.yellow,
                            ),
                            Text("早上好",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                                textAlign: TextAlign.start),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      //padding: EdgeInsets.all(10),
                      width: 160,
                      height: 90,
                      alignment: Alignment.center,
                      child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                        splashColor: Colors.red,
                        highlightColor: Colors.blue,
                        disabledColor: Colors.white,
                        color: Colors.white,
                        elevation: 10,
                        onPressed: _onPressed02,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Icons.brightness_2,
                              color: Colors.black54,
                            ),
                            Text(
                              "晚上好",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        //padding: EdgeInsets.all(10),
                        width: 160,
                        height: 90,
                        alignment: Alignment.center,
                        child: RaisedButton(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                          splashColor: Colors.red,
                          highlightColor: Colors.blue,
                          disabledColor: Colors.white,
                          color: Colors.white,
                          elevation: 10,
                          onPressed: _onPressed03,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                Icons.accessibility,
                                color: Colors.blue,
                              ),
                              Text("回家",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  textAlign: TextAlign.start),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        //padding: EdgeInsets.all(10),
                        width: 160,
                        height: 90,
                        alignment: Alignment.center,
                        child: RaisedButton(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                          splashColor: Colors.red,
                          highlightColor: Colors.blue,
                          disabledColor: Colors.white,
                          color: Colors.white,
                          elevation: 10,
                          onPressed: _onPressed04,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                Icons.departure_board,
                                color: Colors.redAccent,
                              ),
                              Text(
                                "出行",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getBottomSheet(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('${(16+progress * 16.0).round()}',style: TextStyle(fontSize: 60.0),),
                    Text(' ℃',style: TextStyle(fontSize: 30),),
                  ],
                ),
                new Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: new Column(
                    children: <Widget>[
                      Icon(Icons.ac_unit,color: isCold? Colors.red:Colors.blue,),
                    ],
                  ),
                ),
                new Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: new Column(
                    children: <Widget>[
                      Text(isCold? "COLD":"HOT",style: TextStyle(fontSize: 20),),
                    ],
                  ),
                ),
              ],
            ),

            CircleProgressBar(
              radius: 120.0,
              dotColor: Colors.pink,
              dotRadius: 18.0,
              shadowWidth: 2.0,
              progress:  progress,
              progressChanged: (value) {
                setState(() {
                  print('Circlebar---${this.widget}');
                  progress = value;
                  print("Progress on setState:-------$progress");
                });
              },
            ),

          ],
        ),

        new Container(
          margin: EdgeInsets.fromLTRB(0, 50, 0, 50),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              // 第一行按钮
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 30, 10),
                    child: RaisedButton(
                      child: new Icon(Icons.arrow_back_ios),
                      onPressed: _iconButtonPressRediusTemperature,
                      highlightColor: Colors.blue,
                      splashColor: Colors.blue,
                      elevation: 10,
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
                    child:  Text(
                      "Temp",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.fromLTRB(30, 10, 0, 10),
                    child: RaisedButton(
                      onPressed: _iconButtonPressAddTemperature,
                      child: Icon(Icons.arrow_forward_ios),
                      highlightColor: Colors.blue,
                      splashColor: Colors.blue,
                      elevation: 10,
                    ),
                  ),
                ],
              ),


              //第二行按钮
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: RaisedButton(
                      onPressed: _iconButtonPressSetCold,
                      child: Icon(Icons.ac_unit,color: isCold? Colors.red:Colors.blue,),

                      highlightColor: isCold? Colors.blue:Colors.red,
                      splashColor: isCold? Colors.blue:Colors.red,
                      elevation: 10,
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: RaisedButton(
                      onPressed: _iconButtonPressSetAuto,
                      child: Icon(Icons.ac_unit),
                      highlightColor: Colors.red,
                      splashColor: Colors.red,
                      elevation: 10,
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: RaisedButton(
                      onPressed: _iconButtonPressSetHot,
                      child: Icon(Icons.ac_unit),
                      highlightColor: Colors.red,
                      splashColor: Colors.red,
                      elevation: 10,
                    ),
                  ),
                ],
              ),

              //第三行按钮
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: RaisedButton(
                      onPressed: _iconButtonPressSpeedLow,
                      child: Icon(Icons.ac_unit),
                      highlightColor: Colors.red,
                      splashColor: Colors.red,
                      elevation: 10,
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: RaisedButton(
                      onPressed: _iconButtonPressSpeedMid,
                      child: Icon(Icons.ac_unit),
                      highlightColor: Colors.red,
                      splashColor: Colors.red,
                      elevation: 10,
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: RaisedButton(
                      onPressed: _iconButtonPressSpeedHigh,
                      child: Icon(Icons.ac_unit),
                      highlightColor: Colors.red,
                      splashColor: Colors.red,
                      elevation: 10,
                    ),
                  ),
                ],
              ),


              //第四行按钮
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 60, 10),
                    child: RaisedButton(
                      color: Colors.blue,
                      onPressed: _iconButtonPressOn,
                      child: Icon(Icons.alarm_on),
                      highlightColor: Colors.red,
                      splashColor: Colors.red,
                      elevation: 10,
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.fromLTRB(60, 10, 20, 10),
                    child: RaisedButton(
                      color: Colors.red,
                      onPressed: _iconButtonPressOff,
                      child: Icon(Icons.alarm_off),
                      highlightColor: Colors.blue,
                      splashColor: Colors.blue,
                      elevation: 10,
                    ),
                  ),
                ],
              ),

              Text('$test'),
            ],
          ),
        ),
      ],
    );
  }
}
