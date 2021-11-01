import 'package:flutter/material.dart';
import 'package:pos/data.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Total:"),
              ),
              Expanded(
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(context
                        .watch<SelectedItemProvider>()
                        .total()
                        .toStringAsFixed(2)),
                    Text(
                        "Incl tax 10% = \$ ${(context.watch<SelectedItemProvider>().total() * 0.1).toStringAsFixed(2)}")
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                height: 50,
                child: const Center(
                  child: Text("PAYMENT"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
