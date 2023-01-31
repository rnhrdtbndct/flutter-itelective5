import 'package:flutter/material.dart';
import 'package:itelective5/card.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Wrap(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1/3,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              color: Colors.red,
              child: Image.asset('assets/images/kanagawa.png', fit: BoxFit.cover, width: 150, height: 150,)
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1/3,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              color: Colors.green,
              child: Image.asset('assets/images/kanagawa.png', fit: BoxFit.cover, width: 150, height: 150,)
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1/3,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              color: Colors.blue,
              child: Image.asset('assets/images/kanagawa.png', fit: BoxFit.cover, width: 150, height: 150,)
            ),
          ],
        ),
      ),
    );
  }
}