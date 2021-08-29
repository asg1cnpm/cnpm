import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:food_web/widgets/dishes.dart';
import 'models/transaction.dart';
import 'widgets/cart.dart';
import 'widgets/categories.dart';

void main() {
  runApp(const MyApp());
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Order',
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final double _height = 700;
  final double _width = 1000;
  final List<Transaction> _list = List.generate(
      5,
      (index) => Transaction(
          type: "Rice",
          svgsrc: "assets/icons/burger_beer.svg",
          title: "Burger",
          price: 5.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(color: Colors.grey),
          child: Container(
            height: _height,
            width: _width,
            decoration: const BoxDecoration(color: Colors.white),
            child: Row(
              children: [
                SizedBox(
                  height: _height,
                  width: _width * 0.65,
                  child: Column(
                    children: [
                      SizedBox(
                        height: _height * 0.1,
                        child: Card(
                          elevation: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: IconButton(
                                  onPressed: () => {},
                                  icon: const Icon(Icons.arrow_back),
                                ),
                              ),
                              const Text("Back to home")
                            ],
                          ),
                        ),
                      ),
                      Categories(height: _height),
                      Dishes(height: _height),
                    ],
                  ),
                ),
                Cart(height: _height, width: _width),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
