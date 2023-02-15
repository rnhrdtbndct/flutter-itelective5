import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:itelective5/elements/card.dart';
import 'package:itelective5/elements/mealCard.dart';
import 'package:itelective5/elements/navbar.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userURL = Uri.parse('https://randomuser.me/api/');
  var userImageURL;
  var userThumbnail;
  var userFullName;
  var username;
  var userCity;

  var foodURL = Uri.parse(
      'https://www.themealdb.com/api/json/v1/1/filter.php?a=Canadian');
  var mealImageURL;
  var mealName;
  List mealList = [];

  @override
  void initState() {
    super.initState();

    getUserData().then((value) {
      var userData = jsonDecode(value.body);
      setState(() {
        userImageURL = userData['results'][0]['picture']['medium'].toString();
        userThumbnail =
            userData['results'][0]['picture']['thumbnail'].toString();
        userFullName = userData['results'][0]['name']['first'].toString() +
            ' ' +
            userData['results'][0]['name']['last'].toString();
        username = userData['results'][0]['login']['username'].toString();
        userCity = userData['results'][0]['location']['city'].toString();
      });
    });

    getMealData().then((value) {
      var mealData = jsonDecode(value.body);
      setState(() {
        mealList = mealData['meals'];
      });
    });
  }

  Future<Response> getUserData() async {
    Response response = await get(userURL);
    return response;
  }

  Future<Response> getMealData() async {
    Response response = await get(foodURL);
    return response;
  }

  Widget build(BuildContext context) {
    return Scaffold(body:
        LayoutBuilder(builder: (BuildContext, BoxConstraints constraints) {
      if (constraints.maxWidth > 1100) {
        return webView(context, userImageURL, userThumbnail, userFullName,
            username, userCity, mealList);
      } else {
        return mobileView(context, userImageURL, userThumbnail, userFullName,
            username, userCity, mealList);
      }
    }));
  }
}

Scaffold webView(
    BuildContext context,
    String userImageURL,
    String userThumbnail,
    String userFullName,
    String username,
    String userCity,
    List mealList) {
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
              child: ResponsiveGridList(
                  horizontalGridSpacing: 20,
                  verticalGridSpacing: 20,
                  horizontalGridMargin: 20,
                  verticalGridMargin: 20,
                  minItemWidth: 250,
                  minItemsPerRow: 2,
                  maxItemsPerRow: 4,
                  children: List.generate(
                      mealList.length,
                      (index) => Center(
                            child: Container(
                              width: 250,
                              height: 275,
                              child: mealCard(
                                  mealImage: mealList[index]['strMealThumb'],
                                  mealName: mealList[index]['strMeal']),
                            ),
                          )))),
          Container(
            width: MediaQuery.of(context).size.width * 1 / 3,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            color: Color(0xFFF3C374),
            child: userDrawer(context, userImageURL, userThumbnail,
                userFullName, username, userCity),
          )
        ],
      ),
    ),
  );
}

Scaffold mobileView(
    BuildContext context,
    String userImageURL,
    String userThumbnail,
    String userFullName,
    String username,
    String userCity,
    List mealList) {
  return Scaffold(
    drawer: NavBar(index: 0),
    endDrawer: userDrawer(
        context, userImageURL, userThumbnail, userFullName, username, userCity),
    appBar: AppBar(backgroundColor: Color(0xFFE35333), actions: [
      Builder(
          builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                icon:
                    CircleAvatar(backgroundImage: NetworkImage(userThumbnail)),
                iconSize: 50.0,
              ))
    ]),
    body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        color: Color(0xFFF3C374),
        child: ResponsiveGridList(
            horizontalGridSpacing: 20,
            verticalGridSpacing: 20,
            horizontalGridMargin: 20,
            verticalGridMargin: 20,
            minItemWidth: 250,
            minItemsPerRow: 1,
            maxItemsPerRow: 4,
            children: List.generate(
                mealList.length,
                (index) => Center(
                      child: Container(
                        width: 250,
                        height: 275,
                        child: mealCard(
                            mealImage: mealList[index]['strMealThumb'],
                            mealName: mealList[index]['strMeal']),
                      ),
                    )))),
  );
}

Container userDrawer(
    BuildContext context,
    String userImageURL,
    String userThumbnail,
    String userFullName,
    String username,
    String userCity) {
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
            child: card(
              userImageURL: userImageURL,
              userThumbnail: userThumbnail,
              userFullName: userFullName,
              username: username,
              userCity: userCity,
            )),
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
