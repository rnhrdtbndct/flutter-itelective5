import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: camel_case_types
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginScreen> {
  int activeIndex = 0;
  final images = [
    'assets/images/everest.jpg',
    'assets/images/underwater1.jpg',
    'assets/images/beach1.jpg',
    'assets/images/beach2.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth >= 1000 && constraints.maxHeight >= 600) {
        return webView(context);
      } else if (constraints.maxWidth < 1000 &&
          constraints.maxWidth > 380 &&
          constraints.maxHeight >= 600) {
        return mobileView(context);
      } else {
        return noView(context);
      }
    }));
  }

  Scaffold noView(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0xff14202A),
          child: Text(
            "Website not viewable on this screen size",
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff29B1CC))),
            textAlign: TextAlign.center,
          )),
    );
  }

  Scaffold mobileView(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  child: carouselSlider(context),
                ),
                Container(
                    padding: const EdgeInsets.all(30),
                    alignment: Alignment.bottomRight,
                    child: buildIndicator())
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 380,
                height: 600,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.85),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(top: 30, left: 30),
                              width: 50,
                              height: 50,
                              child: Icon(Icons.camera_alt_outlined),
                            ),
                            Container(
                              alignment: Alignment.bottomLeft,
                              padding: EdgeInsets.only(top: 30, left: 5),
                              width: 140,
                              height: 50,
                              child: Text("Photoma",
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black))),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(top: 30, right: 30),
                          width: 190,
                          height: 50,
                          child: Text(
                            "Home",
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade500)),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      width: 500,
                      height: 500,
                      child: Padding(
                        padding: EdgeInsets.only(left: 25, top: 50, right: 25),
                        child: Column(
                          children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "START YOUR PERSONAL PHOTO EXPERIENCE",
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade500)),
                                )),
                            Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(top: 15),
                                child: Text(
                                  "Login your Account",
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                )),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(
                                top: 10,
                                left: 10,
                              ),
                              child: Text(
                                "E-Mail",
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade500)),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(
                                top: 5,
                              ),
                              child: TextField(
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 5),
                                  prefixIcon: Icon(Icons.mail_outline),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(
                                top: 10,
                                left: 10,
                              ),
                              child: Text(
                                "Password",
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade500)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(top: 5),
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 5),
                                  prefixIcon: Icon(Icons.key_outlined),
                                  suffixIcon:
                                      Icon(Icons.remove_red_eye_outlined),
                                ),
                              ),
                            ),
                            Container(
                              child: Container(
                                padding: EdgeInsets.only(top: 15),
                                child: Row(
                                  children: [
                                    Container(
                                        width: 165,
                                        height: 55,
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10, right: 10),
                                        child: registerButton()),
                                    Container(
                                        width: 165,
                                        height: 55,
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10, left: 10),
                                        child: loginButton()),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              child: Container(
                                child: Row(
                                  children: [
                                    Container(
                                      width: 165,
                                      height: 55,
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Checkbox(
                                            value: true,
                                            onChanged: (logo) {
                                              setState(() {});
                                            },
                                          ),
                                          Container(
                                              child: Text(
                                            "Remember Me",
                                            style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black)),
                                          )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        width: 165,
                                        height: 55,
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "Forgot Password?",
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey.shade400)),
                                          textAlign: TextAlign.end,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(),
                                    child: Row(children: [
                                      socMedButton(
                                          FaIcon(FontAwesomeIcons.facebook),
                                          Color(0xff3B5998)),
                                      socMedButton(
                                          FaIcon(FontAwesomeIcons.twitter),
                                          Color(0xff00acee)),
                                      socMedButton(
                                          FaIcon(FontAwesomeIcons.google),
                                          Color(0xff3cba54)),
                                    ]),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 30),
                          width: 190,
                          height: 50,
                          child: Text(
                            "Impress",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 30),
                          width: 190,
                          height: 50,
                          child: Text(
                            "EN",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ],
    ));
  }

  Scaffold webView(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Color(0xffEDF2F2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 500,
              height: 600,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade400, blurRadius: 10),
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              child: Column(
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(top: 30, left: 30),
                            width: 50,
                            height: 50,
                            child: Icon(Icons.camera_alt_outlined),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(top: 30, left: 5),
                            width: 175,
                            height: 50,
                            child: Text("Photoma",
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black))),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(top: 30, right: 30),
                        width: 250,
                        height: 50,
                        child: Text(
                          "Home",
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade500)),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    width: 500,
                    height: 500,
                    child: Padding(
                      padding: EdgeInsets.only(left: 75, top: 50, right: 75),
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "START YOUR PERSONAL PHOTO EXPERIENCE",
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade500)),
                              )),
                          Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                "Login your Account",
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                              )),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 10,
                            ),
                            child: Text(
                              "E-Mail",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade500)),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                              top: 5,
                            ),
                            child: TextField(
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 5),
                                prefixIcon: Icon(Icons.mail_outline),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 10,
                            ),
                            child: Text(
                              "Password",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade500)),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(top: 5),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 5),
                                prefixIcon: Icon(Icons.key_outlined),
                                suffixIcon: Icon(Icons.remove_red_eye_outlined),
                              ),
                            ),
                          ),
                          Container(
                            child: Container(
                              padding: EdgeInsets.only(top: 15),
                              child: Row(
                                children: [
                                  Container(
                                      width: 175,
                                      height: 55,
                                      padding: EdgeInsets.only(
                                          top: 10, bottom: 10, right: 10),
                                      child: registerButton()),
                                  Container(
                                      width: 175,
                                      height: 55,
                                      padding: EdgeInsets.only(
                                          top: 10, bottom: 10, left: 10),
                                      child: loginButton()),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  width: 175,
                                  height: 55,
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        value: true,
                                        onChanged: (logo) {
                                          setState(() {});
                                        },
                                      ),
                                      Container(
                                          child: Text(
                                        "Remember Me",
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black)),
                                      )),
                                    ],
                                  ),
                                ),
                                Container(
                                    width: 175,
                                    height: 55,
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "Forgot Password?",
                                      style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade400)),
                                      textAlign: TextAlign.end,
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(),
                                  child: Row(children: [
                                    socMedButton(
                                        FaIcon(FontAwesomeIcons.facebook),
                                        Color(0xff3B5998)),
                                    socMedButton(
                                        FaIcon(FontAwesomeIcons.twitter),
                                        Color(0xff00acee)),
                                    socMedButton(
                                        FaIcon(FontAwesomeIcons.google),
                                        Color(0xff3cba54)),
                                  ]),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 30),
                        width: 250,
                        height: 50,
                        child: Text(
                          "Impress",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 30),
                        width: 250,
                        height: 50,
                        child: Text(
                          "EN",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            child: Container(
              width: 500,
              height: 600,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                      width: 500,
                      height: 600,
                      alignment: Alignment.center,
                      child: carouselSlider(context)),
                  Container(
                      padding: const EdgeInsets.all(30),
                      alignment: Alignment.bottomRight,
                      child: buildIndicator())
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  ElevatedButton loginButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          backgroundColor: Color(0xff29B1CC)),
      child: Text(
        "Login",
        style: GoogleFonts.roboto(
            textStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
    );
  }

  ElevatedButton registerButton() {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: const BorderSide(color: Color(0xff29B1CC))),
            backgroundColor: Colors.white),
        child: Text(
          "Register",
          style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff29B1CC))),
        ));
  }

  ElevatedButton socMedButton(FaIcon logo, Color color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          padding: EdgeInsets.all(15),
          backgroundColor: color),
      child: logo,
    );
  }

  CarouselSlider carouselSlider(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: images.length,
      itemBuilder: (context, index, realIndex) {
        final image = images[index];
        return buildImage(image, index);
      },
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height,
        viewportFraction: 1,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        onPageChanged: (index, reason) => setState(() => activeIndex = index),
      ),
    );
  }

  Widget buildImage(String image, int index) =>
      Container(child: Image.network(image, fit: BoxFit.cover));

  Widget buildIndicator() => AnimatedSmoothIndicator(
        effect: const ExpandingDotsEffect(
            dotWidth: 5, dotHeight: 5, activeDotColor: Colors.blue),
        activeIndex: activeIndex,
        count: images.length,
      );
}
