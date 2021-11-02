import 'package:flutter/material.dart';
import 'data.dart';
import 'package:provider/provider.dart';

class DineInButton extends StatelessWidget {
  const DineInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.red,
              size: 30,
            ),
            Text(
              "Your Cart (${context.watch<SelectedItemProvider>().totalitem()})",
              style: const TextStyle(
                  color: Colors.red, fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Expanded(child: Container()),
            ElevatedButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("Dine In"),
                ))
          ],
        ),
      ),
    );
  }
}
