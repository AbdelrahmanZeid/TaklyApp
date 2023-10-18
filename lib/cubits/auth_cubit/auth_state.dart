abstract class AuthStates {}

class AuthInitState extends AuthStates {}

class AuthWithGoogleStateSuccess extends AuthStates {}

class AuthWithGoogleStateLoadig extends AuthStates {}

class AuthWithGoogleStateFailuer extends AuthStates {
  final String errorMessage;
  AuthWithGoogleStateFailuer({
    required this.errorMessage,
  });
}

class AuthWithFacebookStateSuccess extends AuthStates {}

class AuthWithFacebokStateLoadig extends AuthStates {}

class AuthWithFacebookStateFailuer extends AuthStates {
  final String errorMessage;
  AuthWithFacebookStateFailuer({
    required this.errorMessage,
  });
}
class AuthWithTwitterStateSuccess extends AuthStates {}

class AuthWithTwitterStateLoadig extends AuthStates {}

class AuthWithTwitterStateFailuer extends AuthStates {
  final String errorMessage;
  AuthWithTwitterStateFailuer({
    required this.errorMessage,
  });
}
class AuthWithPhoneStateSuccess extends AuthStates {}

class AuthWithPhoneStateLoadig extends AuthStates {}

class AuthWithPhoneStateFailuer extends AuthStates {
  final String errorMessage;
  AuthWithPhoneStateFailuer({
    required this.errorMessage,
  });
}
