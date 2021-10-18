
import 'package:reactive_forms/reactive_forms.dart';

class _LoginController {
  final FormGroup loginForm= FormGroup({
    'email':FormControl<String>(
        validators: [
          Validators.required,
          Validators.email
        ],
        value: ''
    ),
    'password':FormControl<String>(
        validators: [
          Validators.required,
          Validators.pattern(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'),
        ],
        value: ''
    ),
  });

  void cleanData() {
    this.loginForm.control('email').value = '';
    this.loginForm.control('password').value = '';
  }

  String get getEmail =>
      this.loginForm.control('email').value;

  String get getPassword =>
      this.loginForm.control('password').value;

}

final loginController = _LoginController();