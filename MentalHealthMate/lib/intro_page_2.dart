import  'package:flutter/material.dart';

class IntroPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Center(
        child: Image(
          width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            image: AssetImage('lib/assets/images/IntroPage2.png')),),
    );
  }
}
