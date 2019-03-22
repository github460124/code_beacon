import 'package:flutter/material.dart';

main() => runApp(ContackPage());

class ContackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Contacks",
      theme: ThemeData(),
      home: ContacksDemo(),
    );
  }

}

class ListItem extends StatelessWidget{

  final IconData leadingIcon;
  final IconData trailingIcon;
  final VoidCallback onTap;
  final String title;

  const ListItem({Key key, this.leadingIcon, this.trailingIcon, this.onTap, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      title: Text(title),
      leading: Icon(leadingIcon),
      trailing: Icon(trailingIcon),
      onTap: onTap,
    );
  }

}

class ContacksDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ContacksDemoState();
  }

}

class _ContacksDemoState extends State<ContacksDemo> {
  final GlobalKey<ScaffoldState> _ScaffoldKey=GlobalKey<ScaffoldState>();
  final double appBarHeight = 200;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Theme(
      data: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
        platform: Theme.of(context).platform,
      ),
      child: Scaffold(
        key: _ScaffoldKey,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: appBarHeight,
              pinned: true,
              actions: <Widget>[

              ],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text('个人信息'),
                background: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.asset('lib/image/room_choose_bar.png',fit: BoxFit.fill,height: appBarHeight,),
                  ],
                ),
              ),
            ),
            SliverList(delegate: SliverChildListDelegate(<Widget>[
              SizedBox(
                height: 1000,
              ),
            ]))
          ],
        ),
      ),
    );
  }
}

