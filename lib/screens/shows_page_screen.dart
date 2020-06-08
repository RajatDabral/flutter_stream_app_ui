import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_app_ui/data/data_model.dart';

import 'package:provider/provider.dart';

import '../widgets/episode.dart';

class ShowsPageScreen extends StatefulWidget {
  ShowsPageScreen({this.index});
  final int index;

  @override
  _ShowsPageScreenState createState() => _ShowsPageScreenState();
}

class _ShowsPageScreenState extends State<ShowsPageScreen>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController;
  TabController _tabController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final shows = Provider.of<DataModel>(context, listen: false).shows;

    return Scaffold(
      backgroundColor: Color(0xff101412),
      //Very important step, to have a clean transition of the page.
      /// Hero places the child we supply in the Overlay
      ///  and there it does not inherit a Material from your Scaffold.
      body: SafeArea(
        child: Hero(
          tag: 'imageStack${widget.index}',
          child: Material(
            type: MaterialType.transparency,
            child: NestedScrollView(
              controller: _scrollController,
              headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    backgroundColor: Color(0xff101412),
                    elevation: 0.0,
                    leading: IconButton(
                      icon: Icon(Icons.cancel),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    title: boxIsScrolled
                        ? Text(shows[widget.index].name)
                        : Text(''),
                    pinned: true,
                    centerTitle: true,
                    expandedHeight: MediaQuery.of(context).size.height * 0.6,
                    flexibleSpace: FlexibleSpaceBar(
                      background:
                          TopStackHeader(shows: shows, index: widget.index),
                    ), //Header Stack
                    bottom: TabBar(
                      controller: _tabController,
                      tabs: [
                        Tab(text: 'Videos'),
                        Tab(text: 'About'),
                        Tab(text: 'Prizes'),
                      ],
                    ),
                    actions: boxIsScrolled
                        ? [
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: FaIcon(
                                FontAwesomeIcons.angleDown,
                                color: Colors.white,
                                // size: 40,
                              ),
                            )
                          ]
                        : [], //false condition
                  )
                ];
              },
              body: TabBarView(
                children: [
                  ..._buildChildrens(),
                  Center(child: Text('About Page')),
                  Center(child: Text('Prize Page')),
                ],
                controller: _tabController,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildChildrens() {
    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          DropButton(),
          SizedBox(height: 40),
          EpisodeWidget(),
        ],
      ),
    ];
  }
}
