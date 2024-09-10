import '../../model/movies/MoviesResponse.dart';

abstract class RecommendRemoteDs{
  Future<MoviesResponse?> getRecommendMovies();
}
abstract class RecommendLocalDs{}