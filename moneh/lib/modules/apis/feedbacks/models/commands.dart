import 'package:form_data/form_data.dart';

// Usecase add feedback
class FeedbackModel {
  int rate;
  String desc;

  FeedbackModel({this.rate, this.desc});

  Map<String, dynamic> toJson() {
    return {
      "feedbacks_rate": rate,
      "feedbacks_desc": desc,
    };
  }
}

class FormDataFeedbackModel extends FormData {
  FormDataFeedbackModel(FeedbackModel data) : super() {
    add('feedbacks_rate', data.rate.toString());
    add('feedbacks_desc', data.desc);
  }
}
