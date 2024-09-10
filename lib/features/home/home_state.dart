import '../../data/model/movies/MoviesResponse.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeError extends HomeState {
  String errorMessage;

  HomeError({required this.errorMessage});
}

final class HomeSuccess extends HomeState {
  List<Results> resultsList;

  HomeSuccess({required this.resultsList});
}
final class RatedLoading extends HomeState {}

final class RatedError extends HomeState {
  String errorMessage;

  RatedError({required this.errorMessage});
}

final class RatedSuccess extends HomeState {
  List<Results> resultsList;

  RatedSuccess({required this.resultsList});
}

final class RecommendError extends HomeState {
  String errorMessage;

  RecommendError({required this.errorMessage});
}

final class RecommendSuccess extends HomeState {
  List<Results> resultsList;

  RecommendSuccess({required this.resultsList});
}

