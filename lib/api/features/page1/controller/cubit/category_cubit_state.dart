part of 'category_cubit_cubit.dart';

@immutable
sealed class CategoryCubitState {}

final class CategoryCubitInitial extends CategoryCubitState {}
final class CategoryLoading extends CategoryCubitState {}
final class CategorySuccess extends CategoryCubitState {}
final class CategoryFailed extends CategoryCubitState {}
