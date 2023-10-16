 abstract class PickImageStates{}


class PickImageInitState extends PickImageStates{}
class PickImageLoadingState extends PickImageStates{}
class PickImageSuccessState extends PickImageStates{}
class PickImageFailuerState extends PickImageStates {

  final String errorMessage;
  PickImageFailuerState({
    required this.errorMessage,
  });
}
