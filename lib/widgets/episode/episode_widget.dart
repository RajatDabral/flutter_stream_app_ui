import 'package:flutter/material.dart';
import 'package:music_app_ui/data/data_model.dart';
import 'package:provider/provider.dart';

class EpisodeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    final maxHeight = MediaQuery.of(ctx).size.height * .45;
    final episode = Provider.of<DataModel>(ctx, listen: false).episodeList;
    return Container(
      height: MediaQuery.of(ctx).size.height,
      child: ListView.builder(
        itemCount: episode.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            ///Main Column
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildEpisodeHeader(context, maxHeight, index),
              SizedBox(height: 20),
              _buildEpisodeBody(context, maxHeight, index),
            ],
          );
        },
      ),
    );
  }

  ///Episode Header Here
  Widget _buildEpisodeHeader(
      BuildContext context, double maxHeight, int index) {
    final episode = Provider.of<DataModel>(context, listen: false).episodeList;

    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Container(
        // color: Colors.yellow,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * .60,
          maxHeight: maxHeight * .20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "${episode[index]['ep']}: ${episode[index]['title']}",
              style: TextStyle(
                color: Colors.blueGrey[300],
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              episode[index]['info'],
              maxLines: 3,
              softWrap: true,
              style: TextStyle(
                color: Colors.blueGrey[300],
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///Episode Body

  _buildEpisodeBody(BuildContext context, double maxHeight, int index) {
    final episode = Provider.of<DataModel>(context, listen: false).episodeList;

    return Container(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 90),
      child: Stack(
        // fit: StackFit.expand,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Image(
                  height: maxHeight * .70,
                  width: MediaQuery.of(context).size.width * .45,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    episode[index]['firstImage'],
                  ),

                  // trend[index].imageUrl,
                ),
              ),

              ///2nd Image
              ///
              ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Image(
                  height: maxHeight * .70,
                  width: MediaQuery.of(context).size.width * .45,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    episode[index]['secondImage'],
                  ),

                  // trend[index].imageUrl,
                ),
              ),
            ],
          ),
          Positioned(
            top: (maxHeight * .60) / 2,
            left: MediaQuery.of(context).size.width * .43,
            child: Icon(
              Icons.play_circle_filled,
              size: 55,
              color: Colors.white70.withOpacity(.8),
            ),
          ),
        ],
      ),
    );
  }
}
