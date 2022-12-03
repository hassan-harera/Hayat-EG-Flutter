import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayat/models/ShpAppModel/loginModel.dart';
import 'package:hayat/modules/StartApp/login/LoginCubit/LoginStates.dart';
import 'package:hayat/shared/component/constans.dart';
import 'package:hayat/shared/netowrk/endPoints/endPint.dart';
import 'package:hayat/shared/netowrk/local/Cash_helper/DioHelper.dart';

class LoginCubit extends Cubit<LoginStates>{
LoginCubit() : super(LoginInitialState());
static LoginCubit get(context)=>BlocProvider.of(context);
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
bool obsecure =true;
void ChangeObsecure(){
  obsecure=!obsecure;
  sufixIcon= obsecure ? Icons.visibility_outlined:Icons.visibility_off_outlined;
  emit(LoginchangeObsecurelState());
 }
void NavigateToRegister(context){

  emit(LoginToRegisterlState());
}
}