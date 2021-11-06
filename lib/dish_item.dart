import 'package:flutter/material.dart';
import 'add_to_cart.dart';
import 'dish_category.dart';
import 'data.dart';

class DishItemWidget extends StatefulWidget {
  const DishItemWidget({required this.height, Key? key}) : super(key: key);

  final double height;
  @override
  _DishItemWidgetState createState() => _DishItemWidgetState();
}

class _DishItemWidgetState extends State<DishItemWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: dishCategory.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height * 0.9,
      child: Column(
        children: [
          SizedBox(
            height: widget.height * 0.2,
            child: Card(
              elevation: 50,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicatorWeight: 4.0,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.redAccent,
                  isScrollable: true,
                  tabs: categoryTabGenerator(widget.height),
                ),
              ),
            ),
          ),
          SizedBox(
            height: widget.height * 0.7,
            child: Card(
              elevation: 50,
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: dishItemGenerator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<ItemBuilder> dishItemGenerator() {
  List<ItemBuilder> list = [];
  for (int cateIndex = 0; cateIndex < dishCategory.length; cateIndex++) {
    list.add(
      ItemBuilder(cateIndex: cateIndex),
    );
  }
  return list;
}

class ItemBuilder extends StatelessWidget {
  const ItemBuilder({
    Key? key,
    required this.cateIndex,
  }) : super(key: key);

  final int cateIndex;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: ScrollController(),
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: dishCategory[cateIndex].listDishItem.length,
      itemBuilder: (context, index) {
        return AddToCart(
          cateIndex: cateIndex,
          index: index,
        );
      },
    );
  }
}
