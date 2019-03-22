import 'package:flutter/material.dart';

main() => runApp(DevicePageDemo());

class DevicePageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "devicePage",
      theme: ThemeData(),
      home: DevicePage(),
    );
  }
}

class DevicePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DevicePageState();
  }
}

class _DevicePageState extends State<DevicePage> {
  double appBarAlpha = 0;
  double appBarHeight = 260;
  @override
  Widget build(BuildContext context) {
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
                  _OnScroll(scrollNotification.metrics.pixels);
                }
              },
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Center(
                      child: Image.asset(
                        "lib/image/room_choose_bar.png",
                        fit: BoxFit.fill,
                        height: appBarHeight,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                  Container(
                    height: 1800,
                    color: Colors.black54,
                    child: Text('test123456'),
                  ),
                ],
              ),
            ),
          ),
          Opacity(
            opacity: appBarAlpha,
            child: Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    'TEST',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _OnScroll(offset) {
    double alpha = offset / appBarHeight;
    if (alpha < 0) alpha = 0;
    if (alpha > 1) alpha = 1;
    setState(() {
      appBarAlpha = alpha;
    });
  }
}
