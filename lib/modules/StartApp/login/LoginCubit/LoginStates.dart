import 'package:hayat/models/ShpAppModel/loginModel.dart';

abstract class LoginStates{}
class LoginInitialState extends LoginStates{}
class LoginchangeObsecurelState extends LoginStates{}
class LoginToRegisterlState extends LoginStates{}
class ShopLoginLoadingState extends LoginStates{}
class ShopLoginSuccessState extends LoginStates{
  late final LoginModel loginModel;
  ShopLoginSuccessState(this.loginModel);
}
class ShopLoginErrorState extends LoginStates
{
final  String error;
  ShopLoginErrorState(this.error);
}