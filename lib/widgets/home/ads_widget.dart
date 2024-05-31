import 'dart:async';

import 'package:flutter/material.dart';

class AdsWidget extends StatefulWidget {
  AdsWidget({super.key});

  final List<Map> _items = [
    {"img": "ad1.jpeg", "text": "Text1"},
    {"img": "ad2.jpeg", "text": "Text2"},
    {"img": "ad3.jpeg", "text": "Text3"},
  ];

  int _index = 0;

  Timer? _timer;
  Map<String, dynamic> productData = {};
  @override
  State<AdsWidget> createState() => _AdsWidgetState();
}

class _AdsWidgetState extends State<AdsWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widget._timer = Timer.periodic(const Duration(seconds: 2), _setTimer);
  }

  void _setTimer(Timer timer) {
    setState(() {
      if (widget._index < widget._items.length - 1) {
        widget._index++;
      } else {
        widget._index = 0;
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    widget._timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/img/${widget._items[widget._index]['img']}',
        ),
        Text(
          widget._items[widget._index]['text'],
        )
      ],
    );
  }
}
