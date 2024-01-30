import 'package:flutter/material.dart';
import 'package:moneh/components/Navbars/top.dart';
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
    const pageTitle = "Stats Others";
    //double fullHeight = MediaQuery.of(context).size.height;
    // double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: getAppbar(pageTitle),
      body: ListView(
          padding: EdgeInsets.only(top: spaceMD, left: spaceMD, right: spaceMD),
          children: const [GetTotalDctByType()]),
    );
  }
}
