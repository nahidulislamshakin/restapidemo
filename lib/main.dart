import "package:flutter/material.dart";
import "package:restapi/utils/routes/route_name.dart";
import "package:restapi/utils/routes/routing.dart";
import "package:restapi/view/home_page.dart";

void main() {
  runApp(App());
}


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.grey,
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 25)

        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.home,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
