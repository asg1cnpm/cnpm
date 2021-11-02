import 'package:flutter/material.dart';
import 'data.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

Widget _decreaseButton(int index, BuildContext context) {
  return IconButton(
    onPressed: () {
      context.read<SelectedItemProvider>().decrease(index);
    },
    icon: const Icon(Icons.remove),
  );
}

Widget _increaseButton(int index, BuildContext context) {
  return IconButton(
    color: Colors.red,
    onPressed: () {
      context.read<SelectedItemProvider>().increase(index);
    },
    icon: const Icon(Icons.add),
  );
}

class CartItemList extends StatelessWidget {
  const CartItemList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: ListView.builder(
        itemCount: context.watch<SelectedItemProvider>().selectedItem.length,
        controller: ScrollController(),
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 20,
                    color: Color(0xFFB0CCE1),
                    offset: Offset(0, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(context
                        .watch<SelectedItemProvider>()
                        .selectedItem[index]
                        .selectedDish
                        .svgSrc),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "${index + 1}. ${context.watch<SelectedItemProvider>().selectedItem[index].selectedDish.dishName}"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _decreaseButton(index, context),
                            Text(
                                "${context.watch<SelectedItemProvider>().selectedItem[index].quantity}"),
                            _increaseButton(index, context),
                          ],
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                            "\$ ${context.watch<SelectedItemProvider>().selectedItem[index].selectedDish.price * context.watch<SelectedItemProvider>().selectedItem[index].quantity}"),
                        Text(
                            "Incl tax 10% = ${(context.watch<SelectedItemProvider>().selectedItem[index].selectedDish.price * context.watch<SelectedItemProvider>().selectedItem[index].quantity * 0.1).toStringAsFixed(2)}"),
                      ],
                    ),
                    Expanded(
                      child: IconButton(
                          onPressed: () {
                            int id = context
                                .read<SelectedItemProvider>()
                                .selectedItem[index]
                                .selectedDish
                                .itemID;
                            // print(id);
                            context.read<SelectedItemProvider>().remove(id);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
