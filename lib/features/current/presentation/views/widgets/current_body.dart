import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iot_adapter/core/widgets/main_textfield_card.dart';
import 'package:iot_adapter/features/current/presentation/manager/current/current_cubit.dart';

class CurrentBody extends StatefulWidget {
  const CurrentBody({super.key});

  @override
  State<CurrentBody> createState() => _CurrentBodyState();
}

class _CurrentBodyState extends State<CurrentBody> {
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
              'Home Over Current',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),
            const Spacer(flex: 5),
            BlocProvider(
              create: (context) => CurrentCubit()..getCurrent(),
              child: BlocBuilder<CurrentCubit, CurrentState>(
                builder: (context, state) {
                  return MainTextFieldCard(
                    controller: context.read<CurrentCubit>().oCController,
                    text: 'Over Current',
                    hint: context.read<CurrentCubit>().currentVal,
                    onSubmitted: (value) {
                      context.read<CurrentCubit>().onSubmitted(value, false);
                    },
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
