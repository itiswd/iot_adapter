import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iot_adapter/controller/voltage/voltage_cubit.dart';
import 'package:iot_adapter/core/widgets/main_float_action_button.dart';

import 'package:iot_adapter/main.dart';
import 'package:iot_adapter/view/voltage/widgets/volt_body.dart';

class VoltageView extends StatelessWidget {
  const VoltageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Visibility(
        visible: MediaQuery.of(context).viewInsets.bottom == 0,
        child: BlocProvider(
          create: (context) => VoltageCubit(),
          child: BlocBuilder<VoltageCubit, VoltageState>(
            builder: (context, state) {
              return MainFloatActionButton(
                image: 'assets/images/upload.png',
                onPressed: () {
                  context.read<VoltageCubit>().onSubmittedOver(
                        prefs.getString('oVolt') ?? '0',
                        true,
                      );
                  context.read<VoltageCubit>().onSubmittedUnder(
                        prefs.getString('uVolt') ?? '0',
                        true,
                      );
                  // Show a snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Center(
                        child: Text(
                          'Data submitted',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      behavior: SnackBarBehavior.floating,
                      duration: Duration(milliseconds: 1500),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
      body: const VoltageBody(),
    );
  }
}
