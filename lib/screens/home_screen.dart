import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/carousel_widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff101412),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xff101412),
            elevation: 0.0,
            expandedHeight: 120,
            flexibleSpace: _buildSearchbar(),
            floating: true,
            snap: true,
            pinned: false,
            forceElevated: false,
          ),
          SliverList(
            delegate: SliverChildListDelegate(_buildChildren()),
          )
        ],
      ),
    );
  }

  List<Widget> _buildChildren() {
    return [
      ///Shows for you
      ShowsCarousel(),
      SizedBox(height: 30),
      TrendCarousel(),
      SizedBox(height: 30),
      LiveBattleCarousel(),
      SizedBox(height: 30),
      FeaturedCarousel(),
    ];
  }

  Widget _buildSearchbar() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Container(
        height: 65,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),

        decoration: ShapeDecoration(
          color: Colors.black45,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: Colors.greenAccent,
              width: .5
            )
          ),
        ),
        // decoration: BoxDecoration(
        //   color: Colors.black45,
        //   shape: Sha
        //   // borderRadius: BorderRadius.circular(15),
        //   // border: Border(
        //   //   top: BorderSide(
        //   //     color: Colors.lightGreenAccent,
        //   //     width: 0.5,
        //   //   ),
        //   //   bottom: BorderSide(
        //   //     color: Colors.purpleAccent,
        //   //     width: 0.5,
        //   //   ),
        //   //   left: BorderSide(
        //   //     color: Colors.yellowAccent,
        //   //     width: 0.5,
        //   //   ),
        //   //   right: BorderSide(
        //   //     color: Colors.yellowAccent,
        //   //     width: 0.5,
        //   //   ),
        //   // ),
        // ),
        child: TextField(
          decoration: InputDecoration(
            icon: FaIcon(
              FontAwesomeIcons.search,
              size: 25,
              color: Colors.grey,
            ),
            hintText: 'Search',
            hintStyle: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
