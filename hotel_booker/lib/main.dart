import 'dart:ui';
import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:hotel_booker/CustomShapeClipper.dart';
import 'package:hotel_booker/choice_chip.dart';
import 'package:hotel_booker/choice_chip.dart' as prefix1;
import 'package:hotel_booker/city_card.dart';

void main() => runApp(MyApp());

Color firstColor = Colors.deepOrangeAccent;
Color secondColor = Colors.orange[600];

ThemeData appTheme = ThemeData(
  primaryColor: Colors.deepOrangeAccent,
  fontFamily: 'Montserrat',
);

List<String> locations = ['Boston (BOS)', 'New York City (JFK)'];
TextStyle dropdownLabelStyle = TextStyle(color: Colors.white, fontSize: 16.0);
TextStyle dropdownMenuItemStyle =
    TextStyle(color: Colors.black, fontSize: 18.0);
TextStyle viewAllStyle =
    TextStyle(color: appTheme.primaryColor, fontSize: 14.0);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TopClip(),
          bottomScreen
        ],
      ),
    );
  }
}

class TopClip extends StatefulWidget {
  @override
  _TopClipState createState() => _TopClipState();
}

class _TopClipState extends State<TopClip> {
  var _selectedLocationIndex = 0;
  var isFlightSelected = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 350.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [firstColor, secondColor])),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 25.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      SizedBox(width: 16.0),
                      PopupMenuButton(
                        onSelected: (index) {
                          setState(() {
                            _selectedLocationIndex = index;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Text(
                              locations[_selectedLocationIndex],
                              style: dropdownLabelStyle,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuItem<int>>[
                              PopupMenuItem(
                                child: Text(
                                  locations[0],
                                  style: dropdownMenuItemStyle,
                                ),
                                value: 0,
                              ),
                              PopupMenuItem(
                                child: Text(
                                  locations[1],
                                  style: dropdownMenuItemStyle,
                                ),
                                value: 1,
                              )
                            ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Text(
                  'Where would\nyou like to go?',
                  style: TextStyle(
                      fontSize: 26.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                  textAlign: prefix0.TextAlign.center,
                ),
                SizedBox(
                  height: 25.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: TextField(
                      controller: TextEditingController(text: locations[0]),
                      style: dropdownMenuItemStyle,
                      cursorColor: appTheme.primaryColor,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 14.0),
                          suffixIcon: Material(
                            elevation: 2.0,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            child: Icon(Icons.search),
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          setState(() {
                            isFlightSelected = true;
                          });
                        },
                        child: prefix1.ChoiceChip(
                            Icons.flight_takeoff, "Flights", isFlightSelected)),
                    SizedBox(
                      width: 20.0,
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            isFlightSelected = false;
                          });
                        },
                        child: prefix1.ChoiceChip(
                            Icons.hotel, "Hotels", !isFlightSelected)),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

var bottomScreen = Container(
  child: Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Currently Watched Items",
              style: dropdownMenuItemStyle,
            ),
            Spacer(),
            Text(
              "VIEW ALL(12)",
              style: viewAllStyle,
            ),
          ],
        ),
      ),
      SizedBox(height: 20.0,),
      Container(
        height: 210.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: cityCards
        ),
      )
    ],
  ),
);
