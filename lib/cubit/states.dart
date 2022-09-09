import 'package:odoo_testing_app/login_model.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppLoginLoadingState extends AppStates {}

class AppLoginSuccessState extends AppStates {
  LoginModel loginModel;
  AppLoginSuccessState(this.loginModel);
}

class AppLoginErrorState extends AppStates {
  final String error;

  AppLoginErrorState(this.error);
}

class ChangeIconState extends AppStates {}
