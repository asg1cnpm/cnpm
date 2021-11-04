import 'package:flutter/material.dart';
import 'order.dart';
import 'package:provider/provider.dart';
import 'dart:ui';
import 'data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SelectedItemProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        scrollBehavior: MyCustomScrollBehavior(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Login(),
      ),
    );
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter login UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool authenticate() {
    //check emailController.text and passWordController.tẽt
    return true;
  }

  @override
  Widget build(BuildContext context) {
    const double _height = 700, _width = 1000;
    final emailField = TextField(
      obscureText: false,
      style: style,
      controller: emailController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(2, 1, 2, 1),
          hintText: "Email",
          fillColor: Colors.blue,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(3))),
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      controller: passwordController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(2, 1, 2, 1),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(3))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(3),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(2, 1, 2, 1),
        onPressed: () {
          if (authenticate()) {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const Order()),
            // );
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Order()));
          }
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final guestButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(3),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(2, 1, 2, 1),
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const Order()),
          // );
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Order()));
        },
        child: Text("Order now",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 50,
          child: Container(
            height: _height,
            width: _width,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   height: _height * 0.3,
                  //   width: _width * 0.3,
                  //   child: Image.asset(
                  //     "assets/logo.png",
                  //     fit: BoxFit.contain,
                  //   ),
                  // ),
                  SizedBox(height: _height * 0.1, width: _width * 0.7),
                  SizedBox(
                      height: _height * 0.1,
                      width: _width * 0.3,
                      child: emailField),
                  SizedBox(
                      height: _height * 0.1,
                      width: _width * 0.3,
                      child: passwordField),
                  SizedBox(
                      height: _height * 0.05,
                      width: _width * 0.3,
                      child: loginButon),
                  SizedBox(height: 20),
                  SizedBox(
                      height: _height * 0.05,
                      width: _width * 0.3,
                      child: guestButton)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
