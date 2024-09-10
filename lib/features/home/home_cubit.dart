import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/data/data_source/rated_data_source/rated_DS.dart';
import 'package:movie_app/data/data_source/rated_data_source/rated_DS_impl.dart';
import 'package:movie_app/data/data_source/recommend_data_source/Recommend_DS.dart';
import 'package:movie_app/data/data_source/recommend_data_source/Recommend_DS_impl.dart';
import 'package:movie_app/data/repository/Recommend_movies/popular_repository_contract.dart';
import 'package:movie_app/data/repository/Recommend_movies/popular_repository_impl.dart';
import 'package:movie_app/data/repository/popular_movies/popular_repository_impl.dart';
import 'package:movie_app/data/repository/rated_movies/popular_repository_contract.dart';
import 'package:movie_app/data/repository/rated_movies/popular_repository_impl.dart';

import '../../apis/api_manger.dart';
import '../../data/data_source/popular_data_source/popular_DS.dart';
import '../../data/data_source/popular_data_source/popular_DS_impl.dart';
import '../../data/repository/popular_movies/popular_repository_contract.dart';
import 'home_state.dart';



class HomeCubit extends Cubit<HomeState> {
  late PopularRepositoryContract popularRepositoryContract;
   late RatedRepositoryContract ratedRepositoryContract;
   late RecommendRepositoryContract recommendRepositoryContract;
   //late SimilarRepositoryContract similarRepositoryContract;
  late PopularRemoteDs popularDs;
  late RatedRemoteDs ratedRemoteDs;
 // late SimilarRemoteDs similarRemoteDs;
  late RecommendRemoteDs recommendRemoteDs;
  late ApiManger apiManger;

  HomeCubit() : super(HomeInitial()) {
    apiManger = ApiManger();
    popularDs = PopularRemoteDsImpl(apiManger: apiManger);
    ratedRemoteDs=RatedDsImpl(apiManger: apiManger);
    //similarRemoteDs=SimilarDsImpl(apiManger: apiManger);
    recommendRemoteDs=RecommendDsImpl(apiManger: apiManger);
    popularRepositoryContract = PopularRepositoryImpl(popularDs: popularDs);
    ratedRepositoryContract=RatedRepositoryImpl(ratedRemoteDs: ratedRemoteDs);
    recommendRepositoryContract=RecommendRepositoryImpl(recommendRemoteDs: recommendRemoteDs);
    //similarRepositoryContract=SimilarRepositoryImpl(similarRemoteDs: similarRemoteDs);
  }

  emit(HomeLoadingme);

  void getPopularMovies() async {
    var response = await popularRepositoryContract.getPopularMovies();
    try {
      if (response!.success == false) {
        emit(HomeError(errorMessage: 'Something went Wring'));
        return;
      }
      if (response.success != false) {
        emit(HomeSuccess(resultsList: response.results!));
        return;
      }
    }
    catch(e){
      emit(HomeError(errorMessage: e.toString()));
    }
  }

  void getRatedMovies() async {
    var response = await ratedRepositoryContract.getRatedMovies();
    try {
      if (response!.success == false) {
        emit(RatedError(errorMessage: 'Something went Wring'));
        return;
      }
      if (response.success != false) {
        emit(RatedSuccess(resultsList: response.results!));
        return;
      }
    }
    catch(e){
      emit(RatedError(errorMessage: e.toString()));
    }
  }

  void getRecommendMovies() async {
    var response = await recommendRepositoryContract.getRecommendMovies();
    try {
      if (response!.success == false) {
        emit(RecommendError(errorMessage: 'Something went Wring'));
        return;
      }
      if (response.success != false) {
        emit(RecommendSuccess(resultsList: response.results!));
        return;
      }
    }
    catch(e){
      emit(RecommendError(errorMessage: e.toString()));
    }
  }



}
