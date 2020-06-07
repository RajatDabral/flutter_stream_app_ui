import 'package:flutter/material.dart';
import 'package:music_app_ui/data/data_model.dart';

import 'package:provider/provider.dart';

import '../widgets/episode.dart';

class ShowsPageScreen extends StatelessWidget {
  ShowsPageScreen({this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff101412),
      //Very important step, to have a clean transition of the page.
      /// Hero places the child we supply in the Overlay
      ///  and there it does not inherit a Material from your Scaffold.
      body: SafeArea(
        child: Hero(
          tag: 'imageStack$index',
          child: Material(
            type: MaterialType.transparency,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  title: Text('Shows Name'),
                  pinned: true,
                  centerTitle: true,
                  floating: true,
                  snap: true,
                  expandedHeight: MediaQuery.of(context).size.height * 0.6,
                  flexibleSpace: _buildTopItem(context),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    _buildChildrens(),
                  ),
                ),
              ],
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
        children: [
          DropButton(),
          SizedBox(height: 40),
          EpisodeWidget(),
        ],
      ),
    ];
  }

  ///TOP ITEM FOR THE PAGE
  ///HEADER

  Widget _buildTopItem(BuildContext context) {
    final shows = Provider.of<DataModel>(context, listen: false).shows;

    return TopStackHeader(shows: shows, index: index);
  }
}
