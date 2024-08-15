import 'package:go_router/go_router.dart';
import 'package:iot_adapter/features/current/presentation/views/current_view.dart';
import 'package:iot_adapter/features/home/presentation/views/home_view.dart';
import 'package:iot_adapter/features/voltage/presentation/views/voltage_view.dart';

abstract class AppRouters {
  static const kVolt = '/volt';
  static const kCurrent = '/current';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kVolt,
        builder: (context, state) => const VoltageView(),
      ),
      GoRoute(
        path: kCurrent,
        builder: (context, state) => const CurrentView(),
      ),
    ],
  );
}
