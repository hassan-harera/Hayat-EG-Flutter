
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayat/layout/HayatLayout/LayOutCubit/LayoutState.dart';
import 'package:hayat/layout/LayoutScreens/Add/AddScreen.dart';
import 'package:hayat/layout/LayoutScreens/Hayat/HayatScreen.dart';
import 'package:hayat/layout/LayoutScreens/Home/HomeScreen.dart';
import 'package:hayat/layout/LayoutScreens/archived/ArchivedScreen.dart';
import 'package:hayat/layout/LayoutScreens/tasks/AddScreen.dart';
import 'package:hayat/models/HomeModel/HomeModelScreen.dart';
import 'package:hayat/shared/component/constans.dart';
import 'package:hayat/shared/netowrk/endPoints/endPint.dart';
import 'package:hayat/shared/netowrk/local/Cash_helper/DioHelper.dart';

class LayoutCubit extends Cubit<LayoutStates>{
  LayoutCubit() : super( LayoutInitialState() ) ;
  static LayoutCubit get(context)=>BlocProvider.of(context);
  List<Widget> Screens = [
    HomeScreen(),
    HayatScreen(),
    AddScreen(),
    ArchivedScreen(),
    TaskScreen(),
  ];

  int currentindex = 0  ;
  void changIndex (int index ){
    currentindex=index;
    emit(LayoutChangeModeState());

  }
  late HomeModel homeModel;
  void getHomeDeta(){
    emit(LayoutLoadingState());
    DioHelper.getData(
      url: Home,
    token:token,
    )
        .then((value) {
      homeModel=HomeModel.fromJson(value.data);
      print(homeModel.status);
      print(homeModel.data.products[0]);
      emit(LayoutSuccessState()) ;
    })
        .catchError((error){
      print(error.toString());
      emit(LayoutError());
    });
  }

}