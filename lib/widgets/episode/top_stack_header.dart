import 'package:flutter/material.dart';
import 'package:music_app_ui/data/model/shows_model.dart';

class TopStackHeader extends StatelessWidget {
  const TopStackHeader({
    Key key,
    @required this.shows,
    @required this.index,
  }) : super(key: key);

  final List<Show> shows;
  final int index;

  @override
  Widget build(BuildContext context) {
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
                'Enteries Open till 24th june',
                // 'Season',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color(0xff28f751),
                  letterSpacing: 0.5,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
