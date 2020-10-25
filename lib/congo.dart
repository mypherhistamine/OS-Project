import 'package:flutter/material.dart';

class Congo extends StatelessWidget {
  const Congo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 250,
          child: Text('Thanks for saving\n\nmillions of lives !! ',style: TextStyle(
            fontSize: 30,


          ),),
        ),
      ),
    );
  }
}
