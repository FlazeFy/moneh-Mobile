import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneh/components/forms/input.dart';
import 'package:moneh/components/forms/rate.dart';
import 'package:moneh/components/typographies/label.dart';
import 'package:moneh/modules/apis/feedbacks/models/commands.dart';
import 'package:moneh/modules/apis/feedbacks/services/commands.dart';
import 'package:moneh/modules/variables/style.dart';
import 'package:moneh/pages/feedback/index.dart';

import '../../../components/dialogs/failed_dialog.dart';
import '../../../components/dialogs/success_dialog.dart';

class PostFeedback extends StatefulWidget {
  const PostFeedback({Key key}) : super(key: key);

  @override
  StatePostFeedback createState() => StatePostFeedback();
}

class StatePostFeedback extends State<PostFeedback> {
  FeedbackCommandsService apiService;
  final descCtrl = TextEditingController();
  int rateCtrl;

  @override
  void dispose() {
    descCtrl.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    apiService = FeedbackCommandsService();
  }

  @override
  Widget build(BuildContext context) {
    rateCtrl = 5;
    return Container(
        padding: EdgeInsets.all(spaceLG),
        margin: EdgeInsets.all(spaceXMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getLabel("normal", "Let us know, what do you think about this App?",
                TextAlign.center, whiteColor, FontWeight.w500, textMD),
            getInputRate((double rate) {
              setState(() {
                rateCtrl = rate.toInt();
              });
            }),
            getInputDesc(255, 3, descCtrl, false),
            SizedBox(height: spaceLG),
            getLabel("normal", "What do you think the improvment should be",
                TextAlign.center, whiteColor, FontWeight.w500, textMD),
            InkWell(
              onTap: () async {
                FeedbackModel data =
                    FeedbackModel(desc: descCtrl.text.trim(), rate: rateCtrl);

                //Validator
                if (data.desc != null || (data.rate >= 0 && data.rate <= 5)) {
                  apiService.postFeedback(data).then((response) {
                    setState(() => {});
                    var status = response[0]['message'];
                    var body = response[0]['body'];

                    if (status == "success") {
                      rateCtrl == 0;
                      descCtrl.clear();

                      Get.to(const FeedbackPage(), preventDuplicates: false);
                      Get.dialog(SuccessDialog(text: body));
                    } else {
                      Get.dialog(FailedDialog(text: body, type: "addfeedback"));
                    }
                  });
                } else {
                  Get.dialog(FailedDialog(
                      text: "Field can't be empty".tr, type: "addfeedback"));
                }
              },
              child: Container(
                width: 110,
                margin: EdgeInsets.symmetric(vertical: spaceLG),
                padding: EdgeInsets.symmetric(
                    vertical: spaceSM, horizontal: spaceMD),
                decoration: BoxDecoration(
                    border: Border.all(color: whiteColor, width: 2),
                    color: successBG,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Row(
                  children: [
                    Icon(Icons.send, size: iconSMD + 3, color: whiteColor),
                    const Spacer(),
                    Text("Submit",
                        style: TextStyle(
                            fontSize: textXMD,
                            fontWeight: FontWeight.w500,
                            color: whiteColor))
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
