import 'package:flutter/material.dart';
import 'order.dart';

TextStyle style = const TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
final emailController = TextEditingController();
final passwordController = TextEditingController();
bool authenticate() {
  //check emailController.text and passWordController.tẽt
  return true;
}

Widget loginScreen(BuildContext context) {
  const double _height = 700, _width = 1000;
  final emailField = TextField(
    obscureText: false,
    style: style,
    controller: emailController,
    decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(10, 1, 2, 1),
        hintText: "Email",
        fillColor: Colors.blue,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(3))),
  );
  final passwordField = TextField(
    obscureText: true,
    style: style,
    controller: passwordController,
    decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(10, 1, 2, 1),
        hintText: "Password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(3))),
  );
  final loginButon = Material(
    elevation: 5.0,
    borderRadius: BorderRadius.circular(3),
    color: Colors.blue,
    child: MaterialButton(
      padding: const EdgeInsets.fromLTRB(2, 1, 2, 1),
      onPressed: () {
        if (authenticate()) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const OrderPage()));
        }
      },
      child: Text("Login",
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
    ),
  );
  final guestButton = Material(
    elevation: 5.0,
    borderRadius: BorderRadius.circular(3),
    color: Colors.blue,
    child: MaterialButton(
      padding: const EdgeInsets.fromLTRB(2, 1, 2, 1),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const OrderPage()));
      },
      child: Text("Order now",
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
    ),
  );
  return LoginWidget(
      height: _height,
      width: _width,
      emailField: emailField,
      passwordField: passwordField,
      loginButon: loginButon,
      guestButton: guestButton);
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    Key? key,
    required double height,
    required double width,
    required this.emailField,
    required this.passwordField,
    required this.loginButon,
    required this.guestButton,
  })  : _height = height,
        _width = width,
        super(key: key);

  final double _height;
  final double _width;
  final TextField emailField;
  final TextField passwordField;
  final Material loginButon;
  final Material guestButton;

  @override
  Widget build(BuildContext context) {
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
                  const SizedBox(height: 20),
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
