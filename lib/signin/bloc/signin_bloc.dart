import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'signin_event.dart';
import 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SingInInitialState()) {
    on<SignInTextChangedEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(SignInErrorState('Please enter valid email'));
      } else if (event.passwordValue.length < 8) {
        emit(SignInErrorState('Please enter valid password'));
      } else {
        emit(SignInValidState());
      }
    });

    on<SignInSubmittedEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
