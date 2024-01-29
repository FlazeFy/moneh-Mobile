import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneh/components/containers/tile.dart';
import 'package:moneh/modules/variables/style.dart';
import 'package:moneh/pages/stats_flows/index.dart';
import 'package:moneh/pages/stats_others/index.dart';
import 'package:moneh/pages/stats_pocket/index.dart';
import 'package:moneh/pages/stats_wishlist/index.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    // double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
          padding: EdgeInsets.only(
              top: fullHeight * 0.06, left: spaceMD, right: spaceMD),
          children: [
            getTile(() => Get.to(const StatsFlowsPage()), "Stats Flows",
                Icons.bar_chart, primaryColor),
            getTile(() => Get.to(const StatsPocketPage()), "Stats Pocket",
                Icons.bar_chart, primaryColor),
            getTile(() => Get.to(const StatsWishlistPage()), "Stats Wishlist",
                Icons.bar_chart, primaryColor),
            getTile(() => Get.to(const StatsOthersPage()), "Stats Others",
                Icons.bar_chart, primaryColor),
            SizedBox(height: spaceMD),
            Divider(color: greyColor),
            getTile(null, "Feedback", Icons.feedback, infoBG),
            getTile(null, "Help", Icons.help, infoBG),
            getTile(null, "About", Icons.info, infoBG),
            getTile(null, "Sign Out", Icons.close, warningDarkBG)
          ]),
    );
  }
}
