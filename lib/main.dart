import 'package:flutter/material.dart';
import 'package:my_app/views/home_page.dart';

//void main() => runApp(MyApp());

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primaryColor: Colors.green),
    ));
