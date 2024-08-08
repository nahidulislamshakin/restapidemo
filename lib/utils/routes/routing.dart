import 'package:flutter/material.dart';
import 'package:restapi/utils/routes/route_name.dart';
import 'package:restapi/view/home_page.dart';

import '../utils.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final argument = settings.arguments;
    switch (settings.name){
      case RouteName.home:
        return MaterialPageRoute(builder: (BuildContext context)=>HomePage(),);
      default: return Utils.toastMessage("No route found");
    }

  }
}