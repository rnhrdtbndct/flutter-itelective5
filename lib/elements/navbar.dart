// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:itelective5/screens/home.dart';
import 'package:sidebarx/sidebarx.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key, required this.index});

  final int index;
  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: SidebarXController(selectedIndex: index, extended: true),
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Color(0xFFFAF3DC)),
        selectedTextStyle: const TextStyle(color: selectedTextColor),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [scaffoldBackgroundColor, white],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: white,
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: selectedTextColor,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 250,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 175,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/images/kanagawa.png'),
          ),
        );
      },
      items: [
        SidebarXItem(
            icon: Icons.home,
            label: 'Home',
            onTap: () => Navigator.pushNamedAndRemoveUntil(
                context, '/home', ModalRoute.withName('/'))),
        SidebarXItem(
          icon: Icons.cases,
          label: 'Projects',
        ),
        SidebarXItem(
          icon: Icons.report,
          label: 'Report',
        ),
        SidebarXItem(
          icon: Icons.settings,
          label: 'Settings',
        ),
        SidebarXItem(
            icon: Icons.info,
            label: 'About Us',
            onTap: () => Navigator.pushNamedAndRemoveUntil(
                context, '/about', ModalRoute.withName('/'))),
      ],
    );
  }
}

const canvasColor = Color(0xFFE35333);
const scaffoldBackgroundColor = Color(0xFFF3C374);
const selectedTextColor = Color(0xFF2E3E5E);
const white = Color(0xFFFAF3DC);
final actionColor = const Color(0xFFE35333).withOpacity(0.6);
final divider = Divider(color: Color(0xFFFAF3DC), height: 2);
