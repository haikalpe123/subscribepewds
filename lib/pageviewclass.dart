import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';

class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);

  final PageController controller;
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 2.0;

  // The distance between the center of each dot
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return new Container(
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: Colors.blueAccent,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final _controller = new PageController();

  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  final _kArrowColor = Colors.black.withOpacity(0.1);

  final List<Widget> _pages = <Widget>[
    new ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: new Container(
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
              child: new Text(
                "Felix Arvid Ulf Kjellberg is a Swedish Youtuber that widely known as PewDiePie, he is a comedian and video game player-commentator, and best known for his YouTube video content, which has mainly consisted of Let's Play commentaries, vlogs, and comedic formatted shows.",
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    ),
    new ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: new Container(
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
                              image: ExactAssetImage('intro/reason2.jpg'),
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
              child: new Text(
                "Born in Gothenburg, Sweden, Kjellberg originally pursued a degree in industrial economics and technology management at Chalmers University of Technology in Gothenburg. In 2010, during his time at the university, he registered a YouTube account under the name PewDiePie.",
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    ),
    new ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: new Container(
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
                              image: ExactAssetImage('intro/reason3.jpg'),
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
              child: new Text(
                "The following year, he dropped out of Chalmers after losing interest in his degree field, much to the dismay of his parents. After failing to earn an apprenticeship with an advertising agency in Scandinavia, he then decided to focus on creating content for his YouTube channel. Kjellberg soon gathered a rapidly increasing online following, and in July 2012, his channel surpassed one million subscribers.",
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    ),
    new ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: new Container(
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
                              image: ExactAssetImage('intro/reason4.jpg'),
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
              child: new Text(
                "Sources: Wikipedia",
                style: TextStyle(fontSize: 12.0, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 18.0),
            new Container(
              child: new Text(
                "On 15 August 2013, Kjellberg became the most-subscribed user on YouTube, being briefly surpassed in late 2013 by YouTube Spotlight. After regaining the top position on 23 December 2013 the channel has now amassed over 84 million subscribers as of February 2019.",
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 23.0),
          ],
        ),
      ),
    ),
  ];

  Widget _buildPageItem(BuildContext context, int index) {
    return new Page(page: _pages[index], idx: index);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return new Scaffold(
      body: new IconTheme(
        data: new IconThemeData(color: _kArrowColor),
        child: new Stack(
          children: <Widget>[
            new PageView.builder(
              physics: new AlwaysScrollableScrollPhysics(),
              controller: _controller,
              itemCount: _pages.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildPageItem(context, index % _pages.length);
              },
            ),
            new Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: new Container(
                color: Colors.grey[800].withOpacity(0.1),
                padding: const EdgeInsets.all(20.0),
                child: new Center(
                  child: new DotsIndicator(
                    controller: _controller,
                    itemCount: _pages.length,
                    onPageSelected: (int page) {
                      _controller.animateToPage(
                        page,
                        duration: _kDuration,
                        curve: _kCurve,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: new AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        leading: new IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: Text(
          'Who is PewDiePie?',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {
  final page;
  final idx;
  Page({
    @required this.page,
    @required this.idx,
  });
  onTap() {
    print("${this.idx} selected.");
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Container(
            height: 505.0,
            child: new Card(
              child: new Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  this.page,
                  new Material(
                    type: MaterialType.transparency,
                    child: new InkWell(onTap: this.onTap),
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
