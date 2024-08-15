part of 'voltage_cubit.dart';

@immutable
sealed class VoltageState {}

final class VoltageInitial extends VoltageState {}

final class VoltageLoading extends VoltageState {}

final class VoltageSuccess extends VoltageState {}

final class VoltageFailure extends VoltageState {}
