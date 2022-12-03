import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayat/modules/StartApp/registerScreen/RegisterCubit/registerState.dart';
import 'package:hayat/modules/StartApp/registerScreen/RegisterCubit/rigistrCubit.dart';
import 'package:hayat/modules/StartApp/registerScreen/SetPassword/SetPassword.dart';

import 'package:hayat/shared/component/constans.dart';

class EmailverificationScreen extends StatelessWidget{
  var formKey=GlobalKey<FormState>();
  bool obsecure=false;
  var verificationController=  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: backIcon(context),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(bottom: 30,end: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              fit: StackFit.loose,
                              alignment:AlignmentDirectional.bottomCenter,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.only(),
                                  child: Image.asset('assets/unlocked.png',scale: 2.7,width: 180,),
                                ),


                              ],
                            ),
                          ],
                        ),
                      ),
                      Text('Email Verification ',style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Please Enter The Sent Verification Code',style: TextStyle(
                          color: Colors.grey
                      ),),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Verification Code',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(
                        height: 20,
                      ),
                      Form (
                        key:formKey ,
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            boxShadow:const [
                              BoxShadow(
                                blurRadius: 3,
                                spreadRadius:0,
                                color: Color.fromRGBO(220, 233, 240,0),
                              )
                            ],
                          ),
                          child: TextFormField(
                            obscureText: obsecure,
                            controller:verificationController,
                            onFieldSubmitted: (value){
                              if(formKey.currentState!.validate()){
                                // LoginCubit.get(context).userLogin(email: emailController.text, password: PasswordController.text);

                              }
                            },
                            keyboardType: TextInputType.visiblePassword ,
                            validator: (String ?value){
                              if(value!.isEmpty){
                                return ' Please Enter Code';
                              }
                            },
                            decoration:const InputDecoration(
                                prefixIcon: Icon(Icons.person_outline),
                                hintText: '123-456',
                                filled: true,
                                fillColor: Colors.white,
                                border: InputBorder.none



                            ),
                          ),
                        ),
                      ),
                      SizedBox (
                        height: 50,
                      ),
                      ConditionalBuilder
                        (
                        condition:state is! RegisterLoadingState,
                        builder:(context) =>   defaultButton(
                            text: 'Verifiay',
                            onTap: (){
                              if(formKey.currentState!.validate()){

                       NavegateTo(context ,setPasswordScreen());
                                // LoginCubit.get(context).userLogin(
                                //     email: emailController.text,
                                //     password: PasswordController.text);

                              }
                            },
                            radius: 30
                        ),
                        fallback:(context) => Center(child: CircularProgressIndicator()) ,
                      ) ,
                       ],
                  ),
                ),
              ),
            ),

          );
        },
      ),
    );
  }
}