import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:iot_adapter/core/widgets/main_float_action_button.dart';
import 'package:iot_adapter/features/home/presentation/views/widgets/main_drawer.dart';
import 'widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    DatabaseReference ref = FirebaseDatabase.instance.ref("ESP/switch");
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MainFloatActionButton(
        image: 'assets/images/power.png',
        onPressed: () async {
          // Get the current value of the switch
          DataSnapshot snapshot = await ref.get();
          bool currentValue = snapshot.value as bool;

          // Toggle the switch value
          bool newValue = !currentValue;

          // Update the switch value in the database
          await ref.set(newValue);
        },
      ),
      drawer: const MainDrawer(),
      body: const HomeBody(),
    );
  }
}
