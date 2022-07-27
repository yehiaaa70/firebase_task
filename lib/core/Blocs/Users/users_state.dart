part of 'users_cubit.dart';

@immutable
abstract class UsersState {}

class UsersInitial extends UsersState {}
class UsersCreatedLoading extends UsersState {}
class UsersCreatedSuccess extends UsersState {}
class UsersCreatedFail extends UsersState {}
