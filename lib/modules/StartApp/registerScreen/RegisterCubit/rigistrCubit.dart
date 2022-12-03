
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayat/modules/StartApp/registerScreen/RegisterCubit/registerState.dart';

class RegisterCubit extends Cubit<RegisterState>{
  RegisterCubit() : super((RegisterInitialState()));
  static RegisterCubit get(context)=>BlocProvider.of(context);
//user login here
//late ShopLoginModel loginModel;
// void userLogin({
//   required String email,
//   required String password,
// }){
//   emit(ShopLoginLoadingState());
//
// DioHelper.postData(url:LOGIN, data: {
//   'email': email,
//   'password': password,
// },).then((value) {
//  print(value.data);
//   loginModel= ShopLoginModel.fromJason(value.data);
//   // print(loginModel.message);
//   // print(loginModel.data?.token);
//   // print(loginModel.data?.image);
//   emit(ShopLoginSuccessState(loginModel));
// }).catchError((error){
//   print(error.toString());
//   emit(ShopLoginErrorState(error.toString()));
// });
// }

  IconData  sufixIcon=Icons.visibility_outlined;
  bool obsecure1 =true;
  bool obsecure2=true;
  void ChangeObsecure1(){
    obsecure1=!obsecure1;

    sufixIcon= obsecure1 ? Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(RegisterchangeObsecureState());
  }
  void ChangeObsecure2(){
    obsecure2=!obsecure2;
    sufixIcon= obsecure2 ? Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(RegisterchangeObsecureState());
  }
  void NavigateToRegister(context){
    emit(RegisterToRegisterlState());
  }
  bool checkeed =false;

  void changeCheckbox(value){
  checkeed =value!;
   print(checkeed);
   emit(RegisterchangeCheeckboxState());
  }


}