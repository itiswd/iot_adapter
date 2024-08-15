import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:iot_adapter/core/utils/constants.dart';
import 'drawer_icon.dart';
import 'main_card.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    super.key,
  });

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool val = true;
  String volt = '0';
  String current = '0.0';
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref().child('ESP');

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff4d6c92),
            Color(0xff1d1a30),
            Color(0xff1d1a30),
            Color(0xff1d1a30),
            Color(0xff4d6c92),
          ],
          tileMode: TileMode.clamp,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 8,
            child: const MainAppBar(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.2,
            child: StreamBuilder(
              stream: _databaseReference.onValue,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData &&
                    !snapshot.hasError &&
                    snapshot.data!.snapshot.value != null) {
                  Map<dynamic, dynamic> data = snapshot.data!.snapshot.value;
                  return ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return MainCard(
                        name: staticData['name'][index],
                        value: data[staticData['value'][index]],
                        signal: staticData['signal'][index],
                        image: staticData['image'][index],
                        rout: staticData['route'][index],
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
