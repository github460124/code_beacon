import 'package:flutter/material.dart';

class MyPageBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _myPageBody();
  }
}

class _myPageBody extends State<MyPageBody> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return myListTitle[index];
      },
      itemCount: myListTitle.length,
    );
  }
}

 const double listTitleSize = 20;  //标题字体大小
 const double listSubtitleSize =16 ; //副标题大小
 const double listTitlePaddingTop =30;  //填充间距
 const double listTitleDividerHe = 1; //分割线高度

 List<Widget> myListTitle = <Widget>[
  Container(
    padding: EdgeInsets.only(top: listTitlePaddingTop),
    child: GestureDetector(
      onTap: () {
        print('tap 000');
      },
      child: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                'Users',
                style: TextStyle(fontSize: listTitleSize),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(
              color: Colors.grey,
              height: listTitleDividerHe,
              indent: 0,
            ),
          ],
        ),
      ),
    ),
  ),
  Container(
    padding: EdgeInsets.only(top: listTitlePaddingTop),
    child: GestureDetector(
      onTap: () {
        print('tap 000');
      },
      child: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                'Automation',
                style: TextStyle(fontSize: listTitleSize),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(
              color: Colors.grey,
              height: listTitleDividerHe,
              indent: 0,
            ),
          ],
        ),
      ),
    ),
  ),
  Container(
    padding: EdgeInsets.only(top: listTitlePaddingTop),
    child: GestureDetector(
      onTap: () {
        print('tap 000');
      },
      child: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                'Notifactions',
                style: TextStyle(fontSize: listTitleSize),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(
              color: Colors.grey,
              height: listTitleDividerHe,
              indent: 0,
            ),
          ],
        ),
      ),
    ),
  ),
  Container(
    padding: EdgeInsets.only(top: listTitlePaddingTop),
    child: GestureDetector(
      onTap: () {
        print('tap 000');
      },
      child: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                'Licence',
                style: TextStyle(fontSize: listTitleSize),
              ),
              subtitle: Text('Standard (no remote access)'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(
              color: Colors.grey,
              height: listTitleDividerHe,
              indent: 0,
            ),
          ],
        ),
      ),
    ),
  ),
  Container(
    child: Text(
      "about LingBo",
      style: TextStyle(color: Colors.grey, fontFamily: 'siyuan', fontSize: 16),
    ),
    padding: EdgeInsets.only(top: 60, left: 20),
  ),
  Container(
    padding: EdgeInsets.only(top: listTitlePaddingTop),
    child: GestureDetector(
      onTap: () {
        print('tap 000');
      },
      child: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                'About LingBo',
                style: TextStyle(fontSize: listTitleSize),
              ),
              leading: Icon(Icons.star_border),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(
              color: Colors.grey,
              height: listTitleDividerHe,
              indent: 0,
            ),
          ],
        ),
      ),
    ),
  ),
  Container(
    padding: EdgeInsets.only(top: listTitlePaddingTop),
    child: GestureDetector(
      onTap: () {
        print('tap 000');
      },
      child: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                'Legal',
                style: TextStyle(fontSize: listTitleSize),
              ),
              leading: Icon(Icons.star_border),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(
              color: Colors.grey,
              height: listTitleDividerHe,
              indent: 0,
            ),
          ],
        ),
      ),
    ),
  ),
];
