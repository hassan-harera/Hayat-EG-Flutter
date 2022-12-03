import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayat/modules/StartApp/login/Login.dart';
import 'package:hayat/modules/StartApp/registerScreen/RegisterCubit/registerState.dart';
import 'package:hayat/modules/StartApp/registerScreen/RegisterCubit/rigistrCubit.dart';
import 'package:hayat/shared/component/constans.dart';

class basicInformationScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  bool obsecure = false;

  var firstNameController = TextEditingController();

  var lastNameController = TextEditingController();

  var phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {},
        builder: (context, state) {
          RegisterCubit registertCubit =  RegisterCubit .get(context);
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
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            bottom: 30, end: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              fit: StackFit.loose,
                              alignment: AlignmentDirectional.bottomCenter,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.only(),
                                  child: Image.asset(
                                    'assets/unlocked.png',
                                    scale: 2.7,
                                    width: 180,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Basic Information ',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Please Enter your data',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'First Name',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 3,
                                    spreadRadius: 0,
                                    color: Color.fromRGBO(220, 233, 240, 0),
                                  )
                                ],
                              ),
                              child: TextFormField(
                                obscureText: obsecure,
                                controller: firstNameController,
                                onFieldSubmitted: (value) {
                                  if (formKey.currentState!.validate()) {
                                    // LoginCubit.get(context).userLogin(email: emailController.text, password: PasswordController.text);

                                  }
                                },
                                keyboardType: TextInputType.visiblePassword,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return ' Please Enter Code';
                                  }
                                },
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.person_outline),
                                    hintText: 'First Name',
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: InputBorder.none),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Last Name',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 3,
                                    spreadRadius: 0,
                                    color: Color.fromRGBO(220, 233, 240, 0),
                                  )
                                ],
                              ),
                              child: TextFormField(
                                obscureText: obsecure,
                                controller: lastNameController,
                                onFieldSubmitted: (value) {
                                  if (formKey.currentState!.validate()) {
                                    // LoginCubit.get(context).userLogin(email: emailController.text, password: PasswordController.text);

                                  }
                                },
                                keyboardType: TextInputType.visiblePassword,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return ' Please Enter Your Last Name';
                                  }
                                },
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.person_outline),
                                    hintText: 'Last Name',
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: InputBorder.none),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Phone Number',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 3,
                                    spreadRadius: 0,
                                    color: Color.fromRGBO(220, 233, 240, 0),
                                  )
                                ],
                              ),
                              child: TextFormField(
                                obscureText: obsecure,
                                controller: phoneNumberController,
                                onFieldSubmitted: (value) {
                                  if (formKey.currentState!.validate()) {
                                    // LoginCubit.get(context).userLogin(email: emailController.text, password: PasswordController.text);

                                  }
                                },
                                keyboardType: TextInputType.phone,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return ' Please Enter Your Phone';
                                  }
                                },
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.phone),
                                    hintText: '01xx-xxx-xxxx',
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: InputBorder.none),
                              ),
                            ),
                            Row(
                              children: [
                                Checkbox(

                                    value:registertCubit.checkeed ,
                                    onChanged: (value) {
                                      registertCubit.changeCheckbox(value);
                                    }),
                                Text('I agree To The Privacy Policy')
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 50,
                      ),
                      ConditionalBuilder(
                        condition: state is! RegisterLoadingState,
                        builder: (context) => defaultButton(
                            text: 'Verifiay',
                            onTap: () {
                              if ((formKey.currentState!.validate())) {
                                if((registertCubit.checkeed==true)){
                                  NavegateTo(context, LoginScreen());
                                }



                                //
                                // LoginCubit.get(context).userLogin(
                                //     email: emailController.text,
                                //     password: PasswordController.text);

                              }
                            },
                            radius: 30),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
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
