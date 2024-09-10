import 'package:movie_app/data/data_source/popular_data_source/popular_DS.dart';
import 'package:movie_app/data/repository/popular_movies/popular_repository_contract.dart';

import '../../model/movies/MoviesResponse.dart';

class PopularRepositoryImpl implements PopularRepositoryContract{
  PopularRemoteDs popularDs;
  PopularRepositoryImpl({required this.popularDs});

  Future<MoviesResponse?> getPopularMovies(){
    // TODO: implement getPopularMovies
    return popularDs.getPopularMovies();
  }

}