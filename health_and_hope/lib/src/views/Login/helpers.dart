import 'package:flutter/cupertino.dart';

class _Helpers {

  TextStyle textStyle1({bool fontWeight =false}) => TextStyle(fontWeight: (fontWeight)?FontWeight.bold:FontWeight.normal, fontSize: 30);
  TextStyle textStyle2({bool fontWeight =false}) => TextStyle(fontWeight: (fontWeight)?FontWeight.bold:FontWeight.normal, fontSize: 25);
  TextStyle textStyle3({bool fontWeight =false}) => TextStyle(fontWeight: (fontWeight)?FontWeight.bold:FontWeight.normal, fontSize: 20);
  TextStyle textStyle4({bool fontWeight =false}) => TextStyle(fontWeight: (fontWeight)?FontWeight.bold:FontWeight.normal, fontSize: 15);
  Color colorBase() => Color(int.parse("0xFF"+"e81c25"));
}

final _Helpers helpers = _Helpers();