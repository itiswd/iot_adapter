part of 'current_cubit.dart';

@immutable
sealed class CurrentState {}

final class CurrentInitial extends CurrentState {}

final class CurrentLoading extends CurrentState {}

final class CurrentSuccess extends CurrentState {}

final class CurrentFailure extends CurrentState {}
