import '../../model/movies/MoviesResponse.dart';

abstract class RecommendRepositoryContract{
  Future<MoviesResponse?> getRecommendMovies();
}