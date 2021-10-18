import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_and_hope/src/bloc/usuario/usuario_bloc.dart';
import 'package:health_and_hope/src/pages/pagina1_page.dart';
import 'package:health_and_hope/src/pages/pagina2_page.dart';
import 'package:health_and_hope/src/routes/routes.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => UsuarioBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          initialRoute: 'login',//Ruta base
          routes: getApplicationsRoutes(),
        )
    );
  }

}