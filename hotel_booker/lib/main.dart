import 'dart:ui';
import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:hotel_booker/CustomShapeClipper.dart';
import 'package:hotel_booker/choice_chip.dart';
import 'package:hotel_booker/choice_chip.dart' as prefix1;
import 'package:hotel_booker/city_card.dart';
import 'package:hotel_booker/custom_appbar.dart';
import 'package:hotel_booker/flights_list.dart';

void main() => runApp(MyApp());

Color firstColor = Color(0xffff6337);
Color secondColor = Color(0xffffa323);

ThemeData appTheme = ThemeData(
  primaryColor: Colors.deepOrangeAccent,
  fontFamily: 'Montserrat',
);

List<String> locations = ['Boston (BOS)', 'New York City (JFK)'];
TextStyle dropdownLabelStyle = TextStyle(color: Colors.white, fontSize: 16.0);
TextStyle dropdownMenuItemStyle =
    TextStyle(color: Colors.black, fontSize: 16.0);
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
      bottomNavigationBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TopClip(),
            bottomScreen(context)
          ],
        ),
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
            height: MediaQuery.of(context).size.height*0.5,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [firstColor, secondColor])),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.025,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*.005),
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
                  height: MediaQuery.of(context).size.height*0.01,
                ),
                Text(
                  'Where would\nyou like to go?',
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                      ),
                  textAlign: prefix0.TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.04,
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
                              horizontal: 25.0, vertical: 14.0),
                          suffixIcon: Material(
                            elevation: 3.0,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> FlightsListing()));
                              },
                              child: Icon(Icons.search)),
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.025,
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

bottomScreen(BuildContext context) => Container(
  height: MediaQuery.of(context).size.height*0.4, 
  child: Column(
    children: <Widget>[
      Container(
        height: MediaQuery.of(context).size.height*0.06,
        padding: EdgeInsets.symmetric(horizontal: 20.0,vertical:MediaQuery.of(context).size.height*0.01),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                "Currently Watched Items",
                style: dropdownMenuItemStyle,
              ),
            ),
            Spacer(),
            Expanded(
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(
                  "VIEW ALL(12)",
                  style: viewAllStyle,
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: MediaQuery.of(context).size.height*0.005,),
      Container(
        height: MediaQuery.of(context).size.height*0.335,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: cityCards
        ),
      ),
    ],
  ),
);
