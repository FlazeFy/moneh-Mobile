import 'package:flutter/material.dart';
import 'package:moneh/components/Navbars/top.dart';
import 'package:moneh/modules/variables/style.dart';
import 'package:moneh/pages/stats_flows/usecases/get_total_flow_ammount_by_type.dart';
import 'package:moneh/pages/stats_flows/usecases/get_total_flow_by_category.dart';
import 'package:moneh/pages/stats_flows/usecases/get_total_flow_item_by_type.dart';

class StatsFlowsPage extends StatefulWidget {
  const StatsFlowsPage({Key key}) : super(key: key);

  @override
  State<StatsFlowsPage> createState() => _StatsFlowsPageState();
}

class _StatsFlowsPageState extends State<StatsFlowsPage> {
  @override
  Widget build(BuildContext context) {
    const pageTitle = "Stats Flow";
    //double fullHeight = MediaQuery.of(context).size.height;
    // double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: getAppbar(pageTitle),
      body: ListView(
          padding: EdgeInsets.only(top: spaceMD, left: spaceMD, right: spaceMD),
          children: const [
            GetTotalFlowItemByType(),
            GetTotalFlowAmmountByType(),
            GetTotalFlowByCat()
          ]),
    );
  }
}
