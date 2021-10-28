import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'data.dart';
import 'main.dart';

List<Tab> categoryTabGenerator(double height) {
  List<Tab> list = [];
  for (int i = 0; i < dishCategory.length; i++) {
    list.add(
      Tab(
        height: height * 0.2 * 0.8,
        child: CategoryCard(index: i),
      ),
    );
  }
  return list;
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.index,
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 50,
      child: Container(
        width: 160,
        //height: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 20,
              color: Color(0xFFB0CCE1),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(dishCategory[index].svgSrc),
            // const SizedBox(
            //   height: 10,
            // ),
            Text(
              dishCategory[index].categoryName,
            ),
          ],
        ),
      ),
    );
  }
}
