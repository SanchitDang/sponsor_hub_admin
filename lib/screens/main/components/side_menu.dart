import 'package:admin/screens/consulting/consult_screen.dart';
import 'package:admin/screens/transactions/transactions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../users/users_screen.dart';
import '../main_screen.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashboard.svg",
            press: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      MainScreen(),
                  transitionDuration: Duration.zero,
                ),
              );
            },
          ),
          DrawerListTile(
            title: "Users",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      UsersScreen("User"),
                  transitionDuration: Duration.zero,
                ),
              );
            },
          ),
          DrawerListTile(
            title: "Influencers",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      UsersScreen("Influencer"),
                  transitionDuration: Duration.zero,
                ),
              );
            },
          ),
          DrawerListTile(
            title: "Consulting",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      ConsultScreen(),
                  transitionDuration: Duration.zero,
                ),
              );
            },
          ),
          DrawerListTile(
            title: "Transactions",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      TransactionsScreen(),
                  transitionDuration: Duration.zero,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(Colors.white54, BlendMode.srcIn),
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
