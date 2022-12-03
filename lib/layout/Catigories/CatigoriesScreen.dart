import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CatigoriesScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Catigories',style: TextStyle(
          fontWeight: FontWeight.bold,

        ),),

      ),
      body: Center(child: Text('CatigoriesScreen')),
    );
  }
}