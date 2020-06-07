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
      body: Hero(
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
                centerTitle: true,
                expandedHeight: MediaQuery.of(context).size.height * 0.6,
                flexibleSpace: _buildTopItem(context),

                floating: true,
                // pinned: true,
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

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          shows[index].imageUrl,
          fit: BoxFit.cover,
        ),
        Positioned(
          height: 100,
          left: 40,
          bottom: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff28f0f7),
                      Color(0xff28f751),
                    ],
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 8,
                ),
                child: Text(
                  shows[index].battleType,
                  // 'Battle type',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                shows[index].name,
                // 'Name',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                shows[index].seasons.last,
                // 'Season',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 15.0,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
