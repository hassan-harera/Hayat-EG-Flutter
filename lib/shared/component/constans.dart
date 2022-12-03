import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void NavegateTo(context ,widget)=>  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => widget));
void NavegateAndFinsh(context ,widget)=>  Navigator.pushAndRemoveUntil(context,
    MaterialPageRoute(builder: (context)=> widget),
    (route)=>false,
);

Widget defultTextFormField({
    required IconData prefixIcon,
    IconData  ? suffixIcon,
    String? labelText,
   required TextInputType type,
    bool Ispassword= false,
    Function? validator ,
    required TextEditingController controller,
    Function? onTap ,
    Function? onChanged,

    Function? suffixPressed,
  bool isClicable=true,
}) =>
    TextFormField(

      onFieldSubmitted:(value){

      },

        validator:(String? value) {
            validator!();

        },
        controller:controller,
        obscureText:Ispassword ,
        keyboardType:type ,
        decoration: InputDecoration(

            prefixIcon:Icon(prefixIcon),
            labelText: labelText,
            suffixIcon:suffixIcon !=null ?IconButton(onPressed: suffixPressed!(), icon:Icon( suffixIcon) ):null,
            border:  OutlineInputBorder() ,
        ),
    );

Widget MyTextFormField({
  TextEditingController? controller,
  IconData  ? suffixIcon,
  bool obsecure=false,
  required IconData prefixIcon,
  Function? onSubmit,
  String? validateText,
  Function? suffixPressed,
})=> Container(
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
    obscureText: obsecure,
    controller:controller,
    onFieldSubmitted:(value){onSubmit!();} ,
    keyboardType: TextInputType.visiblePassword ,
    validator: (String ?value){
      if(value!.isEmpty){
        return validateText;
      }
    },
    decoration: InputDecoration(

        suffixIcon:  suffixIcon !=null ?IconButton(onPressed: suffixPressed!(), icon:Icon( suffixIcon) ):null,
        prefixIcon:Icon(prefixIcon),

        labelText: 'Password',
        filled: true,
        fillColor: Colors.white,
        border: InputBorder.none



    ),
  ),
);

defaultButton( {
  double width = double.infinity,
 required String text,
  required Function onTap,
  bool isUppercase = true,
  Color color =Colors.amber,
  double radius =0
}) =>
    Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),

        color: color,
      ),
      width: width,
      height: 50,
      child: MaterialButton(
      onPressed: () {
          onTap();
        },
        child: Text(
          isUppercase? text.toUpperCase () : text,
          style: TextStyle(
            color: Colors.white,
             fontWeight: FontWeight.bold,
          ),
        ),
      ),

    );

Widget defaultTextBottom({
  required VoidCallback function,
  required String text
})=>TextButton(onPressed: function, child: Text(text));


void showTowst({
 required String message,
 required ToastState state,


})=>  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastState(state),
    textColor: Colors.white,
    fontSize: 16.0
);
enum ToastState{Success,Warning,error}

Color chooseToastState(ToastState state){
  Color color;
  switch (state)
  {
    case ToastState.Success:
  color= Colors.green;
      break;
      case ToastState.error:
      color= Colors.red;
      break;
      case ToastState.Warning:
  color= Colors.amber;
      break;
  }
  return color;
}
Widget backIcon(context)=>Padding(
padding: const EdgeInsetsDirectional.only(start: 10,
top: 10
),
child: Container(
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(15),
color: Colors.white,
),
child: IconButton(
style:   const ButtonStyle(

),
icon: const Icon(Icons.arrow_back_ios_new_outlined,),
onPressed: (){
Navigator.pop(context);
},
),
),
);
String token='';