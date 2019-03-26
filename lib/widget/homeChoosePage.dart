import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

main() {
  runApp(RoomChooseDemo());
}

class RoomChooseDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RoomChooseHome();
  }
}

const String _codeBeaconPackage = 'code_beacon';
const String _kSmallLogoImage = 'logos/pesto/logo_small.png';
const double _kAppBarHeight = 128.0;
const double _kFabHalfSize =
    28.0; // TODO(mpcomplete): needs to adapt to screen size
const double _kRecipePageMaxWidth = 500.0;

final Set<Room> _favoriteRecipes = Set<Room>();

final ThemeData _mTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  accentColor: Colors.redAccent,
);

class RoomChooseHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RoomChoosePage(
      roomInfoList: roomInformationList,
    );
  }
}

class RoomChoosePage extends StatefulWidget {
  final List<Room> roomInfoList;

  const RoomChoosePage({Key key, this.roomInfoList}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RoomChoosePageState();
  }
}

class _RoomChoosePageState extends State<RoomChoosePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top; //状态栏高度
    // TODO: implement build
    return Theme(
      data: _mTheme.copyWith(platform: Theme.of(context).platform),
      child: Scaffold(
        key: scaffoldKey,
        body: CustomScrollView(
          semanticChildCount: widget.roomInfoList.length,
          slivers: <Widget>[
            _buildAppBar(context, statusBarHeight),
            _buildBody(context, statusBarHeight),
          ],
        ),
      ),
    );
  }

  _buildAppBar(BuildContext context, statusBarHeight) {
    return SliverAppBar(
      pinned: true,
      //expandedHeight: _kAppBarHeight,
      title: Text('All Rooms'),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          tooltip: 'Search',
          onPressed: () {
            scaffoldKey.currentState.showSnackBar(
              const SnackBar(
                content: Text('Not supported.'),
              ),
            );
          },
        ),
      ],
      /*flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final Size size = constraints.biggest;
          final double appBarHeight = size.height - statusBarHeight;
          final double t = (appBarHeight - kToolbarHeight) /
              (_kAppBarHeight - kToolbarHeight);
          final double extraPadding =
              Tween<double>(begin: 10.0, end: 24.0).transform(t);
          final double logoHeight = appBarHeight - 1.5 * extraPadding;
          return Padding(
            padding: EdgeInsets.only(
              top: statusBarHeight + 0.5 * extraPadding,
              bottom: extraPadding,
            ),
            child: Center(
              child: Text(
                '所有房间',
                style: TextStyle(fontSize: 26),
              ),
            ),
          );
        },
      ),*/
    );
  }

  _buildBody(BuildContext context, statusBarHeight) {
    final EdgeInsets mediaPadding = MediaQuery.of(context).padding;
    final EdgeInsets padding = EdgeInsets.only(
        top: 8.0,
        left: 8.0 + mediaPadding.left,
        right: 8.0 + mediaPadding.right,
        bottom: 8.0);
    return SliverPadding(
      padding: padding,
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: _kRecipePageMaxWidth,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 18.0,
          childAspectRatio: 1.7,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final Room room = widget.roomInfoList[index];
            return RoomCard(
              room: room,
              onTap: () {
                showRoomPage(context, room);
                print("showRecipepage");
              },
            );
          },
          childCount: widget.roomInfoList.length,
        ),
      ),
    );
  }
}

showRoomPage(BuildContext context, Room room) {
  Navigator.push(
    context,
    MaterialPageRoute(
      settings: RouteSettings(name: '/RoomChoose'),
      builder: (BuildContext context) {
        return Theme(
          data: _mTheme.copyWith(platform: Theme.of(context).platform),
          child: RoomPage(
            room: room,
          ),
        );
      },
    ),
  );
}

class RoomPage extends StatefulWidget {
  final Room room;

  const RoomPage({Key key, this.room}) : super(key: key);
  @override
  _RoomePageState createState() {
    // TODO: implement createState
    return _RoomePageState();
  }
}

