import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:itelective5/elements/card.dart';
import 'package:itelective5/elements/navbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userURL = Uri.parse('https://randomuser.me/api/');
  var userImageURL;
  var userThumbnail;
  var userFullName;
  var username;

  @override
  void initState(){
    super.initState();

     getData().then((value) {
      var data = jsonDecode(value.body);
      setState(() {
        userImageURL = data['results'][0]['picture']['medium'];
        userThumbnail = data['results'][0]['picture']['thumbnail'];
        userFullName = data['results'][0]['name']['first'] + ' ' + data['results'][0]['name']['last'];
        username = data['results'][0]['login']['username'];
      });
    });
  }

  Future<Response> getData() async{
    Response response = await get(userURL);
    return response;
  }

  Widget build(BuildContext context) {
    return Scaffold(body:
        LayoutBuilder(builder: (BuildContext, BoxConstraints constraints) {
      if (constraints.maxWidth > 1100) {
        return webView(context, userImageURL, userThumbnail, userFullName, username);
      } else {
        return mobileView(context, userImageURL, userThumbnail, userFullName, username);
      }
    }));
  }
}

Scaffold webView(BuildContext context, String userImageURL, String userThumbnail, String userFullName, String username) {
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
            child: Image.asset("assets/images/kanagawa.png", fit: BoxFit.cover, width: 250, height: 250),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 1 / 3,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            color: Color(0xFFF3C374),
            child: userDrawer(context, userImageURL, userThumbnail, userFullName, username),
          )
        ],
      ),
    ),
  );
}

Scaffold mobileView(BuildContext context, String userImageURL, String userThumbnail, String userFullName, String username) {
  return Scaffold(
      drawer: NavBar(index: 0),
      endDrawer: userDrawer(context, userImageURL, userThumbnail, userFullName, username),
      appBar: AppBar(backgroundColor: Color(0xFFE35333), actions: [
        Builder(
            builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                icon: CircleAvatar(backgroundImage: NetworkImage(userThumbnail)),
                iconSize: 50.0,
                ))
      ]),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        color: Color(0xFFF3C374),
        child: Image.asset("assets/images/kanagawa.png",  fit: BoxFit.cover, width: 250, height: 250),
      ));
}

Container userDrawer(BuildContext context, String userImageURL, String userThumbnail, String userFullName, String username) {
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
            child: card(userImageURL: userImageURL, userThumbnail: userThumbnail, userFullName: userFullName, username: username)),
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
        backgroundColor: Color(0xFF2E3E5E)),
    child: Text(
      "Logout",
      style: GoogleFonts.roboto(
          textStyle: TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white)),
    ),
  );
}
