import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:health_and_hope/src/views/Login/helpers.dart';
import 'package:health_and_hope/src/views/Login/login_controller.dart';
import 'package:reactive_forms/reactive_forms.dart';


class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  String error='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 190,
        backgroundColor: helpers.colorBase(), //#e81c25
        title: Container(
          child: Image(
            image: AssetImage('assets/images/handh_logo.png'),
            width: 110,
          ),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ReactiveForm(
                formGroup: loginController.loginForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(height: 20),
                    _buildMensaje(),
                    Container(height: 60),
                    Text('Proceda con su identificación'),
                    Container(height: 20),
                    _buildEmail(),
                    _buildPassword(),
                    Container(height: 60),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(error, style: TextStyle(color: Colors.red),),
                  _inciarSesion(context),
                  Container(height: 10),
                  Text('¿OLVIDO SU CONTRASEÑA?'),
                  Container(height: 25),
                  Text('Registrate', style: helpers.textStyle3()),
                ],
              )
            ],
          ),
        ),
      )
    );
  }

  Widget _buildMensaje() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Inicio de Sesiòn', style: helpers.textStyle1()),
        Text('Health&Hope', style: helpers.textStyle1(fontWeight: true) ),
      ],
    );
  }

  Widget _buildEmail(){
    return ReactiveTextField(
      formControlName: 'email',
      validationMessages: (control)=>{
        ValidationMessage.required:'El campo es requerido',
        ValidationMessage.email: 'El email es incorrecto',
      },
      decoration: InputDecoration(labelText: 'Email'),
    );
  }

  Widget _buildPassword(){
    return ReactiveTextField(
      formControlName: 'password',
      validationMessages: (control)=>{
        ValidationMessage.pattern:"Ingrese una contraseña con fuerte",
        ValidationMessage.required:'Este campo es requerido'
      },
      decoration: InputDecoration(labelText: 'Password'),
    );
  }

  Widget _inciarSesion(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        setState(() => this.error ='');
        if (loginController.loginForm.valid){
          print('Success');
          loginController.cleanData();
        }else {
          setState(() => this.error ='Los datos estan incompletos');
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(helpers.colorBase()),
      ),
      child: Container(
        child: Text('Iniciar Sesiòn'),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      ),
    );
  }


}
