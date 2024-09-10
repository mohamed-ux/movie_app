import 'package:movie_app/apis/api_manger.dart';
import 'package:movie_app/data/data_source/popular_data_source/popular_DS.dart';
import 'package:movie_app/data/data_source/rated_data_source/rated_DS.dart';
import 'package:movie_app/data/data_source/recommend_data_source/Recommend_DS.dart';

import '../../model/movies/MoviesResponse.dart';

class RecommendDsImpl implements RecommendRemoteDs{
  ApiManger apiManger;
  RecommendDsImpl({required this.apiManger});
  @override
  Future<MoviesResponse?> getRecommendMovies()async{
    var response = await apiManger.getRecommendMovies();
    return response;
  }
}