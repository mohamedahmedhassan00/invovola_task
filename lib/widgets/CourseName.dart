import 'package:flutter/material.dart';
import 'package:inovola_task/model/Response.dart';
import 'package:hijri/umm_alqura_calendar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class CourseName extends StatelessWidget {
  final Response response;

  CourseName({this.response}) ;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(16),
     // height: screenSize.height * .27,
      width: screenSize.width,
      child: Wrap(
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.start,
        direction: Axis.horizontal,
        textDirection: TextDirection.rtl,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: <Widget>[
          Text(
            response.interest,
            style: TextStyle(color: Colors.grey),
          ),
           Container(height: 5,) ,
          Container(
            margin: const EdgeInsets.all(8.0),
            child: RichText(
              textDirection: TextDirection.rtl,
              text: TextSpan(
                text: response.title,
                style: TextStyle(fontSize: 17, color: Colors.black87),
              ),
            ),
          ),
          Container(
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(ummAlquraCalendar.fromDate(response.date).fullDate(),
                        style: TextStyle(fontSize: 14, color: Colors.grey)),
                    Container(
                      child: Icon(
                        MdiIcons.timetable,
                        color: Colors.grey,
                      ),
                      margin: EdgeInsets.only(
                        left: 9,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(response.address,
                        style: TextStyle(fontSize: 14, color: Colors.grey)),
                    Container(
                      child: Icon(
                        MdiIcons.pin,
                        color: Colors.grey,
                      ),
                      margin: EdgeInsets.only(
                        left: 9,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
