import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takly/cubits/auth_cubit/auth_state.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit()
      : super(
          AuthInitState(),
        );
  static AuthCubit get(context) => BlocProvider.of(context);

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      emit(
        AuthWithGoogleStateLoadig(),
      );
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      emit(
        AuthWithGoogleStateSuccess(),
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      emit(
        AuthWithGoogleStateFailuer(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      emit(
        AuthWithFacebokStateLoadig(),
      );
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(
        loginResult.accessToken!.token,
      );

      FirebaseAuth.instance.signInWithCredential(
        facebookAuthCredential,
      );
      emit(
        AuthWithFacebookStateSuccess(),
      );
    } catch (errorMessage) {
      emit(
        AuthWithFacebookStateFailuer(
          errorMessage: errorMessage.toString(),
        ),
      );
    }
  }

  Future<UserCredential> signInWithTwitter() async {
    emit(
      AuthWithTwitterStateLoadig(),
    );
    // Create a TwitterLogin instance
    final twitterLogin = new TwitterLogin(
        apiKey: '<your consumer key>',
        apiSecretKey: ' <your consumer secret>',
        redirectURI: '<your_scheme>://');

    // Trigger the sign-in flow
    final authResult = await twitterLogin.login();

    // Create a credential from the access token
    final twitterAuthCredential = TwitterAuthProvider.credential(
      accessToken: authResult.authToken!,
      secret: authResult.authTokenSecret!,
    );
    emit(
      AuthWithTwitterStateSuccess(),
    );

     return await FirebaseAuth.instance
        .signInWithCredential(twitterAuthCredential);
  }
}
