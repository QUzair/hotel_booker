import 'package:flutter/material.dart';
import 'package:hotel_booker/CustomShapeClipper.dart';
import 'package:hotel_booker/main.dart';
import 'package:intl/intl.dart';
import 'dart:math';

final formatCurrency = NumberFormat.simpleCurrency();

final Color firstColor = Color(0xffff6337);
final Color secondColor = Color(0xffffa323);
final Color discountBgColor = Color(0xffffe08d);
final Color flightBorderColor = Color(0xffe6e6e6);
final Color chipBgColor = Colors.grey.withOpacity(0.045);

class FlightsListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: firstColor,
        elevation: 0.0,
        title: Text(
          "Search Results",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            FlightListTopPart(), 
            FlightListBottomPart()
          ],
        ),
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
            height: 160.0,
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              elevation: 10.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 22.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Boston",
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 20.0,
                          ),
                          Text(
                            "New York City (JFK)",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.import_export,
                          color: Colors.black,
                          size: 32.0,
                        ))
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class FlightListBottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Best Deals for next 6 months",
            style: dropdownMenuItemStyle,
          ),
          SizedBox(
            height: 10.0,
          ),
          ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              FlightCard('January 2019}',1000+Random().nextInt(3000),4000+Random().nextInt(3000),(20+Random().nextInt(30)).toString()),
              FlightCard('March 2019}',1000+Random().nextInt(3000),4000+Random().nextInt(3000),(20+Random().nextInt(30)).toString()),
              FlightCard('April 2019}',1000+Random().nextInt(3000),4000+Random().nextInt(3000),(20+Random().nextInt(30)).toString()),
              FlightCard('April 2019}',1000+Random().nextInt(3000),4000+Random().nextInt(3000),(20+Random().nextInt(30)).toString()),
              FlightCard('July 2019}',1000+Random().nextInt(3000),4000+Random().nextInt(3000),(20+Random().nextInt(30)).toString()),
              FlightCard('August 2019}',1000+Random().nextInt(3000),4000+Random().nextInt(3000),(20+Random().nextInt(30)).toString()),
              FlightCard('October 2019}',1000+Random().nextInt(3000),4000+Random().nextInt(3000),(20+Random().nextInt(30)).toString()),
            
            ],
          )
        ],
      ),
    );
  }
}

class FlightCard extends StatelessWidget {

  FlightCard(this.date, this.price, this.oldPrice, this.discount);  

  final String discount;
  final String date;
  final int price;
  final int oldPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.only(right: 16.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                border: Border.all(color: flightBorderColor)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('${formatCurrency.format(price)}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0)),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text('(${formatCurrency.format(oldPrice)})',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                            decoration: TextDecoration.lineThrough)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                        child:
                            FlightDetailChip(Icons.calendar_today, date)),
                    Expanded(
                        child: FlightDetailChip(
                            Icons.flight_takeoff, 'Jet Airways')),
                    Expanded(
                        child: FlightDetailChip(Icons.star, '4.4')),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 10.0,
            right: 0.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6.0,vertical: 4.0),
              decoration: BoxDecoration(
                  color: discountBgColor,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Text('${discount}%',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: firstColor,
                  )),
            ),
          )
        ],
      ),
    );
  }
}

class FlightDetailChip extends StatefulWidget {
  FlightDetailChip(this.iconData, this.label);

  final IconData iconData;
  final String label;

  _FlightDetailChipState createState() => _FlightDetailChipState();
}

class _FlightDetailChipState extends State<FlightDetailChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RawChip(
        label: Text(widget.label),
        labelStyle: TextStyle(color: Colors.black, fontSize: 10.0),
        backgroundColor: chipBgColor,
        avatar: Icon(widget.iconData, size: 20.0,),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
      ),
    );
  }
}
