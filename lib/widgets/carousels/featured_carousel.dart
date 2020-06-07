import 'package:flutter/material.dart';
import 'package:music_app_ui/data/data_model.dart';
import 'package:provider/provider.dart';

class FeaturedCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemH = MediaQuery.of(context).size.height * .70; //List view height
    final performance =
        Provider.of<DataModel>(context, listen: false).performamce;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            "Featured performances",
            style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5),
          ),
        ),
        Container(
          height: itemH,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          // color: Colors.red,
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: .75,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: performance
                  .map(
                    (imageLink) => ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Card(elevation: 5,
                            child: Image.network(
                          imageLink,
                          fit: BoxFit.cover,
                        ))),
                  )
                  .toList()),
        ),
      ],
    );
  }
}
