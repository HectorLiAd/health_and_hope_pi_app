import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_and_hope/src/bloc/usuario/usuario_bloc.dart';
import 'package:health_and_hope/src/models/Usuario.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: (){
              BlocProvider.of<UsuarioBloc>(context).add(
                BorrarUsuario(),
              );
            }
          )
        ],
      ),
      body: BlocBuilder<UsuarioBloc, UsuarioState>(
        builder: (context, state){
          if (state.existeUsuario) {
            return InformacionUsuario( usuario: state.usuario);
          } else {
            return Center(
              child: Text('No hay un usuario seleccionado')
            );
          }
        }
      ),

      floatingActionButton: FloatingActionButton(
          child: Icon( Icons.accessibility_new ),
          onPressed: () => Navigator.pushNamed(context, 'pagina2')
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario? usuario;

  const InformacionUsuario({Key? key, this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text('General', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
          Divider(),
          ListTile( title: Text('Nombre: ${ this.usuario!.nombre}') ),
          ListTile( title: Text('Edad: ${ this.usuario!.edad}') ),
          Text('Profesiones', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
          Divider(),

          ...usuario!.profesiones!.map(
                  (profesion) => ListTile(title: Text(profesion))
          ).toList(),

        ],
      ),
    );
  }

}