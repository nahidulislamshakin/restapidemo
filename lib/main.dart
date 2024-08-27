import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:provider/provider.dart";
import "package:restapi/utils/routes/route_name.dart";
import "package:restapi/utils/routes/routing.dart";
import "package:restapi/view_model/homepage_viewmodel.dart";

void main() async {
  await ScreenUtil.ensureScreenSize();
  Provider.debugCheckInvalidValueType = null;
  runApp(App(),);
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomePageViewModel>(
          create: (context) => HomePageViewModel(),
        ),
      ],
      child: ScreenUtilInit(

        designSize: Size(deviceWidth,deviceHeight),
        minTextAdapt: true,
          splitScreenMode: false,
        
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.blue,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.grey,
                centerTitle: true,
                elevation: 8.0,
                titleTextStyle: TextStyle(color: Colors.white, fontSize: 25.sp)

              ),
              textTheme: TextTheme(
                bodyMedium: TextStyle(fontSize: 14.sp),
                titleMedium: TextStyle(fontSize: 16.sp),
                labelLarge: TextStyle(fontSize: 14.sp),
              )
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: RouteName.home,
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        }
      ),
    );
  }
}

