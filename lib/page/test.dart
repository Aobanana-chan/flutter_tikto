// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_tiktok/page/widget/like_gesture_widget.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TestPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('test'),
      ),
      body: LikeGestureWidget(
        onAddFavorite: () {
          print('onAddFavorite');
        },
        onSingleTap: () {
          print('onSingleTop');
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black,
        ),
      ),
    );
  }
}
