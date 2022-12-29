import 'package:flutter/material.dart';
import 'package:thue_do_cosplay/screens/splash/components/body.dart';
import 'package:thue_do_cosplay/size_config.dart';

class SplashScreen extends StatelessWidget {
  
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
      // body: FutureBuilder<String?>(
      //   future: BaseSharedPreferences.getString('skip_splash'), // async work
      //   builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
      //     switch (snapshot.connectionState) {
      //       case ConnectionState.waiting:
      //         return Text('Loading...');
      //       default:
      //         if (snapshot.hasError) {
      //           print('Error: ${snapshot.error}');
      //           return Text('Wut.');
      //         } else {
      //           if (snapshot.data == 'true') {
      //             Navigator.pushNamed(context, HomeScreen.routeName);
      //             return Text('Wut');
      //           } else
      //             return Body();
      //         }
      //     }
      //   },
      // ),
    );
  }
}