import 'package:flutter/material.dart';
import 'package:flutter_tiktok/model/city_item_model.dart';

class CityGridItemWidget extends StatelessWidget {
  final CityItemModel model;
  final Function onTap;

  const CityGridItemWidget({Key key, this.model, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            model.imgCoverUrl,
            fit: BoxFit.fill,
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Row(
              children: [
                Container(
                  width: 25,
                  height: 25,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      image: DecorationImage(
                          image: AssetImage(model.user.headerImg))),
                ),
                Text(
                  model.distance,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
