import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moneh/pages/pocket/usecases/get_all_pocket.dart';

class PocketPage extends StatefulWidget {
  const PocketPage({Key key}) : super(key: key);

  @override
  State<PocketPage> createState() => _PocketPageState();
}

class _PocketPageState extends State<PocketPage> {
  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    // double fullWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
        onWillPop: () => SystemNavigator.pop(),
        child: Scaffold(
          body: ListView(
            padding: EdgeInsets.only(top: fullHeight * 0.06),
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [GetAllPocket()])
            ],
          ),
        ));
  }
}
