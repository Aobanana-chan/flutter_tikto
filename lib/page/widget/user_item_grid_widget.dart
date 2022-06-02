import 'dart:math';

import 'package:flutter/material.dart';

class UserItemGridWidget extends StatefulWidget {
  final String gifUrl;
  final Function onTap;
  const UserItemGridWidget({Key key, this.gifUrl, this.onTap})
      : super(key: key);
  @override
  _UserItemGridWidgetState createState() {
    return _UserItemGridWidgetState();
  }
}

class _UserItemGridWidgetState extends State<UserItemGridWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap?.call();
      },
      child: Stack(
        children: [
          SizedBox.expand(
            child: Image.network(
              widget.gifUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 2,
            bottom: 2,
            child: Row(
              children: [
                Image.asset(
                  'assets/images/hollow_heart.webp',
                  width: 15,
                  height: 15,
                ),
                Text(
                  ' ${Random().nextInt(10)}',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
