import 'package:flutter/material.dart';
import 'package:health_and_hope/src/views/Login/login.dart';

Map<String, WidgetBuilder> getApplicationsRoutes () {
  return <String, WidgetBuilder>{ //Rutas para ingresar
    'login'                   : (BuildContext context) => LoginView(),
  };
}
