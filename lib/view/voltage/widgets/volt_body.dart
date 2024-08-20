import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iot_adapter/controller/voltage/voltage_cubit.dart';
import 'package:iot_adapter/core/utils/styles.dart';
import 'package:iot_adapter/core/widgets/main_textfield_card.dart';

class VoltageBody extends StatefulWidget {
  const VoltageBody({super.key});

  @override
  State<VoltageBody> createState() => _VoltageBodyState();
}

class _VoltageBodyState extends State<VoltageBody> {
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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            const Text(
              'Home Over/Under Voltage',
              style: Styles.mainTitle,
            ),
            const Spacer(flex: 5),
            BlocProvider(
              create: (context) => VoltageCubit()..getVoltage(),
              child: BlocBuilder<VoltageCubit, VoltageState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      MainTextFieldCard(
                        controller: context.read<VoltageCubit>().uVController,
                        text: 'Under Voltage',
                        hint: context.read<VoltageCubit>().uVoltVal,
                        onSubmitted: (value) {
                          context
                              .read<VoltageCubit>()
                              .onSubmittedUnder(value, false);
                        },
                      ),
                      MainTextFieldCard(
                        controller: context.read<VoltageCubit>().oVController,
                        text: 'Over Voltage',
                        hint: context.read<VoltageCubit>().oVoltVal,
                        onSubmitted: (value) {
                          context
                              .read<VoltageCubit>()
                              .onSubmittedOver(value, false);
                        },
                      )
                    ],
                  );
                },
              ),
            ),
            const Spacer(flex: 7),
          ],
        ),
      ),
    );
  }
}
