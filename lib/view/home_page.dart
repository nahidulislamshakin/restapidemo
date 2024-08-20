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
  Widget build(BuildContext context) {
    final hpvProvider = Provider.of<HomePageViewModel>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Rest API"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: height,
            width: width,
            child: Column(

              children: [

                Expanded(
                  child: FutureBuilder(
                    future: hpvProvider.getApiData(),
                    builder: (context, snapshot){
                      if(!snapshot.hasData){
                        return Text("Loading");
                      }
                      else{
                        return ListView.builder(
                          itemCount: hpvProvider.questionList.length,
                          itemBuilder: (context,index){
                            return Text("Index : ${index.toString()}",);
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
