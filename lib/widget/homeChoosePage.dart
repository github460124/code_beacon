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
  primarySwatch: Colors.blue,
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
        /*floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.edit),
          onPressed: () {
            scaffoldKey.currentState.showSnackBar(const SnackBar(
              content: Text('Not supported.'),
            ));
          },
        ),*/
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
      expandedHeight: _kAppBarHeight,
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
      flexibleSpace: LayoutBuilder(
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
              child: Icon(Icons.ac_unit),
            ),
          );
        },
      ),
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
          mainAxisSpacing: 28.0,
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
      MediaQuery.of(context).size.height * 0.3;

  @override
  Widget build(BuildContext context) {
    final double appBarHeight = _getAppBarHeight(context);

    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(  //Hero目标
            top: 0.0,
            left: 0.0,
            right: 0.0,
            height: appBarHeight ,
            child: Hero(
              tag: 'packages/$_codeBeaconPackage/${widget.room.imagePath}',
              child: Image.asset(
                widget.room.imagePath,
                //package: widget.room.imagePackage,
                fit: BoxFit.fill,
              ),
            ),
          ),

          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: appBarHeight - _kFabHalfSize,//展开高度
                backgroundColor: Colors.transparent,
                flexibleSpace: const FlexibleSpaceBar(  //展开区域
                  background: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, -1.0),
                        end: Alignment(0.0, -0.2),
                        colors: <Color>[Color(0x60000000), Color(0x00000000)],
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: 'packages/$_codeBeaconPackage/${room.imagePath}',
              child: AspectRatio(
                aspectRatio: 4.0 / 3.0,
                child: Image.asset(
                  room.imagePath,
                  //'lib/image/room_choose_bar.png',
                  //package: room.imagePackage,
                  fit: BoxFit.fill,
                  semanticLabel: room.name,
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(room.name),
                  Text(room.description),
                ],
              ),
            ),
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

  const Room({
    this.name,
    this.description,
    this.imagePath,
    this.imagePackage,
  });
}

const List<Room> roomInformationList = <Room>[
  Room(
    name: "客厅",
    description: '这是一个客厅',
    imagePath: 'lib/image/room_choose_hall.png',
    imagePackage: _codeBeaconPackage,
  ),
  Room(
    name: "卧室1",
    description: '这是卧室1',
    imagePath: 'lib/image/room_choose_bedroom.png',
    imagePackage: _codeBeaconPackage,
  ),
  Room(
    name: "卧室2",
    description: '这是卧室2',
    imagePath: 'lib/image/room_choose_bedroom02.png',
    imagePackage: _codeBeaconPackage,
  ),
  Room(
    name: "厨房",
    description: '这是厨房',
    imagePath: 'lib/image/room_choose_cookroom.png',
    imagePackage: _codeBeaconPackage,
  ),
  Room(
    name: "吧台",
    description: '这是吧台',
    imagePath: 'lib/image/room_choose_bar.png',
    imagePackage: _codeBeaconPackage,
  ),
];
