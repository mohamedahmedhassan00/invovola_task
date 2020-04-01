import 'package:flutter/material.dart';
import 'package:inovola_task/model/Response.dart';

class CoachName extends StatelessWidget {
  final Response reponse ;
  CoachName({this.reponse}) ;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return  Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.start,
          direction: Axis.horizontal,
          textDirection: TextDirection.rtl,
          crossAxisAlignment: WrapCrossAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                   reponse.trainerName ,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: screenSize.width * .10,
                    width: screenSize.width * .10,
                    margin: EdgeInsets.only(left: 14),
                    child: ClipRRect(
                      child: Image.network(reponse.trainerImg),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )
                ],
              ),
              RichText(
                textDirection: TextDirection.rtl,
                text: TextSpan(
                  text:
                  reponse.trainerInfo ,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
