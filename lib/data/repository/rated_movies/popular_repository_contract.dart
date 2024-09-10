import '../../model/movies/MoviesResponse.dart';

abstract class RatedRepositoryContract{
  Future<MoviesResponse?> getRatedMovies();
}