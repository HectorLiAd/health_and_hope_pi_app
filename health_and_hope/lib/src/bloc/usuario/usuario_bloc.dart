import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_and_hope/src/models/Usuario.dart';
import 'package:meta/meta.dart';

part 'usuario_event.dart';
part 'usuario_state.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {

  UsuarioBloc() : super(UsuarioState().estadoInicial());

  @override
  Stream<UsuarioState> mapEventToState( UsuarioEvent event) async* {

    if (event is ActivarUsuario) {
      yield state.copyWith(
          usuario: event.usuario
      );
    } else if (event is CambiarEdad) {
      yield state.copyWith(
        usuario: state.usuario.copyWith(edad: event.edad)
      );
    } else if (event is AgregarProfesion) {
      yield state.copyWith(
        usuario:  state.usuario.copyWith(
            profesiones: [
              ...?state.usuario.profesiones,
              event.profesion
            ]
        )
      );
    } else if (event is BorrarUsuario){
      yield state.estadoInicial();
    }
  }
}