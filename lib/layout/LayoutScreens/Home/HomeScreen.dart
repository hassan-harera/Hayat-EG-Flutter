import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayat/layout/Catigories/CatigoriesScreen.dart';
import 'package:hayat/layout/HayatLayout/LayOutCubit/HayatLaoutCubit.dart';
import 'package:hayat/layout/HayatLayout/LayOutCubit/LayoutState.dart';
import 'package:hayat/models/HomeModel/HomeModelScreen.dart';
import 'package:hayat/models/ShpAppModel/loginModel.dart';
import 'package:hayat/shared/component/constans.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit,LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        LayoutCubit layoutCubit =  LayoutCubit .get(context);
        return  Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
ConditionalBuilder(
  condition:true ,
  builder: (context) =>HomeBuilder() ,
  fallback:(context) => CircularProgressIndicator() ,
),
                Row(
                  children: [
                    Text('Donaite Catigories',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),),
                    Spacer(),

                    TextButton(
                      onPressed: (){
                        NavegateTo(context, CatigoriesScreen());
                      },
                      child: Text('Sea All ',style: TextStyle(
                          color: Colors.amber

                      ),),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(10)
                          ,     color: Colors.blue,
                        ),

                        child:Column(
                          children: [
                            Image.asset('assets/blood.png',width: 130,height:140 ,),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(bottom: 8),
                              child: Text('BLOOD',style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        width: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(10)
                          ,     color: Colors.blue,
                        ),

                        child:Column(
                          children: [
                            Image.asset('assets/food.png',width: 130,height:140 ,),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(bottom: 8),
                              child: Text('FOOD',style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        width: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(10)
                          ,     color: Colors.blue,
                        ),

                        child:Column(
                          children: [
                            Image.asset('assets/medicine.png',width: 120,height:140 ,),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(bottom: 8),
                              child: Text('MEDICIENS',style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        width: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(10)
                          ,     color: Colors.blue,
                        ),

                        child:Column(
                          children: [
                            Image.asset('assets/cothes.png',width:120,height:140 ,),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(bottom: 8),
                              child: Text ('Blood',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text('Donaite Catigories',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),),
                    Spacer(),

                    TextButton(
                      onPressed: (){
                        NavegateTo(context, CatigoriesScreen());
                      },
                      child: Text('Sea All ',style: TextStyle(
                          color: Colors.amber

                      ),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },

    );
  }
  Widget HomeBuilder()=>Column(
      children: [
CarouselSlider(items: [
  Image(image: NetworkImage('https://altitudehauling.com/wp-content/uploads/2018/10/shutterstock_1022661760-1024x512.jpg')
  ,width: double.infinity,
    fit: BoxFit.cover,
  ),
  Image(image: NetworkImage('https://www.goodwillaz.org/wordpress/wp-content/uploads/2018/04/5-15-2.jpg')
  ,width: double.infinity,
    fit: BoxFit.cover,
  ),
  Image(image: NetworkImage('https://cdn.newsapi.com.au/image/v1/060863537dd81de9b23b76864c2cc715?width=650')
  ,width: double.infinity,
    fit: BoxFit.cover,
  ),
], options: CarouselOptions(
  autoPlay: true,
height: 250,
  initialPage: 0,
  enableInfiniteScroll: true,
  reverse: false,
  autoPlayInterval: Duration(seconds: 3),
  autoPlayAnimationDuration: Duration(seconds: 1),
  autoPlayCurve: Curves.fastOutSlowIn,
  scrollDirection: Axis.horizontal,
  viewportFraction: 1
))
  ],
      );
}