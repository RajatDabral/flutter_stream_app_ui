import 'package:flutter/material.dart';
import 'package:music_app_ui/data/data_model.dart';
import 'package:provider/provider.dart';

class TrendCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemH = MediaQuery.of(context).size.height * .35; //List view height

    final trend = Provider.of<DataModel>(context, listen: false).trends;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            "Trending right now",
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
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: trend.length,
            itemBuilder: (ctx, index) =>
                _buildTrendItems(itemH, context, index),
          ),
        ),
      ],
    );
  }

  Widget _buildTrendItems(double itemH, BuildContext ctx, int index) {
    final width = MediaQuery.of(ctx).size.width;
    final trend = Provider.of<DataModel>(ctx, listen: false).trends;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Image Widget
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white38,
                width: .5,
              ),
              borderRadius: BorderRadius.circular(25.0),
            ),
            height: itemH * .80,
            width: width * .40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Image.network(
                trend[index].imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              trend[index].name,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white54,
                  letterSpacing: .5),
            ),
          )
        ],
      ),
    );
  }
}
