import 'dart:js';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itelective5/card.dart';
import 'package:itelective5/navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              width: MediaQuery.of(context).size.width * 1 / 3,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              color: Colors.red,
              child: SidebarXExampleApp(),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 1 / 3,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                color: Colors.green,
                child: Image.asset(
                  'assets/images/kanagawa.png',
                  fit: BoxFit.cover,
                  width: 150,
                  height: 150,
                )),
            Container(
              width: MediaQuery.of(context).size.width * 1 / 3,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              child: Wrap(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1 / 2,
                    child: card(),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1 / 2,
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.all(20),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: logoutButton(context, '/')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

ElevatedButton logoutButton(BuildContext context, String route) {
  return ElevatedButton(
    onPressed: () {
      Navigator.pushNamedAndRemoveUntil(
          context, route, ModalRoute.withName('/'));
    },
    style: ElevatedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        backgroundColor: Color(0xff29B1CC)),
    child: Text(
      "Logout",
      style: GoogleFonts.roboto(
          textStyle: TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white)),
    ),
  );
}
