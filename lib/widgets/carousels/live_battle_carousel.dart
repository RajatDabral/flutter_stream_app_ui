import 'package:flutter/material.dart';
import 'package:music_app_ui/data/data_model.dart';
import 'package:provider/provider.dart';

class LiveBattleCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final liveBattles =
        Provider.of<DataModel>(context, listen: false).liveBattles;
    final itemH = MediaQuery.of(context).size.height * .40;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            "Live Team Battles",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
            ),
          ),
        ),
        Container(
          height: itemH,
          // color: Colors.red,

          ///Item
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: liveBattles.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white38, width: 0.5),
                    borderRadius: BorderRadius.circular(20.0)),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                height: itemH * .40,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(
                        liveBattles[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      left: 15,
                      child: Text(
                        liveBattles[index].name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
