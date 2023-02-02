import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFE35333),
        child: Center(
          child: Container(
            width: 360,
            height: 700,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
            boxShadow:[
              BoxShadow(
                color: Colors.grey.shade400, 
                blurRadius: 10,
                ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Center(
              child: Wrap(
                children: [
                  Center(child: Image.asset("assets/images/kanagawa.png", fit: BoxFit.cover, width: 100, height: 100)),
                  title("Firstname"),
                  inputBox(context, "text"),
                  title("Lastname"),
                  inputBox(context, "text"),
                  title("Email Address"),
                  inputBox(context, "text"),
                  title("Username"),
                  inputBox(context, "text"),
                  title("Password"),
                  inputBox(context, "password"),
                  title("Confirm Password"),
                  inputBox(context, "password"),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    margin: EdgeInsets.only(top: 30),
                    padding: EdgeInsets.all(5),
                    child: registerButton("/"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container inputBox(BuildContext context, String title) {
    if(title == "password"){              
      return Container(
        alignment: Alignment.centerLeft,
        width: MediaQuery.of(context).size.width,
        height: 50,
        padding: EdgeInsets.only(
          top: 5,
        ),
        child: TextField(
          obscureText: true,
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
                EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          ),
        ),
      );
    }
    else{
      return Container(
        alignment: Alignment.centerLeft,
        width: MediaQuery.of(context).size.width,
        height: 50,
        padding: EdgeInsets.only(
          top: 5,
        ),
        child: TextField(
          obscureText: false,
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
                EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          ),
        ),
      );
    }
  }

  Container title(String label) {
    return Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                ),
                child: Text(
                  label,
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
              );
  }

  ElevatedButton registerButton(String route) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
            context, route, ModalRoute.withName('/'));
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: const BorderSide(color: Colors.black87)),
            backgroundColor: Color(0xFF2E3E5E)),
        child: Text(
          "Register",
          style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ));
  }
}