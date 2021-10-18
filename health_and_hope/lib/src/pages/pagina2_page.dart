import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_and_hope/src/bloc/usuario/usuario_bloc.dart';
import 'package:health_and_hope/src/models/Usuario.dart';

class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final usuarioBloc = BlocProvider.of<UsuarioBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                  child: Text('Establecer Usuario', style: TextStyle( color: Colors.white ) ),
                  color: Colors.blue,
                  onPressed: () {

                    final newUser = Usuario(
                      nombre: 'Hector',
                      edad: 21,
                      profesiones: ['Junior depeloper']
                    );

                    usuarioBloc.add(ActivarUsuario(newUser));

                  }
              ),

              MaterialButton(
                  child: Text('Cambiar Edad', style: TextStyle( color: Colors.white ) ),
                  color: Colors.blue,
                  onPressed: () {

                    usuarioBloc.add(CambiarEdad(12));
                  }
              ),

              MaterialButton(
                  child: Text('Añadir Profesion', style: TextStyle( color: Colors.white ) ),
                  color: Colors.blue,
                  onPressed: () {
                    usuarioBloc.add(AgregarProfesion("Doctor"));
                  }
              ),

            ],
          )
      ),
    );
  }
}