import  'package:flutter/material.dart';

class IntroPage6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Center(
        child: Image(
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            image: AssetImage('lib/assets/images/IntroPage6.png')),),
    );
  }
}
