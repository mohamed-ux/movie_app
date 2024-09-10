import '../../model/movies/MoviesResponse.dart';

abstract class PopularRepositoryContract{
  Future<MoviesResponse?> getPopularMovies();
}