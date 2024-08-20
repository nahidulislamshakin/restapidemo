import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:restapi/utils/utils.dart';
import '../model/question_model.dart';
import '../services/api_services.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class HomePageViewModel with ChangeNotifier {
  static const String url = "https://the-trivia-api.com/v2/questions/";

  final List<QuestionModel> questionList = [];

  Future getApiData() async {
    questionList.clear();
    Response response = await ApiServices().getApi(url);
    var data = jsonDecode(
      response.body.toString(),
    );
    if (response.statusCode == 200) {
      for (Map i in data) {
        questionList.add(
          QuestionModel.fromJson(i),
        );
      }
      print("List added succecfully");
      notifyListeners();
      return questionList;
    } else {
      return questionList;
    }
  }
}
