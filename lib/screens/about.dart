import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itelective5/elements/card.dart';
import 'package:itelective5/elements/navbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:itelective5/screens/signup.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
            child: NavBar(index: 4),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 1 / 3,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            color: Color(0xFFF3C374),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Image.asset(
                      'assets/images/flutter.png',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
                Column(
                  children: [
                    inputContainer(context, "1. The setup experience",
                        "Setting up Flutter was incredibly easy and smooth. The process was straightforward, with clear instructions, guidance from my professor, and an intuitive setup wizard. The user-friendly interface made it simple to install the necessary tools and dependencies, and the whole process was completed in a short period of time."),
                    inputContainer(
                        context,
                        "2. The building and running experience",
                        "Building and running applications in Flutter is a delightful experience. The framework provides a rich set of tools and widgets that make creating beautiful and functional apps easy. The hot reload feature is beneficial, allowing developers to see real-time changes and making the development process faster and more efficient."),
                    inputContainer(
                        context,
                        "3. The highs and lows in your coding practice",
                        "Coding in Flutter has its ups and downs, like any programming framework. Based on my experience, the highs of using the Flutter framework would be that it makes developing the frontend much easier; on the other hand, the lows would be that since it is a new environment, you are expected to learn everything from scratch and work your way up."),
                    inputContainer(
                        context,
                        "4. The first bug you got your legit frustration while coding",
                        "I did not encounter any frustrating bugs so far. However, there was an experience that got me frustrated in Flutter, it was when I needed to push my code in GitHub, but an error appeared that I could not push it into the GitHub. I was frustrated because my time was also already constrained because the computer laboratory was already closing. I just turned off the computer immediately and get back to it on another day."),
                    inputContainer(context, "5. The first eureka moment",
                        "My first eureka moment in Flutter was after I created my first project because I was amazed by the rich set of tools and widgets that Flutter provides, which makes it easy to build complex user interfaces and animations. The framework's performance, with smooth animations and fast load times. These moments are what make Flutter such an enjoyable platform to code in, and are a testament to its power and versatility."),
                  ],
                ),
              ],
            ),
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
      drawer: NavBar(index: 4),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Image.asset(
                  'assets/images/flutter.png',
                  fit: BoxFit.cover,
                  width: 75,
                  height: 75,
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  inputContainer(context, "1. The setup experience",
                      "Setting up Flutter was incredibly easy and smooth. The process was straightforward, with clear instructions, guidance from my professor, and an intuitive setup wizard. The user-friendly interface made it simple to install the necessary tools and dependencies, and the whole process was completed in a short period of time."),
                  inputContainer(
                      context,
                      "2. The building and running experience",
                      "Building and running applications in Flutter is a delightful experience. The framework provides a rich set of tools and widgets that make creating beautiful and functional apps easy. The hot reload feature is beneficial, allowing developers to see real-time changes and making the development process faster and more efficient."),
                  inputContainer(
                      context,
                      "3. The highs and lows in your coding practice",
                      "Coding in Flutter has its ups and downs, like any programming framework. Based on my experience, the highs of using the Flutter framework would be that it makes developing the frontend much easier; on the other hand, the lows would be that since it is a new environment, you are expected to learn everything from scratch and work your way up."),
                  inputContainer(
                      context,
                      "4. The first bug you got your legit frustration while coding",
                      "I did not encounter any frustrating bugs so far. However, there was an experience that got me frustrated in Flutter, it was when I needed to push my code in GitHub, but an error appeared that I could not push it into the GitHub. I was frustrated because my time was also already constrained because the computer laboratory was already closing. I just turned off the computer immediately and get back to it on another day."),
                  inputContainer(context, "5. The first eureka moment",
                      "My first eureka moment in Flutter was after I created my first project because I was amazed by the rich set of tools and widgets that Flutter provides, which makes it easy to build complex user interfaces and animations. The framework's performance, with smooth animations and fast load times. These moments are what make Flutter such an enjoyable platform to code in, and are a testament to its power and versatility."),
                ],
              ),
            ),
          ],
        ),
      ));
}

Container inputContainer(BuildContext context, String question, String answer) {
  return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1 / 7,
      padding: EdgeInsets.only(top: 10),
      margin: EdgeInsets.only(bottom: 10, left: 5, right: 5),
      decoration: BoxDecoration(
          color: Color(0xFFE35333), borderRadius: BorderRadius.circular(10)),
      child: input(context, question, answer));
}

Container input(BuildContext context, String question, String answer) {
  return Container(
    padding: EdgeInsets.only(left: 10, right: 10),
    child: Column(
      children: [
        Container(
            alignment: Alignment.topLeft,
            child: Text(question,
                textAlign: TextAlign.start,
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2E3E5E))))),
        Flexible(
            child: Text(
          answer,
          textAlign: TextAlign.justify,
          style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFAF3DC))),
        )),
      ],
    ),
  );
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
