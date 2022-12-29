import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:thue_do_cosplay/routes.dart';
import 'package:thue_do_cosplay/screens/splash/splash_screen.dart';
import 'package:thue_do_cosplay/theme.dart';


void main() {
  initializeDateFormatting('vi_VN');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
