// ignore_for_file: prefer_const_constructors, camel_case_types, duplicate_ignore, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';

// ignore: camel_case_types
class card extends StatelessWidget {
  card({super.key, required this.userImageURL, required this.userThumbnail, required this.userFullName, required this.username});

  final String userImageURL;
  final String userThumbnail;
  final String userFullName;
  final String username;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xFFF3C374),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 360,
                  height: 350,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff2f3361).withOpacity(.90),
                            Color(0xff2f3361).withOpacity(.65),
                            Color(0xff2f3361),
                            Color(0xff2f3361)
                          ]),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 25,
                        child: Wrap(
                          children: [
                            Container(
                              width: 180,
                              padding: EdgeInsets.only(left: 30),
                              alignment: Alignment.centerLeft,
                              child: Icon(Icons.notifications,
                                  color: Color(0xff8B8FC9)),
                            ),
                            Container(
                              width: 180,
                              padding: EdgeInsets.only(right: 30),
                              alignment: Alignment.centerRight,
                              child:
                                  Icon(Icons.mail, color: Color(0xff8B8FC9)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Wrap(
                          children: [
                            Center(
                              child: Container(
                                width: 175,
                                height: 175,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Color(0xff8B8FC9)),
                                  image: DecorationImage(
                                    image:
                                        NetworkImage(userImageURL),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 360,
                              height: 75,
                              padding: EdgeInsets.only(top: 20),
                              child: Wrap(
                                children: [
                                  Center(
                                    child: Container(
                                      width: 360,
                                      height: 50,
                                      child: Center(
                                        child: Text(
                                          userFullName,
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.white,
                                            fontFamily: 'MPlus',
                                            fontWeight: FontWeight.w300,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 360,
                                    height: 25,
                                    alignment: Alignment.center,
                                    child: Text(
                                      username,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff8B8FC9),
                                        fontFamily: 'MPlus',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 360,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                  ),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: [
                      Stack(
                        children: [
                          Container(
                            child: FractionalTranslation(
                              translation: Offset(5, -0.5),
                              child: FloatingActionButton(
                                onPressed: () {
                                  // Add your onPressed code here!
                                },
                                backgroundColor: Color(0xff63BEE5),
                                child: const FaIcon(FontAwesomeIcons.twitter),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 358 / 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "379",
                                  style: TextStyle(
                                    fontSize: 33,
                                    color: Colors.black,
                                    fontFamily: 'MPlus',
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(
                                  "TWEETS",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black.withOpacity(0.4),
                                    fontFamily: 'MPlus',
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 1,
                        alignment: Alignment.center,
                        child: SizedBox(
                          child: Text("|",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: "MPlus",
                                fontWeight: FontWeight.w200,
                                color: Color(0xffC6C4C9).withOpacity(0.9),
                              )),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 358 / 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "766",
                              style: TextStyle(
                                fontSize: 33,
                                color: Colors.black,
                                fontFamily: 'MPlus',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              "FOLLOWING",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black.withOpacity(0.4),
                                fontFamily: 'MPlus',
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 1,
                        alignment: Alignment.center,
                        child: SizedBox(
                          child: Text("|",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: "MPlus",
                                fontWeight: FontWeight.w200,
                                color: Color(0xffC6C4C9).withOpacity(0.9),
                              )),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 358 / 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "166",
                              style: TextStyle(
                                fontSize: 33,
                                color: Colors.black,
                                fontFamily: 'MPlus',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              "FOLLOWERS",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black.withOpacity(0.4),
                                fontFamily: 'MPlus',
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
