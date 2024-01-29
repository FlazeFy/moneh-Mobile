import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:moneh/modules/Variables/style.dart';
import 'package:moneh/modules/variables/global.dart';
import 'package:moneh/pages/dashboard/index.dart';
import 'package:moneh/pages/flow/index.dart';
import 'package:moneh/pages/pocket/index.dart';
import 'package:moneh/pages/profile/index.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      const DashboardPage(),
      const FlowPage(),
      const PocketPage(),
      const ProfilePage()
    ];
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: page,
          height: 60.0,
          items: <Widget>[
            Icon(
              Icons.dashboard,
              size: iconLG,
              color: whiteColor,
            ),
            Icon(Icons.arrow_downward, size: iconLG, color: whiteColor),
            Icon(Icons.arrow_upward, size: iconLG, color: whiteColor),
            Icon(Icons.person, size: iconLG, color: whiteColor),
          ],
          color: darkColor,
          buttonBackgroundColor: primaryColor,
          backgroundColor: blackColor,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 400),
          onTap: (index) {
            setState(() {
              page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: widgetOptions.elementAt(page));
  }
}
