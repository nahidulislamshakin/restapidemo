import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restapi/view_model/homepage_viewmodel.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    final hpvProvider = Provider.of<HomePageViewModel>(context, listen: false);
    hpvProvider.getApiData();


  }
  @override
  Widget build(BuildContext context) {


    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Rest API"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height,
                  width: width,
                  child: Consumer<HomePageViewModel>(
                    builder:(context, hpvProvider, child){
                      if(hpvProvider.questionList.isEmpty){
                        return const Center(
                          child: Text("Loading..."),
                        );
                      }
                      else {
                        return ListView.builder(
                            itemCount: hpvProvider.questionList.length,
                            itemBuilder:(context, index){
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Card(

                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            FittedBox(
                                              child: Text("${index+1}. ${hpvProvider.questionList[index].question!.toString()}"
                                              ),
                                            ),
                                            FittedBox(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Text("A. ${hpvProvider.questionList[index].incorrectAnswers![0].toString()}"),

                                                  Text("B. ${hpvProvider.questionList[index].incorrectAnswers![1].toString()}"),

                                                ],
                                              ),
                                            ),
                                            FittedBox(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,

                                                children: [
                                                  Text("C. ${hpvProvider.questionList[index].incorrectAnswers![2].toString()}"),


                                                ],
                                              ),
                                            )


                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      }
                    }
                  )
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
