import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takly/cubits/login_cubit/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isviasable = true;

  void switchValue() {
    isviasable = !isviasable;
    emit(SwitchValueState());
  }
  
  String userEmail = '';
  String userPassword = '';
  signInWithEmail() async {
   
    try {
      emit(
        LoginLoadingState(),
      );
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: userEmail, password: userPassword);

      emit(
        LoginSuccessState(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (error) {
      emit(
        LoginFailuerState(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
