import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iot_adapter/core/widgets/main_float_action_button.dart';
import 'package:iot_adapter/features/current/presentation/manager/current/current_cubit.dart';
import 'package:iot_adapter/features/current/presentation/views/widgets/current_body.dart';
import 'package:iot_adapter/main.dart';

class CurrentView extends StatelessWidget {
  const CurrentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Visibility(
        visible: MediaQuery.of(context).viewInsets.bottom == 0,
        child: BlocProvider(
          create: (context) => CurrentCubit(),
          child: BlocBuilder<CurrentCubit, CurrentState>(
            builder: (context, state) {
              return MainFloatActionButton(
                image: 'assets/images/upload.png',
                onPressed: () {
                  context.read<CurrentCubit>().onSubmitted(
                        prefs.getString('oCurrent') ?? '0.0',
                        true,
                      );
                },
              );
            },
          ),
        ),
      ),
      body: const CurrentBody(),
    );
  }
}
