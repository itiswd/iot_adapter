import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iot_adapter/main.dart';
part 'current_state.dart';

class CurrentCubit extends Cubit<CurrentState> {
  CurrentCubit() : super(CurrentInitial());
  TextEditingController oCController = TextEditingController();
  String currentVal = '0.0';
  Future<void> getCurrent() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("ESP/oCurrent");
    DataSnapshot snapshot = await ref.get();
    String currentValue = snapshot.value.toString();
    currentVal = currentValue;
    emit(state);
  }

  Future<void> onSubmitted(String value, bool submit) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("ESP");
    double parsedValue = double.tryParse(value) ?? 0.0;
    String updatedValue;
    if (parsedValue < 0) {
      updatedValue = '0.0';
    } else if (parsedValue > 30) {
      updatedValue = '30.0';
    } else {
      updatedValue = parsedValue.toStringAsFixed(1);
    }
    oCController.text = updatedValue;
    prefs.setString('oCurrent', updatedValue);
    submit
        ? await ref.update(
            {"oCurrent": updatedValue},
          )
        : null;
  }
}
