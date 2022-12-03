abstract class RegisterState{}
class RegisterInitialState extends RegisterState{}
class RegisterchangeObsecureState extends RegisterState{}
class RegisterchangeCheeckboxState extends RegisterState{}
class RegisterToRegisterlState extends RegisterState{}
class RegisterLoadingState extends RegisterState{}
class RegisterSuccessState extends RegisterState{
  // late final ShopLoginModel loginModel;
  // ShopLoginSuccessState(this.loginModel);
}
class ShopLoginErrorState extends RegisterState
{
  final  String error;
  ShopLoginErrorState(this.error);
}