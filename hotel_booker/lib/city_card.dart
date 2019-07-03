import 'package:flutter/material.dart';

List<CityCard> cityCards = [
  CityCard("assets/images/las_vegas.jpg", "Las Vegas", "460", "July 2019",
      "1250", "1710"),
  CityCard("assets/images/athens.jpg", "Athens", "400", "August 2019", "1100",
      "1500"),
  CityCard("assets/images/greece.png", "Greece", "46", "August 2019", "1299",
      "1345"),
  CityCard("assets/images/new_york.jpg", "New York", "129", "November 2019",
      "1299", "1345"),
];

class CityCard extends StatelessWidget {
  final String imagepath, cityName, monthyear, discount, oldPrice, newPrice;

  CityCard(this.imagepath, this.cityName, this.discount, this.monthyear,
      this.newPrice, this.oldPrice);

  @override
  Widget build(BuildContext context) {
    print(imagepath);
    return Stack(
      children: <Widget>[
        Container(
          height: 210.0,
          width: 160.0,
          child: Image.asset(imagepath, fit: BoxFit.cover,),
        )
      ],
    );
  }
}
