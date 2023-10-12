abstract class SignUpStates {}

class SwitchValueState extends SignUpStates {}

class SignUpInitState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpFailuerState extends SignUpStates {
  final String errorMessage;
  SignUpFailuerState({
    required this.errorMessage,
  });
}
