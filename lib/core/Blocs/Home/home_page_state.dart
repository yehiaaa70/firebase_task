part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageCreatedWeightLoading extends HomePageState {}
class HomePageCreatedWeightSuccess extends HomePageState {}
class HomePageCreatedWeightFail extends HomePageState {}


class HomePageDataLoading extends HomePageState {}
class HomePageDataGetSuccess extends HomePageState {}
class HomePageDataGetFail extends HomePageState {}
class HomePageDataGetFinish extends HomePageState {}


class WeightSelectedSuccessful extends HomePageState {}
class UpdateWeightSelectedSuccessful extends HomePageState {}
class DeletedWeightSelectedSuccessful extends HomePageState {}


