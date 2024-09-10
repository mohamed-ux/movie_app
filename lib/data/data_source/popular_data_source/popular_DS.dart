import '../../model/movies/MoviesResponse.dart';

abstract class PopularRemoteDs{
  Future<MoviesResponse?> getPopularMovies();
}
abstract class PopularLocalDs{}