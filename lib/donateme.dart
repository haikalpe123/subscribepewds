import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Donate extends StatefulWidget {
  @override
  _DonateState createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DonateMe(),
      appBar: new AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Donate Me",
          style: TextStyle(fontSize: 26.5, color: Colors.black),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}

class DonateMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    _launchURL6() async {
      const url5 =
          'https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=8BB34KCDT43RN&source=url';
      if (await canLaunch(url5)) {
        await launch(url5);
      } else {
        throw 'Could not launch $url5';
      }
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 15.0),
      color: Colors.white,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 15.0),
          new Container(
            width: width,
            child: new Text(
              "I'm 14 years old kid who have a dream to make my own Start-up in the furute, and this project is the starting point. Btw, this apps was created with my i3-5005U and 4-giga-RAM laptop, it slow as hell! \n Feel free to donate me if you have extra-money",
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 30.0),
          new Row(
            children: <Widget>[
              Expanded(
                  child: Column(
                children: <Widget>[
                  new GestureDetector(
                    onTap: () {
                      _launchURL6();
                    },
                    child: new Container(
                        width: 180.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: ExactAssetImage('intro/paypal.png'),
                            fit: BoxFit.fill,
                          ),
                        )),
                  ),
                ],
              ))
            ],
          ),
          SizedBox(height: 30.0),
          new Container(
            width: width,
            child: new Text(
              "(using my mother's ID to make this paypal account lmao)",
              style: TextStyle(fontSize: 17.0),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
