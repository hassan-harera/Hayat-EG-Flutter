import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayat/modules/StartApp/registerScreen/IdentityVerification/IdentityVerification.dart';
import 'package:hayat/modules/StartApp/registerScreen/RegisterCubit/registerState.dart';
import 'package:hayat/modules/StartApp/registerScreen/RegisterCubit/rigistrCubit.dart';
import 'package:hayat/shared/component/constans.dart';

class forgetPasswordScreen extends StatelessWidget{
  var formKey=GlobalKey<FormState>();
  bool obsecure=false;
 var PhoneController=  TextEditingController();
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
                                 padding: EdgeInsetsDirectional.only(start: 35),
                                 child: Image.asset('assets/lock.png',scale: 1.7,),
                               ),
                               Padding(
                                 padding: const EdgeInsetsDirectional.only(
                                 bottom: 10,
                                   top: 10
                                 ),
                                 child: Icon(Icons.question_mark,size: 80,color: Colors.amber,),
                               ),

                              ],
                            ),
                          ],
                        ),
                      ),
                      Text('Forget Password',style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,

                      ),),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Please Enter your Number To Send You The Confirmation Code',style: TextStyle(
                          color: Colors.grey
                      ),),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Phone Number',style: TextStyle(
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
                            controller:PhoneController,
                            onFieldSubmitted: (value){
                              if(formKey.currentState!.validate()){
                                // LoginCubit.get(context).userLogin(email: emailController.text, password: PasswordController.text);

                              }
                            },
                            keyboardType: TextInputType.phone ,
                            validator: (String ?value){
                              if(value!.isEmpty){
                                return ' Plese Enter Your Password';
                              }
                            },
                            decoration:const InputDecoration(
                                prefixIcon: Icon(Icons.phone),
                                hintText: '01xx-xxx-xxxx',
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
                            text: 'Next',
                            onTap: (){
                              if(formKey.currentState!.validate()){
                                NavegateTo(context ,PhoneverificationScreen());
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