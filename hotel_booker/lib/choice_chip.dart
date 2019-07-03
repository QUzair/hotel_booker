import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';

class ChoiceChip extends StatefulWidget {
  ChoiceChip(this.icon, this.text, this.isSelected);

  final IconData icon;
  final String text;
  final bool isSelected;

  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 6.0),
      decoration: widget.isSelected ? BoxDecoration(color: Colors.white30, borderRadius: BorderRadius.all(
        Radius.circular(20.0)
      )) : null,
      child: Row(
        children: <Widget>[
          Icon(
            widget.icon,
            size: 20.0,
            color: Colors.white,
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            widget.text,
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          )
        ],
      ),
    );
  }
}
