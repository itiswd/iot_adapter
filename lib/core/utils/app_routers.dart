import 'package:go_router/go_router.dart';
import 'package:iot_adapter/view/current/current_view.dart';
import 'package:iot_adapter/view/home/home_view.dart';
import 'package:iot_adapter/view/voltage/voltage_view.dart';

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
