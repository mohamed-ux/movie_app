import '../../model/movies/MoviesResponse.dart';

abstract class RatedRemoteDs{
  Future<MoviesResponse?> getRatedMovies();
}
abstract class RatedLocalDs{}