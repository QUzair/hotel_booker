import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<CityCard> cityCards = [
  CityCard("assets/images/las_vegas.jpg", "Las Vegas", "44", "July 2019",
      "1250", "1710"),
  CityCard("assets/images/athens.jpg", "Athens", "32", "August 2019", "1100",
      "1500"),
  CityCard("assets/images/greece.png", "Greece", "46", "August 2019", "1299",
      "1345"),
  CityCard("assets/images/new_york.jpg", "New York", "26", "November 2019",
      "1299", "1345"),
];

final formatCurrency = NumberFormat.simpleCurrency();

class CityCard extends StatelessWidget {
  final String imagepath, cityName, monthyear, discount, oldPrice, newPrice;

  CityCard(this.imagepath, this.cityName, this.discount, this.monthyear,
      this.newPrice, this.oldPrice);

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.28,
                  width: MediaQuery.of(context).size.height * 0.25,
                  child: Image.asset(
                    imagepath,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  width: 160.0,
                  height: 90.0,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                          Colors.black,
                          Colors.black.withOpacity(0.05)
                        ])),
                  ),
                ),
                Positioned(
                  left: 10.0,
                  bottom: 10.0,
                  right: 10.0,
                  height: 30.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      FittedBox(
                        fit: BoxFit.fill,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              cityName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18.0),
                            ),
                            Text(
                              monthyear,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  fontSize: 14.0),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 2.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: Text(
                          '${discount}%',
                          style: TextStyle(color: Colors.black, fontSize: 14.0),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.35,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Text(
                      formatCurrency.format(int.parse(newPrice)).toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0),
                    ),
                  ),
                ),
                SizedBox(width: 4.0,),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Text(
                      '(${formatCurrency.format(int.parse(oldPrice))})',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