class _RoomePageState extends State<RoomPage> {
  double _getAppBarHeight(BuildContext context) =>
      MediaQuery.of(context).size.height * 0.2;
  bool isFavorite = false;
  bool light1 = true;
  bool light2 = false;
  bool light3 = true;
  bool light4 = false;
  double buttonBoxHeight = 90;

  double appBarAlpha = 0;

  @override
  Widget build(BuildContext context) {
    final double appBarHeight = _getAppBarHeight(context);

    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: NotificationListener(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification &&
                    scrollNotification.depth == 0) {
                  _OnScrool(scrollNotification.metrics.pixels);
                }
              },
              child: ListView(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      SizedBox(
                        //Hero目标
                        //top: 0.0,
                        //left: 0.0,
                        //right: 0.0,
                        height: appBarHeight,
                        width: MediaQuery.of(context).size.width,
                        child: Hero(
                          tag:
                              'packages/$_codeBeaconPackage/${widget.room.imagePath}',
                          child: Image.asset(
                            widget.room.imagePath,
                            //package: widget.room.imagePackage,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120,
                        right: 16.0,
                        child: FloatingActionButton(
                            child: Icon(isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border),
                            onPressed: () {
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                            }),
                      ),
                    ],
                  ),

                  Container(
                    padding: const EdgeInsets.only(top: _kFabHalfSize),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${widget.room.name}',
                              style: TextStyle(fontSize: 28),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  '温度：${widget.room.temperature}℃     ',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  '湿度：${widget.room.humidity}℃',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Text(
                              '设备',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.all(8),
                                          child: SizedBox(
                                            height: buttonBoxHeight,
                                            child: RaisedButton(
                                              onPressed: () {
                                                setState(() {
                                                  light1 = !light1;
                                                });
                                              },
                                              splashColor: light1
                                                  ? Colors.grey
                                                  : Colors.amber,
                                              elevation: 5,
                                              color: Colors.white,
                                              child: Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.lightbulb_outline,
                                                      color: light1
                                                          ? Colors.amber
                                                          : Colors.grey,
                                                    ),
                                                    Text(light1
                                                        ? '灯光全开'
                                                        : '灯光全关'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.all(8),
                                          child: SizedBox(
                                            height: buttonBoxHeight,
                                            child: RaisedButton(
                                              onPressed: () {
                                                setState(() {
                                                  light2 = !light2;
                                                });
                                              },
                                              splashColor: light2
                                                  ? Colors.grey
                                                  : Colors.amber,
                                              elevation: 5,
                                              color: Colors.white,
                                              child: Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.lightbulb_outline,
                                                      color: light2
                                                          ? Colors.amber
                                                          : Colors.grey,
                                                    ),
                                                    Text(
                                                      light2 ? '灯光全开' : '灯光全关',
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.all(8),
                                          child: SizedBox(
                                            height: buttonBoxHeight,
                                            child: RaisedButton(
                                              onPressed: () {
                                                setState(() {
                                                  light3 = !light3;
                                                });
                                              },
                                              splashColor: light3
                                                  ? Colors.grey
                                                  : Colors.amber,
                                              elevation: 5,
                                              color: Colors.white,
                                              child: Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.lightbulb_outline,
                                                      color: light3
                                                          ? Colors.amber
                                                          : Colors.grey,
                                                    ),
                                                    Text(light3
                                                        ? '灯光全开'
                                                        : '灯光全关'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.all(8),
                                          child: SizedBox(
                                            height: buttonBoxHeight,
                                            child: RaisedButton(
                                              onPressed: () {
                                                setState(() {
                                                  light4 = !light4;
                                                });
                                              },
                                              splashColor: light4
                                                  ? Colors.grey
                                                  : Colors.amber,
                                              elevation: 5,
                                              color: Colors.white,
                                              child: Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.lightbulb_outline,
                                                      color: light4
                                                          ? Colors.amber
                                                          : Colors.grey,
                                                    ),
                                                    Text(light4
                                                        ? '灯光全开'
                                                        : '灯光全关'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.fromLTRB(5, 20, 5, 0),
                            child: Text(
                              '房间场景',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: SizedBox(
                                          height: buttonBoxHeight,
                                          child: Card(
                                            elevation: 5,
                                            child: Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 4,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons
                                                              .lightbulb_outline,
                                                          color:
                                                              widget.room.light
                                                                  ? Colors.amber
                                                                  : Colors.grey,
                                                        ),
                                                        Text('灯光'),
                                                        Text('灯光已打开'),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: IconButton(
                                                        icon: Icon(Icons.menu),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          height: buttonBoxHeight,
                                          child: Card(
                                            elevation: 5,
                                            child: Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 4,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons
                                                              .lightbulb_outline,
                                                          color:
                                                              widget.room.light
                                                                  ? Colors.amber
                                                                  : Colors.grey,
                                                        ),
                                                        Text('灯光'),
                                                        Text('灯光已打开'),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Icon(Icons.menu),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: SizedBox(
                                          height: buttonBoxHeight,
                                          child: Card(
                                            elevation: 5,
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.lightbulb_outline,
                                                    color: widget.room.light
                                                        ? Colors.amber
                                                        : Colors.grey,
                                                  ),
                                                  Text('灯光全开'),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          height: buttonBoxHeight,
                                          child: Card(
                                            elevation: 5,
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.lightbulb_outline,
                                                    color: widget.room.light
                                                        ? Colors.amber
                                                        : Colors.grey,
                                                  ),
                                                  Text('灯光全开'),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: IconButton(
                                          icon: Icon(Icons.ac_unit),
                                          onPressed: null,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 6,
                                        child: Text(
                                          '设置温度:${widget.room.temperature}℃',
                                          style: TextStyle(fontSize: 18),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: IconButton(
                                            icon: Icon(Icons.menu),
                                            onPressed: null),
                                      ),
                                    ],
                                  ),
                                  width: 300,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                        width: 300,
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: IconButton(
                                                icon: Icon(Icons.add),
                                                onPressed: null,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Expanded(
                                              child: IconButton(
                                                icon: Icon(Icons.add),
                                                onPressed: null,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 800,
                  )
                ],
              ),
            ),
          ),
          Opacity(
            opacity: appBarAlpha,
            child: SizedBox(
              height: 110,
              child: AppBar(
                centerTitle: true,
                title: Text('${widget.room.name}',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _OnScrool(double pixels) {
    double alpha = pixels / 90;
    if (alpha > 1) alpha = 1;
    if (alpha < 0) alpha = 0;
    setState(() {
      appBarAlpha = alpha;
    });
  }
}

Widget RoomInfo(Room room) {
  return Container(
    margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
    child: Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            '${room.name}',
            style: TextStyle(fontSize: 28),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(5, 20, 5, 0),
          child: Row(
            children: <Widget>[
              Text(
                '温度：${room.temperature}℃     ',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '湿度：${room.humidity}℃',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(5, 20, 5, 0),
          child: Text(
            '设备',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
          child: Center(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 90,
                        child: RaisedButton(
                          onPressed: () {},
                          elevation: 5,
                          color: Colors.white,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(
                                  Icons.lightbulb_outline,
                                  color:
                                      room.light ? Colors.amber : Colors.grey,
                                ),
                                Text('灯光全开'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 90,
                        child: Card(
                          elevation: 5,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(
                                  Icons.lightbulb_outline,
                                  color:
                                      room.light ? Colors.amber : Colors.grey,
                                ),
                                Text('灯光全开'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 90,
                        child: Card(
                          elevation: 5,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(
                                  Icons.lightbulb_outline,
                                  color:
                                      !room.light ? Colors.amber : Colors.grey,
                                ),
                                Text(!room.light ? '灯光全开' : '灯光全关'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 90,
                        child: Card(
                          elevation: 5,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(
                                  Icons.lightbulb_outline,
                                  color:
                                      !room.light ? Colors.amber : Colors.grey,
                                ),
                                Text(!room.light ? '灯光全开' : '灯光全关'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(5, 20, 5, 0),
          child: Text(
            '房间场景',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
          child: Center(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 90,
                        child: Card(
                          elevation: 5,
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Icon(
                                        Icons.lightbulb_outline,
                                        color: room.light
                                            ? Colors.amber
                                            : Colors.grey,
                                      ),
                                      Text('灯光'),
                                      Text('灯光已打开'),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.topRight,
                                    child: Icon(Icons.menu),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 90,
                        child: Card(
                          elevation: 5,
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Icon(
                                        Icons.lightbulb_outline,
                                        color: room.light
                                            ? Colors.amber
                                            : Colors.grey,
                                      ),
                                      Text('灯光'),
                                      Text('灯光已打开'),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.topRight,
                                    child: Icon(Icons.menu),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 90,
                        child: Card(
                          elevation: 5,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(
                                  Icons.lightbulb_outline,
                                  color:
                                      room.light ? Colors.amber : Colors.grey,
                                ),
                                Text('灯光全开'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 90,
                        child: Card(
                          elevation: 5,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(
                                  Icons.lightbulb_outline,
                                  color:
                                      room.light ? Colors.amber : Colors.grey,
                                ),
                                Text('灯光全开'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(Icons.ac_unit),
                        onPressed: null,
                        alignment: Alignment.center,
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Text(
                        '设置温度:${room.temperature}℃',
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child:
                          IconButton(icon: Icon(Icons.menu), onPressed: null),
                    ),
                  ],
                ),
                width: 300,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 300,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: null,
                              color: Colors.grey,
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: null,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 400,
        ),
      ],
    ),
  );
}

class RoomCard extends StatelessWidget {
  final Room room;
  final VoidCallback onTap;
  const RoomCard({Key key, this.room, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)),),
        elevation: 5,
        semanticContainer: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: 'packages/$_codeBeaconPackage/${room.imagePath}',
              child: Container(
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      room.imagePath,
                      //'lib/image/room_choose_bar.png',
                      //package: room.imagePackage,
                      fit: BoxFit.fill,
                      semanticLabel: room.name,
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 200,
                margin: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        room.name,
                        style: TextStyle(fontSize: 28),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '温度：${room.temperature}℃     ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '湿度：${room.humidity}℃',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '灯光${room.light ? '已打开' : '未打开'}          ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '窗帘${room.curtains ? '已打开' : '未打开'}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Room {
  final String name;
  final String description;
  final String imagePath;
  final String imagePackage;
  final double temperature;
  final double humidity;
  final bool light;
  final bool curtains;
  final bool isFavorite;

  const Room(
      {this.name,
      this.description,
      this.imagePath,
      this.imagePackage,
      this.temperature,
      this.humidity,
      this.curtains,
      this.light,
      this.isFavorite});
}

const List<Room> roomInformationList = <Room>[
  Room(
    name: "客厅",
    description: '这是一个客厅',
    imagePath: 'lib/image/room_choose_hall.png',
    imagePackage: _codeBeaconPackage,
    temperature: 24,
    humidity: 60,
    curtains: true,
    light: true,
    isFavorite: true,
  ),
  Room(
    name: "卧室1",
    description: '这是卧室1',
    imagePath: 'lib/image/room_choose_bedroom.png',
    imagePackage: _codeBeaconPackage,
    temperature: 28,
    humidity: 66,
    curtains: true,
    light: true,
    isFavorite: true,
  ),
  Room(
    name: "卧室2",
    description: '这是卧室2',
    imagePath: 'lib/image/room_choose_bedroom02.png',
    imagePackage: _codeBeaconPackage,
    temperature: 24,
    humidity: 74,
    curtains: true,
    light: true,
    isFavorite: true,
  ),
  Room(
    name: "厨房",
    description: '这是厨房',
    imagePath: 'lib/image/room_choose_cookroom.png',
    imagePackage: _codeBeaconPackage,
    temperature: 26,
    humidity: 77,
    curtains: true,
    light: true,
    isFavorite: true,
  ),
  Room(
    name: "吧台",
    description: '这是吧台',
    imagePath: 'lib/image/room_choose_bar.png',
    imagePackage: _codeBeaconPackage,
    temperature: 25,
    humidity: 65,
    curtains: true,
    light: true,
    isFavorite: true,
  ),
];
