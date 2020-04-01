import 'package:flutter/material.dart';
import 'package:inovola_task/pages/Home.dart';
import 'package:inovola_task/provider/ApiRequest.dart';
import 'package:provider/provider.dart';
void main() => runApp(

    MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ApiRequest(),
        ),
      ],
      child:MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: Home(),
      ) ,
    ) ;

  }
}
