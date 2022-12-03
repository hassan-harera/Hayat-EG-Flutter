import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayat/layout/HayatLayout/hayat-egLayout.dart';
import 'package:hayat/modules/StartApp/login/Login.dart';
import 'package:hayat/modules/StartApp/on_bording/onBordingScreen.dart';
import 'package:hayat/modules/StartApp/registerScreen/BasicInformation/Basic-Info.dart';
import 'package:hayat/shared/BlocObserver.dart';
import 'package:hayat/shared/netowrk/local/Cash_helper/DioHelper.dart';
import 'package:hayat/shared/netowrk/local/Cash_helper/cash_helper.dart';
import 'package:hayat/styles/thems.dart';

import 'shared/component/constans.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

// Ideal time to initialize

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await Cash_helper.init();
  Widget widget ;
  bool onBoarding = Cash_helper.getData(key: 'onBoarding');
 String ?token = Cash_helper.getData(key: 'token');

    if(onBoarding!=null) {
    if (token!= null) {
      widget = hayatLayout();
    } else {
      widget = LoginScreen();
    }
  }
    else {
    widget = onBordingScrren();
  }

  runApp(MyApp(
   startWidget:widget ,
  ));
}
class MyApp extends StatelessWidget {
    Widget startWidget;
  MyApp({
  required this.startWidget,

});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightThem,
      darkTheme: darkThem,
      themeMode: ThemeMode.light,
      home: hayatLayout(),
    );
  }
}
