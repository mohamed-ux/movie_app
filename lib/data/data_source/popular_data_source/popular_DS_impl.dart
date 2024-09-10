import 'package:movie_app/apis/api_manger.dart';
import 'package:movie_app/data/data_source/popular_data_source/popular_DS.dart';

import '../../model/movies/MoviesResponse.dart';

class PopularRemoteDsImpl implements PopularRemoteDs{
  ApiManger apiManger;
  PopularRemoteDsImpl({required this.apiManger});
  @override
  Future<MoviesResponse?> getPopularMovies()async{
    var response = await apiManger.getPopularMovies();
    return response;
  }
}