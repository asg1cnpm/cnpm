import 'package:flutter/material.dart';
import 'package:pos/dish_item.dart';
import 'return_button.dart';
import 'dart:ui';
import 'dine_in.dart';
import 'cart_item_list.dart';
import 'package:provider/provider.dart';
import 'data.dart';
import 'check_out.dart';
// import 'login.dart';

// void main() {
//   runApp(const MyApp());
// }

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class Order extends StatelessWidget {
  const Order({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SelectedItemProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'POS',
        scrollBehavior: MyCustomScrollBehavior(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const OrderPage(),
      ),
    );
  }
}

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  final double _height = 700, _width = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: _height,
          width: _width,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              SizedBox(
                height: _height,
                width: _width * 0.65,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ReturnButton(height: _height),
                    DishItemWidget(height: _height),
                  ],
                ),
              ),
              SizedBox(
                height: _height,
                width: _width * 0.35,
                child: Card(
                  elevation: 50,
                  child: Column(
                    children: const [
                      //DINE IN ////////////////////////
                      DineInButton(),
                      //SELECTED ITEM///////////////////////////
                      CartItemList(),
                      //PAYMENT///////////////////////////////////////
                      CheckOut(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
