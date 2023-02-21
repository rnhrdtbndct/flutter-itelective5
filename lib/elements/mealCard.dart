import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class mealCard extends StatelessWidget {
  const mealCard({super.key, required this.mealImage, required this.mealName});

  final String mealImage;
  final String mealName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3C374),
      body: Container(
        width: 250,
        height: 275,
        decoration: BoxDecoration(
          color: Color(0xff2f3361),
          border: Border.all(width: 5, color: Color(0xFFE35333)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Wrap(children: [
          Center(
            child: Container(
                width: 250,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    image: DecorationImage(
                        image: NetworkImage(mealImage), fit: BoxFit.cover))),
          ),
          Container(
              padding: EdgeInsets.only(top: 10),
              width: 250,
              height: 30,
              child: Text(
                mealName,
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                textAlign: TextAlign.center,
              )),
          Container(
              width: 250,
              height: 25,
              padding: EdgeInsets.only(right: 10),
              alignment: Alignment.bottomRight,
              child: IconButton(
                onPressed: () {},
                iconSize: 20,
                icon: FaIcon(
                  FontAwesomeIcons.cartShopping,
                  color: Colors.white,
                ),
              )),
        ]),
      ),
    );
  }
}
