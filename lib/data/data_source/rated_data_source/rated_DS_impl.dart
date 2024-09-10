import 'package:movie_app/apis/api_manger.dart';
import 'package:movie_app/data/data_source/popular_data_source/popular_DS.dart';
import 'package:movie_app/data/data_source/rated_data_source/rated_DS.dart';

import '../../model/movies/MoviesResponse.dart';

class RatedDsImpl implements RatedRemoteDs{
  ApiManger apiManger;
  RatedDsImpl({required this.apiManger});
  @override
  Future<MoviesResponse?> getRatedMovies()async{
    var response = await apiManger.getRatedMovies();
    return response;
  }
}