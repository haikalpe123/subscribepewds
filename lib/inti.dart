import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'who1.dart';
import 'donateme.dart';
import 'opening.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

class Intiq extends StatefulWidget {
  @override
  _IntiqState createState() => _IntiqState();
}

class _IntiqState extends State<Intiq> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  static final MobileAdTargetingInfo mobileAdTargetingInfo =
      MobileAdTargetingInfo(
          keywords: ['Games', 'Puzzle', 'Poker', 'Hell'], testDevices: []);

  InterstitialAd _interstitialAd;
  BannerAd _bannerAd;

  InterstitialAd buildInterstitialAd() {
    return new InterstitialAd(
        adUnitId: InterstitialAd.testAdUnitId,
        targetingInfo: mobileAdTargetingInfo,
        listener: (MobileAdEvent event) {
          if (event == MobileAdEvent.failedToLoad) {
            _interstitialAd..load();
          } else if (event == MobileAdEvent.closed) {
            _interstitialAd = buildInterstitialAd()..load();
          }
          print(event);
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    _interstitialAd = buildInterstitialAd()..load();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _interstitialAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double swpHeight = height * 0.27;

    List<String> images = [
      "assets/tes.jpg",
      "assets/lake.jpg",
      "assets/tes2.jpg",
      "assets/tes3.jpg",
    ];

    _launchURL() async {
      const url = 'https://www.youtube.com/user/PewDiePie';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    _launchURL1() async {
      const url1 = 'https://twitter.com/pewdiepie';
      if (await canLaunch(url1)) {
        await launch(url1);
      } else {
        throw 'Could not launch $url1';
      }
    }

    _launchURL2() async {
      const url2 = 'https://www.instagram.com/pewdiepie/';
      if (await canLaunch(url2)) {
        await launch(url2);
      } else {
        throw 'Could not launch $url2';
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: IconButton(
            icon: Icon(
              Icons.view_headline,
              color: Colors.black,
            ),
            onPressed: () => _scaffoldKey.currentState.openDrawer()),
      ),
      body: new ConstrainedBox(
        constraints: BoxConstraints(),
        child: ListView(
          children: <Widget>[
            new Container(
              width: width,
              height: 1250.0,
              color: Color(0xFFFAFAFA),
              child: Padding(
                padding: const EdgeInsets.only(top: 66.0),
                child: Column(
                  children: <Widget>[
                    //WIDGET WIDGET
                    new AspectRatio(
                      aspectRatio: 1.75,
                      child: new Container(
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            image: DecorationImage(
                                image: AssetImage('assets/inti.jpg'))),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    new Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Text(
                                "Have you",
                                style: TextStyle(
                                    fontSize: 25.0, color: Colors.black),
                              ),
                              new Text(
                                "subscribe PewDiePie?",
                                style: TextStyle(
                                    fontSize: 25.0, color: Colors.black),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 8.0),
                    //YES
                    new Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68.0),
                      child: new Row(
                        children: <Widget>[
                          new Expanded(
                              child: Container(
                            height: 52.0,
                            padding: EdgeInsets.only(right: 7.0),
                            child: GestureDetector(
                              onTap: () {
                                _interstitialAd
                                  ..load()
                                  ..show();
                                yesDialog(context);
                              },
                              child: Card(
                                elevation: 2.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.teal,
                                      borderRadius: BorderRadius.circular(2.2)),
                                  //PASANG CHILD COLUMN UNTUK TEKS DAN LOGO
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Text(
                                        'Yes',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22.4),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )),
                          new Expanded(
                              child: Container(
                            height: 52.0,
                            margin: EdgeInsets.only(left: 7.0),
                            child: GestureDetector(
                              onTap: () {
                                noDialog(context);
                              },
                              child: Card(
                                elevation: 2.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlueAccent,
                                      borderRadius: BorderRadius.circular(2.2)),
                                  //PASANG CHILD COLUMN UNTUK TEKS DAN LOGO
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Text(
                                        'No',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22.4),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Divider(),
                    SizedBox(height: 15.0),
                    //NO
                    new Padding(
                      padding: const EdgeInsets.only(left: 13.0, bottom: 1.0),
                      child: new Row(
                        children: <Widget>[
                          Text(
                            "Three Reason",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Circularmedium',
                              fontSize: 24.0,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 9.0),
                    //NO1
                    new Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9.0),
                      child: GestureDetector(
                        onTap: () {
                          showAlertDialog(context);
                        },
                        child: new Card(
                          elevation: 3.0,
                          child: new Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFFF1744),
                                borderRadius: BorderRadius.circular(4.0)),
                            child: _listTile(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    //No2
                    new Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9.0),
                      child: GestureDetector(
                        onTap: () {
                          _interstitialAd
                            ..load()
                            ..show();
                          showAlertDialog1(context);
                        },
                        child: new Card(
                          elevation: 3.0,
                          child: new Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF40C4FF),
                                borderRadius: BorderRadius.circular(4.0)),
                            child: _listTile1(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    //NO3
                    new Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9.0),
                      child: GestureDetector(
                        onTap: () {
                          showAlertDialog2(context);
                        },
                        child: new Card(
                          elevation: 3.0,
                          child: new Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFE040FB),
                                borderRadius: BorderRadius.circular(4.0)),
                            child: _listTile2(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 22.0),
                    Divider(),
                    SizedBox(height: 15.0),
                    new Padding(
                      padding: const EdgeInsets.only(left: 13.0, bottom: 1.0),
                      child: new Row(
                        children: <Widget>[
                          Text(
                            'Follow & Subscribe Him',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontFamily: 'Circularmedium',
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 15.0),
                    new Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: new Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          new Expanded(
                              child: AspectRatio(
                            aspectRatio: 1.12,
                            child: GestureDetector(
                              onTap: () {
                                _launchURL();
                              },
                              child: Container(
                                height: 52.0,
                                margin: EdgeInsets.only(right: 5.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(2.2)),
                                  //PASANG CHILD COLUMN UNTUK TEKS DAN LOGO
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      new Padding(
                                        padding: const EdgeInsets.only(
                                            right: 21.0, bottom: 19.0),
                                        child: new IconButton(
                                            icon: Icon(
                                              MdiIcons.youtube,
                                              size: 54.0,
                                              color: Colors.white,
                                              textDirection: TextDirection.ltr,
                                            ),
                                            onPressed: null),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )),
                          new Expanded(
                              child: AspectRatio(
                            aspectRatio: 1.12,
                            child: GestureDetector(
                              onTap: () {
                                _launchURL1();
                              },
                              child: Container(
                                height: 52.0,
                                margin: EdgeInsets.only(right: 2.5, left: 2.5),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(2.2),
                                  ),
                                  //PASANG CHILD COLUMN UNTUK TEKS DAN LOGO
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      new Padding(
                                        padding: const EdgeInsets.only(
                                            right: 21.0, bottom: 19.0),
                                        child: new IconButton(
                                            icon: Icon(
                                              MdiIcons.twitter,
                                              size: 54.0,
                                              color: Colors.white,
                                              textDirection: TextDirection.ltr,
                                            ),
                                            onPressed: null),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )),
                          new Expanded(
                              child: AspectRatio(
                            aspectRatio: 1.12,
                            child: GestureDetector(
                              onTap: () {
                                _launchURL2();
                              },
                              child: Container(
                                height: 52.0,
                                margin: EdgeInsets.only(left: 5.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.purpleAccent,
                                      borderRadius: BorderRadius.circular(2.2)),
                                  //PASANG CHILD COLUMN UNTUK TEKS DAN LOGO
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      new Padding(
                                        padding: const EdgeInsets.only(
                                            right: 21.0, bottom: 19.0),
                                        child: new IconButton(
                                            icon: Icon(
                                              MdiIcons.instagram,
                                              size: 54.0,
                                              color: Colors.white,
                                              textDirection: TextDirection.ltr,
                                            ),
                                            onPressed: null),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                    SizedBox(height: 22.0),
                    Divider(),
                    SizedBox(height: 15.0),
                    new Container(
                      height: swpHeight,
                      child: new Swiper(
                        itemCount: 4,
                        autoplay: true,
                        viewportFraction: 0.76,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(images[index]),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 2.0,
                                    offset: Offset(2.0, 2.0),
                                  )
                                ]),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 7.0),
                    new Container(
                      width: width,
                      child: new Text(
                        "This apps is currently in beta version.",
                        style: TextStyle(fontSize: 15.0, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    )

                    //JANGAN DI APA_APAIN
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      drawer: new Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new DrawerHeader(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Container(
                      width: 110.0,
                      height: 110.0,
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
                  SizedBox(height: 9.0),
                  Text(
                    "PewDiePie",
                    style: TextStyle(color: Colors.white, fontSize: 17.0),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            new ListTile(
              leading: Icon(
                Icons.home,
                size: 24.0,
              ),
              title: Text("Home",
                  style: TextStyle(fontSize: 18.0, color: Colors.orange)),
              onTap: () {
                _interstitialAd
                  ..load()
                  ..show();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Intiq()));
              },
            ),
            new ListTile(
              leading: Icon(
                Icons.person,
                size: 24.0,
              ),
              title: Text("Who is PewDiePie?",
                  style: TextStyle(fontSize: 18.0, color: Colors.lightGreen)),
              onTap: () {
                _interstitialAd
                  ..load()
                  ..show();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Intro()));
              },
            ),
            new ListTile(
              leading: Icon(
                Icons.account_box,
                size: 24.0,
              ),
              title: Text("About Creator",
                  style: TextStyle(fontSize: 18.0, color: Colors.blue)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Reason1()));
              },
            ),
            new ListTile(
              leading: Icon(
                Icons.attach_money,
                size: 24.0,
              ),
              title: Text("Donate Me",
                  style: TextStyle(fontSize: 18.0, color: Colors.red)),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Donate()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _listTile() {
    return new ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24))),
          child: Icon(Icons.looks_one, color: Colors.white),
        ),
        title: Text(
          "First Reason",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

        subtitle: Row(
          children: <Widget>[
            Text("Why Must Subscribe Him?",
                style: TextStyle(color: Colors.white))
          ],
        ),
        trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0));
  }

  Widget _listTile1() {
    return new ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24))),
          child: Icon(Icons.looks_two, color: Colors.white),
        ),
        title: Text(
          "Second Reason",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

        subtitle: Row(
          children: <Widget>[
            Text("Why Must Subscribe Him?",
                style: TextStyle(color: Colors.white))
          ],
        ),
        trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0));
  }

  Widget _listTile2() {
    return new ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24))),
          child: Icon(Icons.looks_3, color: Colors.white),
        ),
        title: Text(
          "Third Reason",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

        subtitle: Row(
          children: <Widget>[
            Text("Why Must Subscribe Him?",
                style: TextStyle(color: Colors.white))
          ],
        ),
        trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0));
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(22.0))),
              title: Text(
                'First Reason',
                style: TextStyle(color: Colors.red, fontSize: 23.0),
                textAlign: TextAlign.center,
              ),
              content: new Text(
                "PewDiePie is a hardworker. He uploaded videos daily since 2010 and never miss even a single day. His will and consistency really makes us inspired!",
                style: TextStyle(fontSize: 18.0),
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Okay!',
                    style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontSize: 18.0,
                    ),
                  ),
                )
              ],
            ));
  }

  void showAlertDialog1(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(22.0))),
              title: Text(
                'Second Reason',
                style: TextStyle(color: Color(0xFF40C4FF), fontSize: 23.0),
                textAlign: TextAlign.center,
              ),
              content: new Text(
                "PewDiePie is just a single person, without team or whatever. But T-Series is a company that have many employees, they can even upload 5 videos per day!",
                style: TextStyle(fontSize: 18.0),
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Okay!',
                    style: TextStyle(
                      color: Colors.indigoAccent,
                      fontSize: 18.0,
                    ),
                  ),
                )
              ],
            ));
  }

  void showAlertDialog2(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(22.0))),
              title: Text(
                'Third Reason',
                style: TextStyle(color: Color(0xFFE040FB), fontSize: 23.0),
                textAlign: TextAlign.center,
              ),
              content: new Text(
                "And the last reason, it's to determine the Youtube throne for being most-subscribed channel. Is it a hardworker-individual, or a capitalist-company!",
                style: TextStyle(fontSize: 18.0),
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Okay!',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18.0,
                    ),
                  ),
                )
              ],
            ));
  }

  void yesDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6.0))),
              title: Text(
                'Thank You!',
                style: TextStyle(color: Colors.teal, fontSize: 23.0),
                textAlign: TextAlign.center,
              ),
              content: new Text(
                "You have been contributed for preventing the company for taking the Youtube throne!",
                style: TextStyle(fontSize: 18.0),
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Wow!',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16.0,
                    ),
                  ),
                )
              ],
            ));
  }

  void noDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6.0))),
              title: Text(
                'Please Subscribe!',
                style: TextStyle(color: Colors.blue, fontSize: 23.0),
                textAlign: TextAlign.center,
              ),
              content: new Text(
                "How about see some reason why must subscribe him?",
                style: TextStyle(fontSize: 18.0),
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Let me try!',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16.0,
                    ),
                  ),
                )
              ],
            ));
  }
}
