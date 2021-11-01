import 'package:flutter/material.dart';
import 'login.dart';

class ReturnButton extends StatelessWidget {
  const ReturnButton({
    Key? key,
    required double height,
  })  : _height = height,
        super(key: key);

  final double _height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height * 0.1,
      child: Card(
        elevation: 50,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.arrow_back),
                    SizedBox(width: 10),
                    Text("Back to home"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
