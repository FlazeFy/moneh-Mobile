import 'package:flutter/material.dart';
import 'package:moneh/modules/variables/style.dart';
import 'package:moneh/pages/stats_wishlist/usecases/get_total_wishlist_by_is_achieved.dart';
import 'package:moneh/pages/stats_wishlist/usecases/get_total_wishlist_by_priority.dart';
import 'package:moneh/pages/stats_wishlist/usecases/get_total_wishlist_by_type.dart';

class StatsWishlistPage extends StatefulWidget {
  const StatsWishlistPage({Key key}) : super(key: key);

  @override
  State<StatsWishlistPage> createState() => _StatsWishlistPageState();
}

class _StatsWishlistPageState extends State<StatsWishlistPage> {
  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    // double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
          padding: EdgeInsets.only(
              top: fullHeight * 0.06, left: spaceMD, right: spaceMD),
          children: const [
            GetTotalWishlistByType(),
            GetTotalWishlistByPriority(),
            GetTotalWishlistByIsAchieved()
          ]),
    );
  }
}
