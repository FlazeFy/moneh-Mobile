import 'package:flutter/material.dart';
import 'package:moneh/pages/flow/usecases/get_all_flow.dart';
import 'package:moneh/pages/flow/usecases/get_summary.dart';

class FlowPage extends StatefulWidget {
  const FlowPage({Key key}) : super(key: key);

  @override
  State<FlowPage> createState() => _FlowPageState();
}

class _FlowPageState extends State<FlowPage> {
  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    // double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: fullHeight * 0.06),
        children: [GetFlowSummary(), GetAllFlow()],
      ),
    );
  }
}
