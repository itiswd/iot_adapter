import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iot_adapter/main.dart';

part 'voltage_state.dart';

class VoltageCubit extends Cubit<VoltageState> {
  VoltageCubit() : super(VoltageInitial());
  TextEditingController oVController = TextEditingController();
  TextEditingController uVController = TextEditingController();
  String oVoltVal = '0.0';
  String uVoltVal = '0.0';

  Future<void> getVoltage() async {
    DatabaseReference oVoltRef = FirebaseDatabase.instance.ref("ESP/oVolt");
    DatabaseReference uVoltRef = FirebaseDatabase.instance.ref("ESP/uVolt");
    DataSnapshot oVsnapshot = await oVoltRef.get();
    DataSnapshot uVsnapshot = await uVoltRef.get();
    String oVotlValue = oVsnapshot.value.toString();
    String uVoltValue = uVsnapshot.value.toString();
    oVoltVal = oVotlValue;
    uVoltVal = uVoltValue;
    emit(state);
  }

  Future<void> onSubmittedOver(String value, bool submit) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("ESP");
    double parsedValue = double.tryParse(value) ?? 0.0;
    String updatedValue;
    if (parsedValue < 200) {
      updatedValue = '200';
    } else if (parsedValue > 280) {
      updatedValue = '280';
    } else {
      updatedValue = parsedValue.toStringAsFixed(0);
    }
    oVController.text = updatedValue;
    prefs.setString('oVolt', updatedValue);
    submit
        ? await ref.update(
            {"oVolt": updatedValue},
          )
        : null;
  }

  Future<void> onSubmittedUnder(String value, bool submit) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("ESP");
    double parsedValue = double.tryParse(value) ?? 0.0;
    String updatedValue;
    if (parsedValue < 170) {
      updatedValue = '170';
    } else if (parsedValue > 200) {
      updatedValue = '200';
    } else {
      updatedValue = parsedValue.toStringAsFixed(0);
    }
    uVController.text = updatedValue;
    prefs.setString('uVolt', updatedValue);
    submit
        ? await ref.update(
            {"uVolt": updatedValue},
          )
        : null;
  }
}
