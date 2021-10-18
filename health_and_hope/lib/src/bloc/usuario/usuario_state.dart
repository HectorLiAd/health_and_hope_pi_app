part of 'usuario_bloc.dart';

class UsuarioState {

  late final bool existeUsuario;
  late final Usuario usuario;

  UsuarioState({ Usuario? user })
      : usuario = user ?? Usuario(),
  existeUsuario = (user!=null)?true:false;

  UsuarioState copyWith({Usuario? usuario}) => UsuarioState(
    user: usuario ?? this.usuario
  );

  UsuarioState estadoInicial() => new UsuarioState();
}