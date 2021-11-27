import 'package:flutter/material.dart';

import '../sba_theme.dart';

class ChipForRow extends StatelessWidget {
  const ChipForRow({
    Key? key,
    required this.label,
    required this.color,
  }) : super(key: key);

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3.0),
      child: Chip(
        labelPadding: EdgeInsets.all(5.0),
        avatar: CircleAvatar(
          backgroundColor: kDarkPrimaryColor,
          child: Text(label[0]),
        ),
        label: Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
        backgroundColor: color,
        elevation: 0,
        padding: EdgeInsets.all(6.0),
      ),
    );
  }
}
