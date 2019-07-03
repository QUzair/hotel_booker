import 'package:flutter/material.dart';
import 'package:hotel_booker/CustomShapeClipper.dart';

final Color firstColor = Color(0xffff6337);
final Color secondColor = Color(0xffffa323);
final Color discountBgColor = Color(0xffffe08d);
final Color flightBorderColor = Color(0xffe6e6e6);
final Color chipBgColor = Color(0xfff6f6f6);

class FlightsListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: firstColor,
        elevation: 0.0,
        title: Text("Search Results",style: TextStyle(fontWeight: FontWeight.w500),),
        centerTitle: true,
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: <Widget>[FlightListTopPart()],
      ),
    );
  }
}

class FlightListTopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [firstColor, secondColor])),
            height: 100.0,
          ),
        )
      ],
    );
  }
}
