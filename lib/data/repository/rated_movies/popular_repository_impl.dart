import 'package:movie_app/data/data_source/popular_data_source/popular_DS.dart';
import 'package:movie_app/data/data_source/rated_data_source/rated_DS.dart';
import 'package:movie_app/data/data_source/rated_data_source/rated_DS_impl.dart';
import 'package:movie_app/data/repository/popular_movies/popular_repository_contract.dart';
import 'package:movie_app/data/repository/rated_movies/popular_repository_contract.dart';

import '../../model/movies/MoviesResponse.dart';

class RatedRepositoryImpl implements RatedRepositoryContract{
  RatedRemoteDs ratedRemoteDs;
  RatedRepositoryImpl({required this.ratedRemoteDs});

  Future<MoviesResponse?> getRatedMovies(){
    // TODO: implement getPopularMovies
    return ratedRemoteDs.getRatedMovies();
  }



}