import 'package:flutter/material.dart';
import 'package:inovola_task/model/Response.dart';

class CourseCost extends StatelessWidget {
  final Response response ;
  CourseCost({this.response});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(8),
      // height: screenSize.height * .26,
      width: screenSize.width,
      child: Wrap(
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.start,
        direction: Axis.horizontal,
        textDirection: TextDirection.rtl,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: <Widget>[
          Text("سعر الدوره"),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(response.price.toString() + '\$',
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
              Text("الحجز العادى"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(response.price.toString() + '\$',
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
             Text("الحجز المميز"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(response.price.toString() + '\$',
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
             Text("الحجز السريع"),
            ],
          ),
        ],
      ),
    );
  }
}
