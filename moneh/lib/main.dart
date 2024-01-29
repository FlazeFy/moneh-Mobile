import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:moneh/components/navbars/bottom.dart';
import 'package:moneh/modules/variables/style.dart';

bool shouldUseFirestoreEmulator = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(signed: false));
}

class MyApp extends StatefulWidget {
  MyApp({Key key, this.signed}) : super(key: key);
  bool signed;

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Lock device on portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moneh Mobile',
      theme: ThemeData(
          primarySwatch: Colors.blue, scaffoldBackgroundColor: blackColor),
      home: const BottomBar(),
    );
  }
}
