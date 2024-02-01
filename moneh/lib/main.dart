import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:moneh/components/navbars/bottom.dart';
import 'package:moneh/modules/apis/dictionaries/services/queries.dart';
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
  DictionaryQueryService dctService;

  @override
  void initState() {
    super.initState();
    dctService = DictionaryQueryService();

    getDictionary();
  }

  getDictionary() async {
    await dctService.getDictionaryType("flows_category");
    await dctService.getDictionaryType("pockets_type");
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
