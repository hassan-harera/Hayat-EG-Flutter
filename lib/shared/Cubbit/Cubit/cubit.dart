import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayat/shared/Cubbit/Cubit/AppStates.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:untitled/modules/archived_taskes/archived.dart';
// import 'package:untitled/modules/done_taskes/done.dart';
// import 'package:untitled/modules/new_taskes/tasks.dart';
// import 'package:untitled/network/local/Cash_helper.dart';
// import 'package:untitled/shared/Cubit/AppStates.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super( AppInitialState() ) ;
  static AppCubit get(context)=>BlocProvider.of(context);
  List<Widget> Screens = [];
  List<String> titles = ['new Tasks', 'done Tasks', 'archived Tasks'];
  int currentindex = 0  ;

  void changIndex (int index ){
    currentindex=index;
    emit(AppChangeModeState());

  }

  bool ShowBottomSheet = true;
  var ScaffoldKey = GlobalKey<ScaffoldState>();
  var titlecontroler = TextEditingController();
  var timecontroler = TextEditingController();
  var datecontroler = TextEditingController();
  void ShowBS({required bool FBshow}){
   ShowBottomSheet=FBshow;
    emit(AppSowBottomSheetState());
  }

  List<Map> newtasks=[];
  List<Map> donetasks=[];
  List<Map> archivedtasks=[];


  late Database database;
  void CreatDatabase() async {
     openDatabase('Project.db',
        version: 1,
        onCreate: (database, version) {
          print('database is created');
          database
              .execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY , title TEXT  , time TEXT ,  date TEXT ,  status TEXT)')
              .then((value) {
            print('Table is created');
          }).catchError((error) {
            print('error when create table ${error.toString()}');
          });
        }, onOpen: (database) {
          print('database is opened');
          getDataFromDatabase (database);
        }).then((value) {
          database=value;
          emit(AppCreateDataBase());
     });

  }

 insertDatabase({
    required String title,
    required String time,
    required String date,
  }
      )async {

   await database.transaction((txn) {
      return txn.rawInsert('INSERT INTO tasks (title,time,date,status) VALUES ("$title","$time","$date","new") ')
          .then((value){
        print('$value inserted successfully ');
        emit(AppInsertDataBase());
        getDataFromDatabase (database);
      }).catchError((error){
        print('error when insert Row: $error');
      });

    });

  }
 void getDataFromDatabase (database){
    newtasks=[];
    donetasks=[];
    archivedtasks=[];
    emit(AppGetDataBase());
    database.rawQuery('SELECT * FROM tasks').then((value) {
       value.forEach((element) {
       if(element['status']=='new') {
          newtasks.add(element);
        } else if(element['status']=='done') {
          donetasks.add(element);
        } else {
          archivedtasks.add(element);
        }
      });

      emit(AppGetDataBase());

    });
  }
  void updateDatabase({
  required String status,
  required int id,
})async{
  database.rawUpdate(
        'UPDATE tasks SET status= ? WHERE id = ?',
        ['$status', id]).then((value) {

getDataFromDatabase(database);
emit(AppUpdateDataBase());
  });

  }

  void DeleteDatabase({
  required int id,
})async{
  database.rawDelete(
        'DELETE FROM tasks WHERE  id = ?',
        [ id]).then((value) {

getDataFromDatabase(database);
emit(AppDeleteDataBase());

  });

  }
  bool DarkMode =false;

  void ChangeMode ({  bool? safeState}){
    if(safeState!=null) {
      DarkMode = safeState;
      emit(AppChangeModeState());
    }
    else
      {
      DarkMode = !DarkMode;
     // Cash_helper.putbool(key: 'DarkMode', value: DarkMode).then((value) {
        emit(AppChangeModeState());
    //  });
    }
  }

}