import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart';

void main()=>runApp(LoginWidget());



class LoginWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      title: "LingBo Login",
      home: LoginWidgetView(),
    );
  }

}

class LoginWidgetView extends StatefulWidget{

  final title;

  const LoginWidgetView({Key key, this.title}) : super(key: key);

  @override
  _LoginWidgetViewState createState() => _LoginWidgetViewState();

}

class _LoginWidgetViewState extends State<LoginWidgetView>{


  var a = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: widget.title,),
      body:
      new CustomScrollView(
        shrinkWrap: true,
        // 内容
        slivers: <Widget>[
          new SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: new SliverList(
              delegate: new SliverChildListDelegate(
                <Widget>[
                  Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          padding: EdgeInsets.all(30),
                          child: Column(
                            children: <Widget>[

                              Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(10),
                                width: 160,
                                height: 70,
                                alignment: Alignment.center,
                                child: RaisedButton(
                                  splashColor: Colors.red,
                                  highlightColor: Colors.blue,
                                  disabledColor: Colors.white,
                                  color: Colors.white,
                                  elevation: 10,
                                  onPressed: null,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Icon(Icons.brightness_2,color: Colors.black54,),
                                      Text("Good \nNight",style: TextStyle(color: Colors.black,fontSize: 20),textAlign: TextAlign.start,),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(10),
                                width: 160,
                                height: 70,
                                alignment: Alignment.center,
                                child: RaisedButton(
                                  splashColor: Colors.red,
                                  highlightColor: Colors.blue,
                                  disabledColor: Colors.white,
                                  color: Colors.white,
                                  elevation: 10,
                                  onPressed: null,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Icon(Icons.brightness_2,color: Colors.black54,),
                                      Text("Good \nNight",style: TextStyle(color: Colors.black,fontSize: 20),textAlign: TextAlign.start,),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(10),
                                width: 160,
                                height: 70,
                                alignment: Alignment.center,
                                child: RaisedButton(
                                  splashColor: Colors.red,
                                  highlightColor: Colors.blue,
                                  disabledColor: Colors.white,
                                  color: Colors.white,
                                  elevation: 10,
                                  onPressed: null,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Icon(Icons.brightness_2,color: Colors.black54,),
                                      Text("Good \nNight",style: TextStyle(color: Colors.black,fontSize: 20),textAlign: TextAlign.start,),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(10),
                                width: 160,
                                height: 70,
                                alignment: Alignment.center,
                                child: RaisedButton(
                                  splashColor: Colors.red,
                                  highlightColor: Colors.blue,
                                  disabledColor: Colors.white,
                                  color: Colors.white,
                                  elevation: 10,
                                  onPressed: null,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Icon(Icons.brightness_2,color: Colors.black54,),
                                      Text("Good \nNight",style: TextStyle(color: Colors.black,fontSize: 20),textAlign: TextAlign.start,),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(10),
                                width: 160,
                                height: 70,
                                alignment: Alignment.center,
                                child: RaisedButton(
                                  splashColor: Colors.red,
                                  highlightColor: Colors.blue,
                                  disabledColor: Colors.white,
                                  color: Colors.white,
                                  elevation: 10,
                                  onPressed: null,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Icon(Icons.brightness_2,color: Colors.black54,),
                                      Text("Good \nNight",style: TextStyle(color: Colors.black,fontSize: 20),textAlign: TextAlign.start,),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(10),
                                width: 160,
                                height: 70,
                                alignment: Alignment.center,
                                child: RaisedButton(
                                  splashColor: Colors.red,
                                  highlightColor: Colors.blue,
                                  disabledColor: Colors.white,
                                  color: Colors.white,
                                  elevation: 10,
                                  onPressed: null,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Icon(Icons.brightness_2,color: Colors.black54,),
                                      Text("Good \nNight",style: TextStyle(color: Colors.black,fontSize: 20),textAlign: TextAlign.start,),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(10),
                                width: 160,
                                height: 70,
                                alignment: Alignment.center,
                                child: RaisedButton(
                                  splashColor: Colors.red,
                                  highlightColor: Colors.blue,
                                  disabledColor: Colors.white,
                                  color: Colors.white,
                                  elevation: 10,
                                  onPressed: null,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Icon(Icons.brightness_2,color: Colors.black54,),
                                      Text("Good \nNight",style: TextStyle(color: Colors.black,fontSize: 20),textAlign: TextAlign.start,),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(10),
                                width: 160,
                                height: 70,
                                alignment: Alignment.center,
                                child: RaisedButton(
                                  splashColor: Colors.red,
                                  highlightColor: Colors.blue,
                                  disabledColor: Colors.white,
                                  color: Colors.white,
                                  elevation: 10,
                                  onPressed: null,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Icon(Icons.brightness_2,color: Colors.black54,),
                                      Text("Good \nNight",style: TextStyle(color: Colors.black,fontSize: 20),textAlign: TextAlign.start,),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(10),
                                width: 160,
                                height: 70,
                                alignment: Alignment.center,
                                child: RaisedButton(
                                  splashColor: Colors.red,
                                  highlightColor: Colors.blue,
                                  disabledColor: Colors.white,
                                  color: Colors.white,
                                  elevation: 10,
                                  onPressed: null,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Icon(Icons.brightness_2,color: Colors.black54,),
                                      Text("Good \nNight",style: TextStyle(color: Colors.black,fontSize: 20),textAlign: TextAlign.start,),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(10),
                                width: 160,
                                height: 70,
                                alignment: Alignment.center,
                                child: RaisedButton(
                                  splashColor: Colors.red,
                                  highlightColor: Colors.blue,
                                  disabledColor: Colors.white,
                                  color: Colors.white,
                                  elevation: 10,
                                  onPressed: null,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Icon(Icons.brightness_2,color: Colors.black54,),
                                      Text("Good \nNight",style: TextStyle(color: Colors.black,fontSize: 20),textAlign: TextAlign.start,),
                                    ],
                                  ),
                                ),
                              ),




                              Text("Home",style: TextStyle(color:a? Colors.blue:Colors.grey,fontSize: 20),),
                              Text("Login",style: TextStyle(color: Colors.black,fontSize: 40),),
                              TextField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(3),
                                  icon: Icon(Icons.keyboard,color: Colors.red,),
                                  labelText: "Email",
                                  labelStyle: TextStyle(fontSize: 30),

                                ),
                                style: TextStyle(fontSize: 30,color: Colors.blue),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(3),
                                  icon: Icon(Icons.keyboard,color: Colors.red,),
                                  labelText: "Password",
                                  labelStyle: TextStyle(fontSize: 30),
                                ),
                                obscureText: true,
                                style: TextStyle(fontSize: 30,color: Colors.blue),
                                //textAlign: TextAlign.center,
                              ),
                              Container(
                                child:
                                CheckboxListTile(
                                  title: const Text("Remember me"),

                                  value: a ,
                                  //value: true,

                                  onChanged: (bool value){
                                    setState(() {
                                      a=!a;
                                    });
                                  },
                                ),
                              ),
                              SingleChildScrollView(
                                child: ExpansionPanelList(
                                  children: [
                                    ExpansionPanel(
                                      body: Text("12345"),
                                      headerBuilder: (context,isExpanded){
                                        return Text("12345");
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              /**/

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
