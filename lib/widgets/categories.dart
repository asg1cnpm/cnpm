import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
    required double height,
  })  : _height = height,
        super(key: key);

  final double _height;
  final double _width = 160;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height * 0.2,
      child: Card(
        elevation: 50,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
          height: _height * 0.2 * 0.8,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ItemCard(
                width: _width,
                title: "Vietnamese",
                svgsrc: "assets/icons/burger_beer.svg",
                press: () {},
              ),
              ItemCard(
                width: _width,
                title: "Vietnamese",
                svgsrc: "assets/icons/chinese_noodles.svg",
                press: () {},
              ),
              ItemCard(
                width: _width,
                title: "Vietnamese",
                svgsrc: "assets/icons/burger_beer.svg",
                press: () {},
              ),
              ItemCard(
                width: _width,
                title: "Vietnamese",
                svgsrc: "assets/icons/chinese_noodles.svg",
                press: () {},
              ),
              ItemCard(
                width: _width,
                title: "Vietnamese",
                svgsrc: "assets/icons/burger_beer.svg",
                press: () {},
              ),
              ItemCard(
                width: _width,
                title: "Vietnamese",
                svgsrc: "assets/icons/chinese_noodles.svg",
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required double width,
    required String title,
    required String svgsrc,
    required Function press,
  })  : _width = width,
        _title = title,
        _svgsrc = svgsrc,
        _press = press,
        super(key: key);

  final double _width;
  final String _title;
  final String _svgsrc;
  // ignore: unused_field
  final Function _press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: _width,
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
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(_svgsrc),
                Text(_title),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
