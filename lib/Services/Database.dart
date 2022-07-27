import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_task/core/Models/WeightModel.dart';
import 'package:intl/intl.dart';

class Database {
  static Future createWeight(
      {required String weight, required String date}) async {
    final docWeight = FirebaseFirestore.instance.collection("Weight").doc();
    WeightModel model =
        WeightModel(id: docWeight.id, weight: weight, date: date);
    await docWeight.set(model.toJson());
  }

  static Future<List<WeightModel>> retrieveUserData() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection("Weight").get();
    return snapshot.docs
        .map((docSnapshot) => WeightModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  static Future updateWeight(WeightModel model, String newValue) async {
    final docWeight =
        FirebaseFirestore.instance.collection("Weight").doc(model.id);
    model = WeightModel(
        weight: newValue,
        date:
            "${DateFormat.Hms().format(DateTime.now())} ${DateFormat.yMd().format(DateTime.now())}",
        id: docWeight.id);
    await docWeight.update(model.toJson());
  }

  static Future deleteWeight(WeightModel model) async {
    final docWeight =
    FirebaseFirestore.instance.collection("Weight").doc(model.id);

    await docWeight.delete();
  }
}
