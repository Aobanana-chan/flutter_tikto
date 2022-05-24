import 'package:flutter/material.dart';
import 'package:flutter_tiktok/controller/city_page_controller.dart';
import 'package:flutter_tiktok/model/city_item_model.dart';
import 'package:flutter_tiktok/page/widget/CityGridItemWidget.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:get/get.dart';

///首页tab城市
class HomeTabCityPage extends StatefulWidget {
  const HomeTabCityPage({Key key}) : super(key: key);

  @override
  _HomeTabCityPageState createState() {
    return _HomeTabCityPageState();
  }
}

class _HomeTabCityPageState extends State<HomeTabCityPage> {
  final CityPageController _controller = Get.put(CityPageController());

  @override
  Widget build(BuildContext context) {
    List<CityItemModel> list = _controller.cityItemList;
    return Scaffold(
      body: Container(
          color: ColorRes.color_1,
          child: Stack(
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: list.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                    childAspectRatio: 9 / 16,
                  ),
                  itemBuilder: (context, index) {
                    return CityGridItemWidget(
                      model: list[index],
                      onTap: () {},
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
