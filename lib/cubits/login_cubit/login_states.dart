 abstract class LoginStates{}

 class SwitchValueState extends LoginStates{}


class LoginInitState extends LoginStates{}
class LoginSuccessState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginFailuerState extends LoginStates {

  final String errorMessage;
  LoginFailuerState({
    required this.errorMessage,
  });
}
// class ResetPasswordSuccessState extends LoginStates{}
// class ResetPasswordLoadingState extends LoginStates{}
// class ResetPasswordFailuerState extends LoginStates {

//   final String errorMessage;
//   ResetPasswordFailuerState({
//     required this.errorMessage,
//   });
// }
