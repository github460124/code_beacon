import 'package:code_beacon/widget/myInformation/my_page_body.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _myPageState();
  }

}

class _myPageState extends State<MyPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(child: CustomScrollView(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.all(0),
            sliver: SliverList(delegate: SliverChildListDelegate(
                <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 40,left: 10,right: 10),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          MyPageHeader(),
                          MyPageBody(),
                          SizedBox(height: 800,),
                        ],
                      ),
                    ),
                  ),
                ]
            ),
            ),
          ),
        ],
      ),),

    );
  }
}

class MyPageHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(child: Text('NAME',style: TextStyle(fontFamily: 'siyuan',fontSize: 26,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),),
                  Container(child: Text('EDIT PROFILES',style: TextStyle(fontFamily: 'siyuan',fontSize: 16),),),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 20),
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                //child: Image.asset('lib/image/tx.png'),
                backgroundImage: ExactAssetImage('lib/image/tx.png'),
                radius: 30,
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(left: 20,top: 40),
          child:Column(
            children: <Widget>[
              Container(child: Text('LAKE HOUSE SETTINGS',style: TextStyle(fontFamily: 'siyuan',fontSize: 16,color: Colors.grey),),),
              Container(child: Text('You are a house admin',style: TextStyle(fontFamily: 'siyuan',fontSize: 16),),),
            ],
          ),
        ),
        ],
      ),

    );
  }
}