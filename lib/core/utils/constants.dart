import 'package:iot_adapter/core/utils/app_routers.dart';

Map staticData = {
  'name': [
    'Voltage',
    'Current',
    'Power',
  ],
  'route': [
    AppRouters.kVolt,
    AppRouters.kCurrent,
    '',
  ],
  'value': [
    'volt',
    'current',
    'power',
  ],
  'signal': [
    'V',
    'A',
    'KWH',
  ],
  'image': [
    'assets/images/voltage.png',
    'assets/images/current.png',
    'assets/images/protect.png',
  ],
};
