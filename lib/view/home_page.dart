import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restapi/view_model/homepage_viewmodel.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rest API"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: FutureBuilder(
                  future: getApiData(),
                ),
            ),
          ],
        )
      ),
    );
  }
}
