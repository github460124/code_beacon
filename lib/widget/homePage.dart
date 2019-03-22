import 'package:code_beacon/widget/device_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

main() {
  debugPaintSizeEnabled = false;
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
        primarySwatch: Colors.indigo,
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
  var isCold = true;
  var test = 1;

  bool sences1 = true;
  bool sences2 = false;
  bool sences3 = false;
  bool sences4 = false;

  void _iconButtonPressRediusTemperature() {
    //减少温度

    if (progress >= 1 / 48) progress -= 1 / 48;
    setState(() {});
  }

  void _iconButtonPressAddTemperature() {
    //增加温度
    if (progress <= 1 - 1 / 48) progress += 1 / 48;
    setState(() {
      test++;
      print(this.widget);
    });
    //this.progressChanged(progress);
    print('button2 pressed-----');
  }

  void _iconButtonPressSetCold() {
    setState(() {
      isCold = !isCold;
    });
    print('button3 pressed-----');
  }

  @override
  void initState() {
    super.initState();
    print('InitState here---');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('首页'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(<Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: getTopFrame(),
                      ),
                      Container(
                        child: getHomeScnes(),
                      ),
                      Container(
                        child: getSecurityView(),
                      ),
                      Container(
                        child: getMonitorView(),
                      ),
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

  Widget getTopFrame() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Card(
              elevation: 5,
              clipBehavior: Clip.antiAlias,
              //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Image.asset(
                'lib/image/bkg.png',
                fit: BoxFit.cover,
                color: Colors.white,
                colorBlendMode: BlendMode.colorBurn,
              ),
            ),
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
              "家庭场景",
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
                SizedBox(
                  height: 90,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              color: Colors.white,
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 90,
                                child: RaisedButton(
                                  //padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                                  splashColor:
                                      sences1 ? Colors.amber : Colors.grey,
                                  //highlightColor: Colors.blue,
                                  disabledColor: Colors.white,
                                  color: Colors.white,
                                  elevation: 10,
                                  onPressed: () {
                                    setState(() {
                                      sences1 = true;
                                      sences2 = false;
                                      sences3 = false;
                                      sences4 = false;
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Icon(
                                        Icons.wb_sunny,
                                        color: sences1
                                            ? Colors.yellow
                                            : Colors.grey,
                                      ),
                                      Text("早上好",
                                          style: TextStyle(
                                              color: sences1
                                                  ? Colors.black
                                                  : Colors.grey,
                                              fontSize: 18),
                                          textAlign: TextAlign.start),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                        Expanded(
                          child: Container(
                              color: Colors.white,
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 90,
                                child: RaisedButton(
                                  //padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                                  splashColor:
                                      sences2 ? Colors.blue : Colors.grey,
                                  //highlightColor: Colors.blue,
                                  disabledColor: Colors.white,
                                  color: Colors.white,
                                  elevation: 10,
                                  onPressed: () {
                                    setState(() {
                                      sences1 = false;
                                      sences2 = true;
                                      sences3 = false;
                                      sences4 = false;
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Icon(
                                        Icons.brightness_2,
                                        color:
                                            sences2 ? Colors.blue : Colors.grey,
                                      ),
                                      Text(
                                        "晚上好",
                                        style: TextStyle(
                                            color: sences2
                                                ? Colors.black
                                                : Colors.grey,
                                            fontSize: 18),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 90,
                  child: Container(
                    padding: EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 90,
                              child: RaisedButton(
                                //padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                                splashColor:
                                    sences3 ? Colors.amber : Colors.grey,
                                highlightColor: Colors.blue,
                                disabledColor: Colors.white,
                                color: Colors.white,
                                elevation: 10,
                                onPressed: () {
                                  setState(() {
                                    sences1 = false;
                                    sences2 = false;
                                    sences3 = true;
                                    sences4 = false;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Icon(
                                      Icons.accessibility,
                                      color:
                                          sences3 ? Colors.amber : Colors.grey,
                                    ),
                                    Text("回家",
                                        style: TextStyle(
                                            color: sences3
                                                ? Colors.black
                                                : Colors.grey,
                                            fontSize: 18),
                                        textAlign: TextAlign.start),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 90,
                              child: RaisedButton(
                                //padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                                splashColor:
                                    sences4 ? Colors.amber : Colors.grey,
                                highlightColor: Colors.blue,
                                disabledColor: Colors.white,
                                color: Colors.white,
                                elevation: 10,
                                onPressed: () {
                                  setState(() {
                                    sences1 = false;
                                    sences2 = false;
                                    sences3 = false;
                                    sences4 = true;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Icon(
                                      Icons.departure_board,
                                      color:
                                          sences4 ? Colors.amber : Colors.grey,
                                    ),
                                    Text(
                                      "出行",
                                      style: TextStyle(
                                        color: sences4
                                            ? Colors.black
                                            : Colors.grey,
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
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
              "安防设备",
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
                Card(
                  elevation: 5,
                  child: SizedBox(
                    height: 180,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Icon(
                                  Icons.enhanced_encryption,
                                  color: Colors.amber,
                                ),
                                flex: 3,
                              ),
                              Expanded(
                                child: Text('已布防'),
                                flex: 1,
                              ),
                              Expanded(
                                child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.grey,
                                    ),
                                    onPressed: _showBottomSheetCallback),
                                flex: 2,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(
                                        Icons.enhanced_encryption,
                                        color: Colors.amber,
                                      ),
                                      onPressed: null,
                                    ),
                                    Text('布防'),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(
                                        Icons.enhanced_encryption,
                                        color: Colors.grey,
                                      ),
                                      onPressed: null,
                                    ),
                                    Text('撤防'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: SizedBox(
                    height: 180,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Icon(
                                  Icons.enhanced_encryption,
                                  color: Colors.amber,
                                ),
                                flex: 3,
                              ),
                              Expanded(
                                child: Text('已布防'),
                                flex: 1,
                              ),
                              Expanded(
                                child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.grey,
                                    ),
                                    onPressed: null),
                                flex: 2,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(
                                        Icons.enhanced_encryption,
                                        color: Colors.amber,
                                      ),
                                      onPressed: null,
                                    ),
                                    Text('布防'),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(
                                        Icons.enhanced_encryption,
                                        color: Colors.grey,
                                      ),
                                      onPressed: null,
                                    ),
                                    Text('撤防'),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
    );
  }

  Widget getMonitorView() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            //title
            alignment: Alignment.topLeft,
            child: Text(
              "监控",
              style: TextStyle(fontSize: 20, color: Colors.blueGrey),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Card(
              elevation: 5,
              child: SizedBox(
                height: 180,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Icon(Icons.enhanced_encryption),
                            flex: 3,
                          ),
                          Expanded(
                            child: Text('6个摄像头正在工作'),
                            flex: 1,
                          ),
                          Expanded(
                            flex: 2,
                            child: IconButton(
                                icon: Icon(Icons.arrow_forward),
                                onPressed: ShowModleButtomSheet),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Card(
                      child: Image.asset('lib/image/bkg.png'),
                    )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  ShowModleButtomSheet() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
              color: Colors.black54,
              child: SizedBox(
                child: Container(
                  child: Card(
                    color: Colors.white,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 0, 15, 0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    'First Floor Climate',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  flex: 10,
                                ),
                                Expanded(
                                  child: IconButton(
                                      icon: Icon(Icons.menu), onPressed: () {}),
                                  flex: 2,
                                ),
                                Expanded(
                                  child: IconButton(
                                      icon: Icon(Icons.clear),
                                      onPressed: () {}),
                                  flex: 2,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Sences',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Card(
                                        elevation: 5,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Expanded(
                                                child: Container(
                                                  padding:
                                                      EdgeInsets.only(top: 5),
                                                  child: Text(
                                                    '26℃',
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                  alignment:
                                                      Alignment.bottomRight,
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  padding:
                                                      EdgeInsets.only(top: 5),
                                                  child: Text(
                                                    ' COLD',
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ),
                                    Expanded(
                                      child: Card(
                                        elevation: 5,

                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Expanded(
                                                child: Container(
                                                  padding:
                                                      EdgeInsets.only(top: 5),
                                                  child: Text(
                                                    '26℃',
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                  alignment:
                                                      Alignment.bottomRight,
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  padding:
                                                      EdgeInsets.only(top: 5),
                                                  child: Text(
                                                    '  AutoMode',
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: CircleProgressBar(
                                radius: 100.0,
                                dotColor: Colors.pink,
                                dotRadius: 18.0,
                                shadowWidth: 2.0,
                                progress: progress,
                                progressChanged: (value) {
                                  setState(() {
                                    progress = value;
                                    print(
                                        "Progress on setState:-------$progress");
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
        });
  }
}
