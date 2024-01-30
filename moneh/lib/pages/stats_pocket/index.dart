import 'package:flutter/material.dart';
import 'package:moneh/components/Navbars/top.dart';
import 'package:moneh/modules/variables/style.dart';
import 'package:moneh/pages/stats_pocket/usecases/get_total_pocket_by_type.dart';

class StatsPocketPage extends StatefulWidget {
  const StatsPocketPage({Key key}) : super(key: key);

  @override
  State<StatsPocketPage> createState() => _StatsPocketPageState();
}

class _StatsPocketPageState extends State<StatsPocketPage> {
  @override
  Widget build(BuildContext context) {
    const pageTitle = "Stats Pocket";
    //double fullHeight = MediaQuery.of(context).size.height;
    // double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: getAppbar(pageTitle),
      body: ListView(
          padding: EdgeInsets.only(top: spaceMD, left: spaceMD, right: spaceMD),
          children: const [
            GetTotalPocketByType(),
          ]),
    );
  }
}
