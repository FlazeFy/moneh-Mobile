import 'package:flutter/material.dart';
import 'package:moneh/modules/helpers/converter.dart';

import '../../modules/variables/style.dart';

class FailedDialog extends StatefulWidget {
  const FailedDialog({Key key, this.text, this.type}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final text; // Can be string or list
  final String type;

  @override
  StateFailedDialog createState() => StateFailedDialog();
}

class StateFailedDialog extends State<FailedDialog> {
  @override
  Widget build(BuildContext context) {
    //double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      contentPadding: EdgeInsets.all(spaceSM),
      title: null,
      backgroundColor: blackColor,
      content: SizedBox(
        width: fullWidth,
        height: 320,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(spaceLG),
                child: Image.asset('assets/icon/Failed.png', width: 120),
              ),
              SizedBox(height: spaceLG),
              Text("Failed",
                  style: TextStyle(
                      color: whiteColor,
                      fontSize: textLG,
                      fontWeight: FontWeight.bold)),
              Container(
                  margin: EdgeInsets.fromLTRB(0, spaceMini, 0, spaceSM),
                  child: Text(
                      getMessageResponseFromObject(widget.text, widget.type),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: shadowColor, fontSize: textXMD))),
              Divider(
                height: spaceMD,
                color: greyColor,
              ),
              InkWell(
                  onTap: () => Navigator.pop(context, 'OK'),
                  child: Container(
                    padding: EdgeInsets.all(spaceMD),
                    margin: EdgeInsets.only(top: spaceMD),
                    decoration: BoxDecoration(
                        color: warningBG,
                        borderRadius:
                            BorderRadius.all(Radius.circular(spaceMD))),
                    child: Text("Try Again",
                        style: TextStyle(
                            color: whiteColor, fontWeight: FontWeight.w500)),
                  ))
            ]),
      ),
    );
  }
}
