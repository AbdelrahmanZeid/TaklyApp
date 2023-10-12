import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takly/cubits/sign_up_cubit/sign_up_states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit()
      : super(
          SignUpInitState(),
        );
  static SignUpCubit get(context) => BlocProvider.of(context);
  bool isviasable = true;

  void switchValue() {
    isviasable = !isviasable;
    emit(SwitchValueState());
  }

  String userEmail = '';
  String userPassword = '';

  Future<void> signUpWithEmail() async {
    try {
      emit(
        SignUpLoadingState(),
      );
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      emit(
        SignUpSuccessState(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (error) {
      emit(
        SignUpFailuerState(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
