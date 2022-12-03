import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hayat/modules/AboutUs/aboutUs1.dart';
import 'package:hayat/modules/AboutUs/aboutUs2.dart';
import 'package:hayat/modules/AboutUs/aboutus3.dart';
import 'package:hayat/modules/StartApp/login/Login.dart';
import 'package:hayat/shared/component/component.dart';
import 'package:hayat/shared/component/constans.dart';
import 'package:hayat/shared/netowrk/local/Cash_helper/cash_helper.dart';
import 'package:hayat/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class Bordingdata{
  late String image;
  late String title;
  late String body;
  Bordingdata(
  {
required this.image,
required this.title,
required this.body,
});
}

class onBordingScrren extends StatefulWidget{
  @override
  State<onBordingScrren> createState() => _onBordingScrrenState();
}

class _onBordingScrrenState extends State<onBordingScrren> {
  List<Bordingdata>Bording=[
    Bordingdata(
   image:'assets/hh.jpg',
   title: 'Screen1 title',
   body: 'Screen1 body',
    ),
    Bordingdata(
   image:'assets/hh.jpg',
   title: 'Screen2 title',
   body: 'Screen2 body',
    ),
    Bordingdata(
   image:'assets/hh.jpg',
   title: 'Screen3 title',
   body: 'Screen3 body',
    ),
  ];
List<Widget>OnBordingScreen=[
  aboutUs1(),
  aboutUs2(),
  aboutUs3(),
];
  bool isLast=false;

  void submit() {
    Cash_helper.saveData(key: 'onBoarding', value: true).then((value) {
      if(value){
        NavegateAndFinsh(context,LoginScreen());
      }
    });

  }
  var BordController=PageController();

  @override
  Widget build(BuildContext context) {
return Scaffold(
  // appBar: AppBar(
  //   backgroundColor: Colors.white,
  //   actions: [
  //     Padding(
  //       padding: const EdgeInsets.all(12),
  //       child:MaterialButton(
  //         color: Colors.amber,
  //         onPressed: submit,
  //         child: Text('Skip'),
  //         ) ,
  //
  //
  //       ),
  //
  //   ],
  // ),
  body: Column(
    children: [

      Expanded(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            PageView.builder(
              onPageChanged: (int index){
                if(index==Bording.length-1){
                  setState(() {
                    isLast=true;
                  });
                }
                else{
                  setState(() {
                    isLast=false;
                  });
                }
              },
              physics: BouncingScrollPhysics(),
              controller: BordController,
              itemBuilder: (context,index)=>OnBordingScreen[index],
              itemCount: Bording.length,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SmoothPageIndicator(
                    controller: BordController,
                    count: Bording.length,
                    effect:ExpandingDotsEffect(
                      activeDotColor: Colors.white,
                      dotHeight: 10,
                      spacing: 10,
                    ),
                  ),
                  Spacer(),
                  FloatingActionButton(onPressed: (){
                    setState(() {
                      if(isLast==true){
                        submit();
                      }
                      else{
                        BordController.nextPage(duration:Duration(
                            milliseconds: 750
                        ), curve: Curves.fastLinearToSlowEaseIn);

                      }
                    });
                  },
                    child: Icon(Icons.arrow_forward_ios_outlined),
                  )
                ],
              ),
            ),

          ],
        ),
      ),




    ],
  ),
);
  }
}
