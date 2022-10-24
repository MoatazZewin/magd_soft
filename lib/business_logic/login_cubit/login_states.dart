import '../../data/network/responses/login_response.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final LoginResponse loginResponse;

  LoginSuccessState(this.loginResponse);
}

class LoginSuccessStateWithoutLogin extends LoginStates {}

class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState(this.error);
}
