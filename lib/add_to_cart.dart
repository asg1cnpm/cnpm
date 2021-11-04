import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'data.dart';

Widget _decreaseButton(BuildContext context) {
  return IconButton(
    onPressed: () {
      context.read<SelectedItemProvider>().decreaseTemp();
    },
    icon: const Icon(Icons.remove),
  );
}

Widget _increaseButton(BuildContext context) {
  return IconButton(
    color: Colors.red,
    onPressed: () {
      context.read<SelectedItemProvider>().increaseTemp();
    },
    icon: const Icon(Icons.add),
  );
}

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key? key,
    required this.cateIndex,
    required this.index,
  }) : super(key: key);

  final int cateIndex;
  final int index;

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
            color: const Color(0xFFB0CCE1).withOpacity(0.7),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            double _height = 400;
            double _width = 700;
            showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text(
                  "ADD TO CART",
                  style: TextStyle(color: Colors.red),
                ),
                content: SizedBox(
                    height: _height,
                    width: _width,
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                dishCategory[cateIndex]
                                    .listDishItem[index]
                                    .svgSrc,
                                width: 100,
                                height: 100,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "Name: ",
                                        style: TextStyle(fontSize: 40),
                                      ),
                                      Text(
                                        dishCategory[cateIndex]
                                            .listDishItem[index]
                                            .dishName,
                                        style: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 40,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "Price: ",
                                        style: TextStyle(fontSize: 40),
                                      ),
                                      Text(
                                        "\$" +
                                            dishCategory[cateIndex]
                                                .listDishItem[index]
                                                .price
                                                .toStringAsFixed(2),
                                        style: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 40,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "Quantity: ",
                                        style: TextStyle(fontSize: 40),
                                      ),
                                      _decreaseButton(context),
                                      Text(
                                        context
                                            .watch<SelectedItemProvider>()
                                            .tempDetailQuantity
                                            .toString(),
                                        style: const TextStyle(fontSize: 40),
                                      ),
                                      _increaseButton(context),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    )),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<SelectedItemProvider>().tempDetailQuantity =
                          1;
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<SelectedItemProvider>()
                          .add(cateIndex, index);
                      Navigator.pop(context);
                    },
                    child: const Text("Add to cart"),
                  ),
                ],
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                        dishCategory[cateIndex].listDishItem[index].svgSrc),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(dishCategory[cateIndex].listDishItem[index].dishName),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Price: ${dishCategory[cateIndex].listDishItem[index].price}\$",
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                        context
                            .read<SelectedItemProvider>()
                            .add(cateIndex, index);
                      },
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
