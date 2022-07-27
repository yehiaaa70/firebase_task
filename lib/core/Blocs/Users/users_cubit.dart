import 'package:bloc/bloc.dart';
import 'package:firebase_task/Services/Auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial());

  static UsersCubit get(context) => BlocProvider.of<UsersCubit>(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  createNewEmail() {
    emit(UsersCreatedLoading());
    Auth.signUP(emailController.text.trim(), passwordController.text.trim())
        .then((value) {
      emit(UsersCreatedSuccess());
    }).onError((error, stackTrace) {
      emit(UsersCreatedFail());
    });
  }

signInWithEmail() {
    emit(UsersCreatedLoading());
    Auth.signIN(emailController.text.trim(), passwordController.text.trim())
        .then((value) {
      emit(UsersCreatedSuccess());
    }).onError((error, stackTrace) {
      emit(UsersCreatedFail());
    });
  }

  createNewAnonymous() {
    emit(UsersCreatedLoading());
    Auth.signUPAnonymous().then((value) {
      emit(UsersCreatedSuccess());
    }).onError((error, stackTrace) {
      emit(UsersCreatedFail());
    });
  }

  signOut(){
    Auth.signOut();
  }
}
