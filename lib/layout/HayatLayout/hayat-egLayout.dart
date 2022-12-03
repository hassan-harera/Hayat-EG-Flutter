import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayat/layout/HayatLayout/LayOutCubit/HayatLaoutCubit.dart';
import 'package:hayat/layout/HayatLayout/LayOutCubit/LayoutState.dart';
import 'package:hayat/shared/component/constans.dart';

class hayatLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit()..getHomeDeta(),
      child: BlocConsumer<LayoutCubit,LayoutStates>(
        listener: (context, state){},
        builder: (context, state){
          LayoutCubit layoutCubit =  LayoutCubit .get(context);

          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://cdn.pixabay.com/photo/2013/07/21/13/00/rose-165819_960_720.jpg'),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Mohamed Boraie',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              actions: [
                CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                      color: Colors.blue,
                    )),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 10),
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.notifications),
                        color: Colors.blue,
                      )),
                )
              ],
            ),
            bottomNavigationBar: ConvexAppBar(
              color: Colors.amber,
              backgroundColor: Colors.white,
              activeColor: Colors.amber,

              onTap: (index) {
                layoutCubit.changIndex(index);
                // NavegateTo(context, layoutCubit.Screens[index]);
              },
              initialActiveIndex: layoutCubit.currentindex,
              elevation: 0,
              items: const [

                TabItem(
                  icon: Icon(Icons.home_outlined,color: Colors.grey,),
                  title: 'Home',activeIcon:Icon(Icons.home_outlined,color: Colors.white,)
                ),
                TabItem(
                 title: 'Hayat',activeIcon:Icon(Icons.clean_hands_outlined,color: Colors.white,),
                  icon:Icon(Icons.clean_hands_outlined,color: Colors.grey,)

              ),
                TabItem(
                    icon: Icon(Icons.add_circle_outline,color: Colors.grey,), title: 'add',activeIcon:Icon(Icons.add_circle_outline,color: Colors.white,)),
                TabItem(
                    icon: Icon(Icons.home_work_outlined,color: Colors.grey,), title: 'archived',activeIcon:Icon(Icons.home_work_outlined,color: Colors.white,)),
                TabItem(icon: Icon(Icons.menu,color: Colors.grey,), title: 'tasks',activeIcon:Icon(Icons.menu,color: Colors.white,)),
              ],
            ),
            // bottomNavigationBar: ConvexAppBar.badge(
            //   {1:'12'},
            //   badgeBorderRadius: 5,
            //   badgeMargin: EdgeInsets.only(bottom: 30,right: 30),
            //   badgeColor: Colors.white.withOpacity(.3),
            //   badgeTextColor:Colors.red ,
            //   color: Colors.amber,
            //   backgroundColor: Colors.white,
            //   activeColor: Colors.amber,
            //
            //   onTap: (index) {
            //     layoutCubit.changIndex(index);
            //     // NavegateTo(context, layoutCubit.Screens[index]);
            //   },
            //   initialActiveIndex: layoutCubit.currentindex,
            //   elevation: 0,
            //   items: const [
            //
            //     TabItem(
            //       icon: Icon(Icons.home_outlined,color: Colors.grey,),
            //       title: 'Home',activeIcon:Icon(Icons.home_outlined,color: Colors.white,)
            //     ),
            //     TabItem(
            //      title: 'Hayat',activeIcon:Icon(Icons.clean_hands_outlined,color: Colors.white,),
            //       icon:Icon(Icons.clean_hands_outlined,color: Colors.grey,)
            //
            //   ),
            //     TabItem(
            //         icon: Icon(Icons.add_circle_outline,color: Colors.grey,), title: 'add',activeIcon:Icon(Icons.add_circle_outline,color: Colors.white,)),
            //     TabItem(
            //         icon: Icon(Icons.home_work_outlined,color: Colors.grey,), title: 'archived',activeIcon:Icon(Icons.home_work_outlined,color: Colors.white,)),
            //     TabItem(icon: Icon(Icons.menu,color: Colors.grey,), title: 'tasks',activeIcon:Icon(Icons.menu,color: Colors.white,)),
            //   ],
            // ),
            body:layoutCubit.Screens[layoutCubit.currentindex],

          );
        },
      ),
    );
  }
}
