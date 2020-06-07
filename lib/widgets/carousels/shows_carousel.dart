import 'package:flutter/material.dart';
import 'package:music_app_ui/data/data_model.dart';
import 'package:music_app_ui/screens/shows_page_screen.dart';
import 'package:provider/provider.dart';

class ShowsCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shows = Provider.of<DataModel>(context, listen: false).shows;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            "Shows for you",
            style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.w800,
                letterSpacing: .5),
          ),
        ),
        Container(
          height: (MediaQuery.of(context).size.height - 120) * .60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: shows.length,
            itemBuilder: (ctx, index) => Hero(
              tag: 'imageStack$index',
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration: Duration(
                          milliseconds: 1000,
                        ),
                        pageBuilder: (_, __, ___) =>
                            ShowsPageScreen(index: index),
                      ),
                    );
                  },
                  child: _buildShowList(ctx, index),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildShowList(BuildContext ctx, int index) {
    final shows = Provider.of<DataModel>(ctx, listen: false).shows;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white38, width: 0.5),
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          height: (MediaQuery.of(ctx).size.height - 120) * .65,
          width: MediaQuery.of(ctx).size.width * .80,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                shows[index].imageUrl,
                fit: BoxFit.cover,
              )),
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
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                shows[index].name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                shows[index].seasons.last,
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
