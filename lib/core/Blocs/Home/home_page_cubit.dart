import 'package:bloc/bloc.dart';
import 'package:firebase_task/Services/Database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:intl/intl.dart';

import '../../Models/WeightModel.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());

  static HomePageCubit get(context) => BlocProvider.of<HomePageCubit>(context);

  TextEditingController homeController = TextEditingController();
  WeightModel? selectedWeight ;
  String oldValue = "";
  Stream<List<WeightModel>>? weight;
  List<WeightModel>? weightTwo;

  addWeight() {
    if (selectedWeight!=null) {
      updateSelectedWeight();
      return;
    }
    emit(HomePageCreatedWeightLoading());
    Database.createWeight(weight:homeController.text.trim() ,date: "${DateFormat.Hms().format(DateTime.now())} ${DateFormat.yMd().format(DateTime.now())}").then((value) {
      emit(HomePageCreatedWeightSuccess());
      homeController.clear();
      getDate();
    }).onError((error, stackTrace) {
      emit(HomePageCreatedWeightFail());
    });
  }

  selectWeight({required WeightModel selected}) {
    selectedWeight = selected;
    homeController.text = selected.weight!;
    emit(HomePageDataGetSuccess());
  }

  updateSelectedWeight() {
    Database.updateWeight(selectedWeight!,homeController.text.trim()).then((value) {
      emit(UpdateWeightSelectedSuccessful());
      getDate();
      homeController.clear();
      selectedWeight=null;
    });

  }
  
  getDate() async {
    emit(HomePageDataLoading());
    await Database.retrieveUserData().then((value){
      weightTwo=value;
      if(weightTwo!.isEmpty)emit(HomePageDataGetSuccess());
      weightTwo!.sort((b, a) => a.date!.compareTo(b.date!));
      emit(HomePageDataGetSuccess());
    });
  }

  deleteWeight({required WeightModel model}){
    Database.deleteWeight(model).then((value) {
      emit(DeletedWeightSelectedSuccessful());
      getDate();
    });
  }
  
}
