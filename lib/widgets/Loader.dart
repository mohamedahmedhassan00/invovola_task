import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation<double> animation_rotation;

  Animation<double> animation_radius_in;

  Animation<double> animation_radius_out;

  final double initialRadius = 30;
  double raduis = 0 ;

  @override
  void initState() {
    super.initState();



    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 3000));
    animation_rotation = Tween<double>(begin: 0.0 , end: 1.0).animate(CurvedAnimation(parent: controller
     , curve: Interval(0.0 , 1.0 , curve: Curves.linear)));

    animation_radius_in = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(.75, 1.0, curve: Curves.elasticIn)));
    animation_radius_out = Tween<double>(begin: 0.0, end:1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, .25, curve: Curves.elasticOut)));
    controller.addListener((){
     setState(() {
       if(controller.value >= .75 && controller.value<=1.0){
         raduis = animation_radius_in.value * initialRadius ;
       }else if(controller.value >= 0.0 && controller.value <= .25){
         raduis = animation_radius_out.value * initialRadius ;

       }
     });

    });
    controller.repeat() ;
  }


  @override
  void dispose() {
    controller.dispose() ;

    super.dispose() ;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Center(
        child: RotationTransition(
          turns: animation_rotation,
          child: Stack(
            children: <Widget>[
//              Dot(
//                raduis: 30.0,
//                color: Colors.black12,
//              ),
              Transform.translate(
                offset: Offset(raduis * cos(pi / 4), raduis * sin(pi / 4)),
                child: Dot(
                  raduis: 10,
                  color: Colors.purple,
                ),
              ),
              Transform.translate(
                offset:
                    Offset(raduis * cos(2 * pi / 4), raduis * sin(2 * pi / 4)),
                child: Dot(
                  raduis: 9,
                  color: Colors.purple,
                ),
              ),
              Transform.translate(
                offset:
                    Offset(raduis * cos(3 * pi / 4), raduis * sin(3 * pi / 4)),
                child: Dot(
                  raduis: 8,
                  color: Colors.purple,
                ),
              ),
              Transform.translate(
                offset:
                    Offset(raduis * cos(4 * pi / 4), raduis * sin(4 * pi / 4)),
                child: Dot(
                  raduis: 7,
                  color: Colors.purple,
                ),
              ),
              Transform.translate(
                offset:
                    Offset(raduis * cos(5 * pi / 4), raduis * sin(5 * pi / 4)),
                child: Dot(
                  raduis: 6,
                  color: Colors.purple,
                ),
              ),
              Transform.translate(
                offset:
                    Offset(raduis * cos(6 * pi / 4), raduis * sin(6 * pi / 4)),
                child: Dot(
                  raduis: 5,
                  color: Colors.purple,
                ),
              ),
              Transform.translate(
                offset:
                    Offset(raduis * cos(7 * pi / 4), raduis * sin(7 * pi / 4)),
                child: Dot(
                  raduis: 4,
                  color: Colors.purple,
                ),
              ),
              Transform.translate(
                offset:
                    Offset(raduis * cos(8 * pi / 4), raduis * sin(8 * pi / 4)),
                child: Dot(
                  raduis: 3,
                  color: Colors.purple,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final double raduis;

  final Color color;

  Dot({this.raduis, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: raduis,
        width: raduis,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
