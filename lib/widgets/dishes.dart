import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_web/models/transaction.dart';

class Dishes extends StatelessWidget {
  const Dishes({
    Key? key,
    required double height,
  })  : _height = height,
        super(key: key);

  final double _height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height * 0.7,
      child: Card(
        elevation: 50,
        child: GridView.count(
          primary: true,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          children: const <Widget>[
            DishItem(
              title: "Burger",
              svgsrc: "assets/icons/burger_beer.svg",
              price: 5,
            ),
            DishItem(
              title: "Burger",
              svgsrc: "assets/icons/burger_beer.svg",
              price: 5,
            ),
            DishItem(
              title: "Burger",
              svgsrc: "assets/icons/burger_beer.svg",
              price: 5,
            ),
            DishItem(
              title: "Burger",
              svgsrc: "assets/icons/burger_beer.svg",
              price: 5,
            ),
            DishItem(
              title: "Burger",
              svgsrc: "assets/icons/burger_beer.svg",
              price: 5,
            ),
            DishItem(
              title: "Burger",
              svgsrc: "assets/icons/burger_beer.svg",
              price: 5,
            ),
            DishItem(
              title: "Burger",
              svgsrc: "assets/icons/burger_beer.svg",
              price: 5,
            ),
            DishItem(
              title: "Burger",
              svgsrc: "assets/icons/burger_beer.svg",
              price: 5,
            ),
            DishItem(
              title: "Burger",
              svgsrc: "assets/icons/burger_beer.svg",
              price: 5,
            ),
          ],
        ),
      ),
    );
  }
}

class DishItem extends StatelessWidget {
  const DishItem({
    Key? key,
    required String svgsrc,
    required String title,
    required double price,
  })  : _svgsrc = svgsrc,
        _price = price,
        _title = title,
        super(key: key);
  final double _price;
  final String _svgsrc, _title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 20,
            color: const Color(0xFFB0CCE1).withOpacity(0.32),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(_svgsrc),
                    Text(_title),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Price: $_price\$",
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      color: Colors.amber,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
