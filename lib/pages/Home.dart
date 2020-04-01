import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inovola_task/model/Response.dart';
import 'package:inovola_task/provider/ApiRequest.dart';
import 'package:inovola_task/widgets/AboutCourse.dart';
import 'package:inovola_task/widgets/CoachName.dart';
import 'package:inovola_task/widgets/CourseCost.dart';
import 'package:inovola_task/widgets/CourseName.dart';
import 'package:inovola_task/widgets/Loader.dart';
import 'package:provider/provider.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation animation;

  Response response;
  bool flag = true;
  bool isInit = true;
  bool isConnected = true;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() async {

    if (isInit) {
      await Provider.of<ApiRequest>(context).printResponse().then((value) {
        print("ok");
        setState(() {
          response = value;
          flag = false;
        });
      });
      isInit = false;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child:
            Padding(
        padding: const EdgeInsets.all(0),
        child: flag
            ? Center(
                child: Loader(),
              )
            : FadeTransition(
                opacity: animation,
                child: Container(
                  height: screenSize.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                Stack(
                         children: [
                                Container(
                                  child: SizedBox(
                                    height: screenSize.height * .3,
                                    width: double.infinity,
                                    child: Carousel(
                                      overlayShadow: true,
                                      dotSize: 7.0,
                                      images: [
                                        Image.network(
                                          response.img[0],
                                          fit: BoxFit.fill,
                                        ),
                                        Image.network(response.img[1],
                                            fit: BoxFit.fill),
                                        Image.network(response.img[2],
                                            fit: BoxFit.fill),
                                        Image.network(response.img[3],
                                            fit: BoxFit.fill),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(padding: EdgeInsets.all(8),
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(MdiIcons.starBoxOutline , color: Colors.white, size: 30,),
                                          Container(width: 7,) ,
                                          Icon(MdiIcons.shareVariant , color: Colors.white, size: 30,),
                                        ],
                                      ),
                                      Icon(MdiIcons.arrowRight , color: Colors.white, size: 30,),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                              Divider(
                                height: 1,
                              ),
                              CourseName(
                                response: response,
                              ),
                              Divider(
                                height: 1,
                                color: Colors.grey,
                              ),
                              CoachName(
                                reponse: response,
                              ),
                              Divider(
                                height: 1,
                                color: Colors.grey,
                              ),
                              AboutCourse(response: response),
                              Divider(
                                height: 1,
                                color: Colors.grey,
                              ),
                              CourseCost(
                                response: response,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: screenSize.height * .08,
                        margin: EdgeInsets.only(bottom: 0, top: 0),
                        padding: EdgeInsets.all(0),
                        width: double.infinity,
                        child: RaisedButton(
                          color: Colors.purple,
                          child: Text(
                            "قم بالحجز الان",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                            textDirection: TextDirection.rtl,
                          ),
                          onPressed: () {},
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ) )
    );
  }
}
