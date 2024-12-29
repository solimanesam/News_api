part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeSuccess extends HomeState {}
final class HomeFailed extends HomeState {}
final class Homeloading extends HomeState {}
final class changeNews extends HomeState {}
final class Connected extends HomeState {}
final class NotConnected extends HomeState {}

