import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class Reason1 extends StatefulWidget {
  @override
  _Reason1State createState() => _Reason1State();
}

class _Reason1State extends State<Reason1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      appBar: new AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "1 / 3",
          style: TextStyle(fontSize: 26.5, color: Colors.black),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 15.0),
      color: Colors.white,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 15.0),
          new Row(
            children: <Widget>[
              Expanded(
                  child: Column(
                children: <Widget>[
                  new Container(
                      width: 205.0,
                      height: 205.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: ExactAssetImage('intro/reason1.jpg'),
                            fit: BoxFit.fill,
                          ),
                          border: new Border.all(
                            color: Colors.black,
                            width: 0.5,
                          ))),
                ],
              ))
            ],
          ),
          SizedBox(height: 25.0),
          new Container(
            width: width,
            child: new Text(
              "Haikal Permana, a 14-years old boy from Indonesia who have a dream to be a programmer, and had switched from Web-programmer to Mobile-developer. He makes this apps because he love watching PewDiePie's videos since 2014. And this is his first project since he started to use Flutter framework.",
              style: TextStyle(fontSize: 17.0),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
