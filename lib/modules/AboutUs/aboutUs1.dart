import 'package:flutter/material.dart';

class aboutUs1 extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:      Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(
                bottom: 290
            ),

             child: Image.asset('assets/MH.jpg',width: 250,),

          ),
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [

              ClipPath(
                clipper: mycustomCliper(),
                child: Container(
                  color:Colors.amber,
                  // decoration: BoxDecoration(
                  //
                  //      gradient: LinearGradient(colors: [Colors.amberAccent,Colors.amber],begin: Alignment.bottomLeft,end:Alignment.topRight )
                  //
                  //    ),

                ),),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 460),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Donate Medicines', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white
                    ),),
                    SizedBox(
                      height: 40,
                    ),
                    Text('Donate Medicines Donate Medicines', style: TextStyle(


                        color: Colors.white
                    ),),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Donate Medicines Donate Medicines Donate Medicines', style: TextStyle(


                        color: Colors.white
                    ),),
                  ],
                ),
              ),
            ],
          ),


        ],
      ),
    );

  }
}

class mycustomCliper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path =Path();
    var w =size.width;
    var h =size.height;
    path.moveTo(0, 620);
    path.lineTo(0, h);
    // path.quadraticBezierTo(0, h, 50,h);
    path.lineTo(w, h);
    //  path.quadraticBezierTo(0, h, 50,h);
    path.lineTo(w, 570);
    path.quadraticBezierTo(180, 520, 0,630);


    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}