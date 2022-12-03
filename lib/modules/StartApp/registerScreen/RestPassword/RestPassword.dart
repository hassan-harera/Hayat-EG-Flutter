import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayat/modules/StartApp/login/Login.dart';
import 'package:hayat/modules/StartApp/registerScreen/RegisterCubit/registerState.dart';
import 'package:hayat/modules/StartApp/registerScreen/RegisterCubit/rigistrCubit.dart';
import 'package:hayat/shared/component/constans.dart';

class resetPasswordScreen extends StatelessWidget{
  var formKey=GlobalKey<FormState>();

 var reset1PasswordController=  TextEditingController();
 var reset2PasswordController=  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterState>(
        listener: (context, state) {},
        builder: (context, state) {
          RegisterCubit registerCubit =  RegisterCubit.get(context);
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

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment:AlignmentDirectional.bottomCenter,
                              children:

                            [
                              Image.asset('assets/lock.png',scale: 1.7,),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  end: 33,
                                  bottom: 10
                                ),
                                child: Icon(Icons.check,size: 80,color: Colors.amber,),
                              ),

                            ],),
                          ],
                        ),
                      SizedBox(height: 30,),
                      Text('Reset Password',style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,

                      ),),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Please Enter A Strong Password',style: TextStyle(
                          color: Colors.grey
                      ),),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Password',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(
                        height: 10,
                      ),
                      Form (
                        key:formKey ,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                obscureText:registerCubit.obsecure1,
                                controller:reset1PasswordController,
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
                                      registerCubit.ChangeObsecure1();

                                    },
                                      icon: registerCubit.obsecure1 ? Icon(Icons.visibility):Icon(Icons.visibility_off),),
                                    prefixIcon:Icon(Icons.lock_outline),

                                    labelText: '**********',
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: InputBorder.none



                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Re-Password',style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),),
                            SizedBox(
                              height: 10,
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
                                obscureText:registerCubit.obsecure2,
                                controller:reset2PasswordController,
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
                                      registerCubit.ChangeObsecure2();

                                    },
                                     icon: registerCubit.obsecure2 ? Icon(Icons.visibility):Icon(Icons.visibility_off),),
                                    prefixIcon:Icon(Icons.lock_outline),

                                    labelText: '**********',
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: InputBorder.none



                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox (
                        height: 50,
                      ),
                      ConditionalBuilder
                        (
                        condition:state is! RegisterLoadingState,
                        builder:(context) =>   defaultButton(
                            text: 'Next',
                            onTap: (){
                              if(formKey.currentState!.validate()){
                                if(reset1PasswordController.text==reset2PasswordController.text){
                                  NavegateTo(context ,LoginScreen());
                                }

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