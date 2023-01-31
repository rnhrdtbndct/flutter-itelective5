// ignore_for_file: prefer_const_constructors, camel_case_types, duplicate_ignore, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: camel_case_types
class card extends StatelessWidget {
  const card({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height,
            //   child: ColorFiltered(
            //       colorFilter: const ColorFilter.mode(
            //         Color(0xff41446A),
            //         BlendMode.color,
            //       ),
            //       child: Image.asset('assets/images/everest.jpg',
            //           fit: BoxFit.cover)),
            // ),
            Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 400,
                    height: 400,
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
                        Wrap(
                          children: [
                            Container(
                              width: 200,
                              padding: EdgeInsets.only(
                                left: 50,
                              ),
                              alignment: Alignment.topLeft,
                              child: Icon(Icons.notifications,
                                  color: Color(0xff8B8FC9)),
                            ),
                            Container(
                              width: 200,
                              padding: EdgeInsets.only(
                                right: 50,
                              ),
                              alignment: Alignment.topRight,
                              child: Icon(Icons.mail, color: Color(0xff8B8FC9)),
                            ),
                          ],
                        ),
                        Wrap(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * .20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Color(0xff8B8FC9)),
                                image: DecorationImage(
                                    image: AssetImage("assets/images/rein.jpg"),
                                    fit: BoxFit.contain),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(top: 20),
                              child: Text(
                                "Reinhardt Benedicto",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontFamily: 'MPlus',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "@rnhrdtbndct",
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
                      ],
                    ),
                  ),
                  Container(
                    width: 400,
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
                                translation: Offset(5.5, -0.5),
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
                              width: 385 / 3,
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
                          width: 385 / 3,
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
                          width: 385 / 3,
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
          ],
        ),
      ),
    );
  }
}
