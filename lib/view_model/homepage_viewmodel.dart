import 'dart:async';
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
  bool _isUpdating = false;


  Future getApiData() async {

    _isUpdating = true;
    questionList.clear();
    var data = await ApiServices().getApiData(url);

      for (Map<String, dynamic> i in data) {
        questionList.add(
          QuestionModel.fromJson(i),
        );

      }

      print("List added succecfully");

      Timer(Duration(seconds: 100), () {

        notifyListeners();
        _isUpdating = false;

      });
      return questionList;

  }

  List<String> getShuffledAnswer(QuestionModel question){
    final List<String> answerList = [];
    if(question.incorrectAnswers != null && question.correctAnswer != null){
      answerList.addAll(question.incorrectAnswers!);
      answerList.add(question.correctAnswer!);

    }
    answerList.shuffle();
    return answerList;
  }


}
