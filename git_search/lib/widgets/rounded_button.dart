import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.text, this.icon, this.function});

  final text;
  final icon;
  final function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: function,
        child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Container(
                height: 50,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ],
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    "$text",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ))));
  }
}
