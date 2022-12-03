import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hayat/modules/StartApp/login/Login.dart';
import 'package:hayat/modules/StartApp/on_bording/onBordingScreen.dart';
import 'package:hayat/shared/netowrk/local/Cash_helper/cash_helper.dart';

Widget BuildBordingItem(Bordingdata model)=>Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

    Expanded(
      child: Image(image: AssetImage('${model.image}'),
        height: 300,
        width:double.infinity,
        fit: BoxFit.fill,
      ),
    ),
    SizedBox(
      height: 30,
    ),
    Text('${model.title}',
      style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold
      ),
    ),
    SizedBox(
      height: 30,
    ),
    Text('${model.body}',
      style: TextStyle(
        fontSize: 14,

      ),
    ),

  ],
);

// TextButton(
//   child: Text('Sign Out'),
//   onPressed: (){
//     Cash_helper.removeData(key: 'token');
//     NavegateAndFinsh(context,LoginScreen());
//   },
// ),
Widget DonaiteCatigoryItem({
  required String image,
  required String text,
})=> Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadiusDirectional.circular(10)
    ,     color: Colors.blue,
  ),

  child:Column(
    children: [
      Image.asset(image,color: Colors.amber,width: 130,height:140 ,),
      Padding(
        padding: const EdgeInsetsDirectional.only(bottom: 8),
        child: Text(text,style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18
        ),),
      ),

    ],
  ),
);