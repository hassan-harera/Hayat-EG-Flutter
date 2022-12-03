import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayat/layout/HayatLayout/hayat-egLayout.dart';
import 'package:hayat/modules/StartApp/login/LoginCubit/LoginCubit.dart';
import 'package:hayat/modules/StartApp/login/LoginCubit/LoginStates.dart';
import 'package:hayat/modules/StartApp/registerScreen/Email%20adress/EmailAddress.dart';
import 'package:hayat/modules/StartApp/registerScreen/forgetPassword/ForgetPassword.dart';
import 'package:hayat/shared/component/constans.dart';
import 'package:hayat/shared/netowrk/local/Cash_helper/cash_helper.dart';

class LoginScreen extends StatelessWidget {
  final formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var PasswordController = TextEditingController();
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context, state) {
          if(state is ShopLoginSuccessState){
            if(state.loginModel.status){
              // print(state.loginModel.message);
              showTowst(message:state.loginModel.message,
              state: ToastState.Success
              );
              Cash_helper.saveData(key: 'token', value: state.loginModel.data!.token).then((value) {
                // token= state.loginModel.data!.token;
                NavegateAndFinsh(context,hayatLayout());
              });
            }
            else{
              print(state.loginModel.message);
              showTowst(message:state.loginModel.message,
                  state: ToastState.error
              );
            }
          }
        },
        builder: (context, state) {
          LoginCubit loginCubit =  LoginCubit .get(context);
          return  Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
           children: [
             Padding(
               padding: const EdgeInsets.only(right: 45,
                   top: 100),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   CircleAvatar(
                     radius: 43,
                     backgroundImage: AssetImage('assets/logo5.jpg'),
                   ),
                 ],
               ),
             ),
             Center(
               child: SingleChildScrollView(
                 child: Padding(
                   padding: const EdgeInsets.all(20),
                   child: Column(
                     children: [
                       Column(
                         children: [
                           Text(
                             'Login',
                             style: Theme.of(context).textTheme.headline4?.copyWith(
                               fontWeight: FontWeight.w900,
                               color: Colors.amber,
                             ),
                           ),

                           SizedBox(
                             height: 15,
                           ),

                           SizedBox(
                             height: 30,
                           ),
                           Form(
                             key: formKey,
                             child: Column(
                               children: [
                                 Container(
                                   clipBehavior: Clip.hardEdge,
                                   decoration:

                                   BoxDecoration(
                                     borderRadius: BorderRadius.circular(30),

                                     boxShadow: [
                                       const BoxShadow(
                                         blurRadius: 3,
                                         spreadRadius:0,
                                         color: Color.fromRGBO(225, 233, 240,0),
                                       )
                                     ],
                                   ),

                                   child: TextFormField(

                                     controller:emailController,
                                     keyboardType: TextInputType.emailAddress ,
                                    validator: (value){
                                       if(value!.isEmpty||!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}').hasMatch(value)){
                                         return " Email Address Musn\'t be empty";
                                       }
                                       else{
                                         return null;
                                       }
                                     },
                                     decoration: InputDecoration(
                                       prefixIcon:Icon(Icons.email_outlined),

                                       labelText: 'Email Address Or Number Phone',
                                       filled: true,
                                       fillColor: Colors.white,
                                       border: InputBorder.none,
                                      //  border:OutlineInputBorder(
                                      //
                                      //    borderRadius: BorderRadius.circular(30),
                                      //    borderSide:const BorderSide(color: Colors.white,width: 3),
                                      //  ),

                                     ),
                                   ),
                                 ),
                                 SizedBox(
                                   height: 15,
                                 ),
                                 Container(
                                   clipBehavior: Clip.antiAliasWithSaveLayer,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(30),
                                     boxShadow: [
                                       const BoxShadow(
                                         blurRadius: 3,
                                         spreadRadius:0,
                                         color: Color.fromRGBO(220, 233, 240,0),
                                       )
                                     ],
                                   ),
                                   child: TextFormField(
                                     obscureText:loginCubit. obsecure,
                                     controller:PasswordController,
                                     onFieldSubmitted: (value){
                                       if(formKey.currentState!.validate()){
                                        // LoginCubit.get(context).userLogin(email: emailController.text, password: PasswordController.text);

                                       }
                                     },
                                     keyboardType: TextInputType.visiblePassword ,
                                     validator: (String ?value){
                                       if(value!.isEmpty){
                                         return ' password is too short';
                                       }
                                     },
                                     decoration: InputDecoration(

                                       suffixIcon: IconButton(onPressed: (){
                                         loginCubit.ChangeObsecure();

                                       },
                                         icon:   loginCubit.obsecure ? Icon(Icons.visibility):Icon(Icons.visibility_off),),
                                       prefixIcon:Icon(Icons.lock_outline),

                                       labelText: 'Password',
                                       filled: true,
                                       fillColor: Colors.white,
                                      border: InputBorder.none



                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                           SizedBox(
                             height: 0,
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               defaultTextBottom(
                                 text: 'Forget Password?',
                                 function: (){
                                   NavegateTo(
                                     context,forgetPasswordScreen()
                                   );
                                 }

                               ),
                             ],
                           ),
                           SizedBox(
                             height: 20,
                           ),
                          ConditionalBuilder
                            (
                          condition:state is! ShopLoginLoadingState,
                            builder:(context) =>   defaultButton(
                                text: 'login',
                                onTap: (){
                                  if(formKey.currentState!.validate()){
                                    NavegateAndFinsh(context,hayatLayout());
                                    // LoginCubit.get(context).userLogin(
                                    //     email: emailController.text,
                                    //     password: PasswordController.text);

                                  }
                                },
                                radius: 30
                            ),
                            fallback:(context) => Center(child: CircularProgressIndicator()) ,
                          ) ,
                           SizedBox(
height: 20,
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               FloatingActionButton(

                                 child: Image.asset('assets/google.png',width:25,),
                                 onPressed: (){
                                   print('object');
                                 },

                                 backgroundColor: Colors.white,
                               ),
                               SizedBox(
                                 width: 35,
                               ),
                               FloatingActionButton(

                                 child: Image.asset('assets/ff.png',width: 16,),
                                 onPressed: (){
                                   print('object');
                                 },

                                 backgroundColor: Colors.white,
                               ),
                               SizedBox(
                                 width: 35,
                               ),
                               FloatingActionButton(

                                 child: Image.asset('assets/twitter.png',width: 25,),
                                 onPressed: (){
                                   print('object');
                                 },

                                 backgroundColor: Colors.white,
                               ),
                             ],
                           ),
                           SizedBox(
                             height: 20,
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text('Dont\'t have an account?'),
                               defaultTextBottom(function: (){


                                   NavegateTo(context,emailScreen());

                               }, text: 'Sign up')
                             ],
                           ),


                         ],
                       ),
                     ],
                   ),

                 ),
               ),
             ),
           ],

            ),
          );
        },

      ),
    );
  }
}
