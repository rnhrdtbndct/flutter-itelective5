import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itelective5/elements/card.dart';
import 'package:itelective5/elements/navbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        LayoutBuilder(builder: (BuildContext, BoxConstraints constraints) {
      if (constraints.maxWidth > 1100) {
        return webView(context);
      } else {
        return mobileView(context);
      }
    }));
  }
}

Scaffold webView(BuildContext context) {
  return Scaffold(
    body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Wrap(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 1 / 3,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.centerLeft,
            color: Color(0xFFF3C374),
            child: NavBar(index: 0),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 1 / 3,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            color: Color(0xFFF3C374),
            child: Image.asset("assets/images/kanagawa.png"),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 1 / 3,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            color: Color(0xFFF3C374),
            child: userDrawer(context),
          )
        ],
      ),
    ),
  );
}

Scaffold mobileView(BuildContext context) {
  return Scaffold(
      drawer: NavBar(index: 0),
      endDrawer: userDrawer(context),
      appBar: AppBar(backgroundColor: Color(0xFFE35333), actions: [
        Builder(
            builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                icon: Icon(FontAwesomeIcons.user),
                padding: EdgeInsets.only(right: 10)))
      ]),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        color: Color(0xFFF3C374),
        child: Image.asset("assets/images/kanagawa.png"),
      ));
}

Container userDrawer(BuildContext context) {
  return Container(
    width: 365,
    height: MediaQuery.of(context).size.height,
    alignment: Alignment.center,
    color: Color(0xFFF3C374),
    child: Wrap(
      children: [
        Container(
            width: 365,
            height: MediaQuery.of(context).size.height * 3 / 4,
            child: card()),
        Center(
          child: Container(
              width: 350, height: 50, child: logoutButton(context, "/")),
        ),
      ],
    ),
  );
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
