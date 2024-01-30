import 'package:flutter/material.dart';
import 'package:moneh/components/Navbars/top.dart';
import 'package:moneh/pages/feedback/usecases/post_feedback.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    const pageTitle = "Feedback";
    double fullHeight = MediaQuery.of(context).size.height;
    // double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: getAppbar(pageTitle),
      body: ListView(
        padding: EdgeInsets.only(top: fullHeight * 0.06),
        children: const [PostFeedback()],
      ),
    );
  }
}
