import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'who1.dart';
import 'pageviewclass.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> with TickerProviderStateMixin {
  Animation fadeAnimation1;
  AnimationController fadeController1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fadeController1 =
        AnimationController(duration: const Duration(seconds: 6), vsync: this);
    fadeAnimation1 =
        CurvedAnimation(parent: fadeController1, curve: Curves.easeIn);
    fadeController1.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    fadeController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double ewidth = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: new AppBar(
          backgroundColor: Colors.white,
          elevation: 1.5,
          leading: new IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: new SafeArea(
          bottom: true,
          child: new Container(
            padding: EdgeInsets.symmetric(horizontal: 14.0),
            width: ewidth,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                SizedBox(height: 25.0),
                new Row(
                  children: <Widget>[
                    Expanded(
                        child: Column(
                      children: <Widget>[
                        new Container(
                            width: 190.0,
                            height: 190.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: ExactAssetImage('assets/avatar.png'),
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
                SizedBox(height: 20.0),
                new Container(
                  width: ewidth,
                  child: new Text(
                    "Even though I've asking you for subscribing PewDiePie, but the most-important thing is....who exactly is he?",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 17.0),
                  ),
                ),
                SizedBox(height: 25.0),
                new Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: new FadeTransition(
                    opacity: fadeAnimation1,
                    child: new Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          new FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()));
                            },
                            child: Text(
                              "Let's See",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            ),
                            color: Colors.teal,
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
