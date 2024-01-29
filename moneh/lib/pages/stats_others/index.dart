import 'package:flutter/material.dart';
import 'package:moneh/modules/variables/style.dart';
import 'package:moneh/pages/stats_others/usecases/get_total_dct_by_type.dart';

class StatsOthersPage extends StatefulWidget {
  const StatsOthersPage({Key key}) : super(key: key);

  @override
  State<StatsOthersPage> createState() => _StatsOthersPageState();
}

class _StatsOthersPageState extends State<StatsOthersPage> {
  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    // double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
          padding: EdgeInsets.only(
              top: fullHeight * 0.06, left: spaceMD, right: spaceMD),
          children: const [GetTotalDctByType()]),
    );
  }
}
