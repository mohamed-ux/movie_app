import 'package:movie_app/data/data_source/popular_data_source/popular_DS.dart';
import 'package:movie_app/data/data_source/rated_data_source/rated_DS.dart';
import 'package:movie_app/data/data_source/rated_data_source/rated_DS_impl.dart';
import 'package:movie_app/data/repository/Recommend_movies/popular_repository_contract.dart';
import 'package:movie_app/data/repository/popular_movies/popular_repository_contract.dart';
import 'package:movie_app/data/repository/rated_movies/popular_repository_contract.dart';

import '../../data_source/recommend_data_source/Recommend_DS.dart';
import '../../model/movies/MoviesResponse.dart';

class RecommendRepositoryImpl implements RecommendRepositoryContract{
  RecommendRemoteDs recommendRemoteDs;
  RecommendRepositoryImpl({required this.recommendRemoteDs});

  Future<MoviesResponse?> getRecommendMovies(){
    // TODO: implement getPopularMovies
    return recommendRemoteDs.getRecommendMovies();
  }



}