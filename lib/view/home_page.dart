import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restapi/model/question_model.dart';
import 'package:restapi/view_model/homepage_viewmodel.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List questionList = [];
  late List answerList = [];


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final hpvProvider = Provider.of<HomePageViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Rest API",style: Theme.of(context).appBarTheme.titleTextStyle,),
      ),
      body: SafeArea(
        child: FutureBuilder(
                future: hpvProvider.getApiData(),
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                  return ListView.builder(
                      itemCount: hpvProvider.questionList.length,
                      itemBuilder:(context, index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text("${index+1}. ${hpvProvider.questionList[index].question!.text.toString()}"
                              ,maxLines: 5,
                                  style: Theme.of(context).textTheme.bodyText1,),
                              Text("A. ${hpvProvider.questionList[index].incorrectAnswers![0].toString()}",maxLines: 3,
                              style: Theme.of(context).textTheme.bodyText1,),

                              Text("B. ${hpvProvider.questionList[index].incorrectAnswers![1].toString()}",maxLines: 3,
                                style: Theme.of(context).textTheme.bodyText1,),
                              Text("C. ${hpvProvider.questionList[index].incorrectAnswers![2].toString()}",maxLines: 3,
                                style: Theme.of(context).textTheme.bodyText1,)


                            ],
                          ),
                        );
                      });
                }
                  else {
                    return Center(child: CircularProgressIndicator());
                  }
          }
              )
      ),
    );
  }
}

