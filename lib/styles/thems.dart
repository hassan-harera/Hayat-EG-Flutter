import 'package:flutter/material.dart';
import 'package:hayat/styles/colors.dart';
import 'package:hexcolor/hexcolor.dart';



ThemeData lightThem = ThemeData(
  textTheme: TextTheme(
      bodyText1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black
      )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.amber,
    unselectedItemColor: Colors.grey,
    backgroundColor:Colors.white ,
  ),

  primarySwatch:defultColor ,
  iconTheme: IconThemeData(
      color: Colors.black,

  ),
  appBarTheme: AppBarTheme(
      titleSpacing: 20,
      iconTheme: IconThemeData(

          color: Colors.black

      ),
      elevation: 0,
      backgroundColor:  HexColor('E3E9F3'),
      // backwardsCompatibility: false,
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold
      )
  ),
  scaffoldBackgroundColor: HexColor('E3E9F3'),
);
ThemeData darkThem =  ThemeData(
    textTheme: TextTheme(
        bodyText1: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white
        )
    ),
    primarySwatch:defultColor ,
    iconTheme: IconThemeData(
        color: Colors.black
    ),
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        titleSpacing: 20,
        elevation: 0,
        backgroundColor: HexColor('333739'),
        // backwardsCompatibility: false,

        titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.grey,
      backgroundColor: HexColor('333739'),
    ),
    scaffoldBackgroundColor: HexColor('333739')
);