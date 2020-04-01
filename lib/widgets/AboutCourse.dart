import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inovola_task/model/Response.dart';

class AboutCourse extends StatelessWidget {
  final Response response;

  AboutCourse({this.response});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.start,
        direction: Axis.horizontal,
        textDirection: TextDirection.rtl,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: <Widget>[
          Text(
            "عن الدوره",
            style: TextStyle(
                fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          Container(height: 10,) ,
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              response.occasionDetail,
              style: TextStyle(color: Colors.grey),
              textDirection: TextDirection.rtl,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
