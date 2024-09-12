import 'dart:convert';

import 'package:http/http.dart' as http;

import '../data/model/movies/MoviesResponse.dart';

class ApiManger{


   Future<MoviesResponse?> getPopularMovies()async{
    Uri url = Uri.https('api.themoviedb.org','/3/movie/popular',{
      'api_key':'169bbffc81fcc975d2f4d11f269b40b7'
    });
    var response = await http.get(url);
    var jsonFormat = jsonDecode(response.body);
    return MoviesResponse.fromJson(jsonFormat);
  }

   Future<MoviesResponse?> getRatedMovies()async{
     Uri url = Uri.https('api.themoviedb.org','/3/movie/upcoming',{
       'api_key':'169bbffc81fcc975d2f4d11f269b40b7'
     });
     var response = await http.get(url);
     var jsonFormat = jsonDecode(response.body);
     return MoviesResponse.fromJson(jsonFormat);
   }

   Future<MoviesResponse?> getRecommendMovies()async{
     Uri url = Uri.https('api.themoviedb.org','/3/movie/top_rated',{
       'api_key':'169bbffc81fcc975d2f4d11f269b40b7'
     });
     var response = await http.get(url);
     var jsonFormat = jsonDecode(response.body);
     return MoviesResponse.fromJson(jsonFormat);
   }

   static Future<MoviesResponse?> getSimilarMovies(int movie_id)async{
     //https://api.themoviedb.org/3/movie/{movie_id}/similar
     Uri url = Uri.https('api.themoviedb.org','/3/movie/${movie_id}/similar',{
       'api_key':'169bbffc81fcc975d2f4d11f269b40b7'
     });
     var response = await http.get(url);
     var jsonFormat = jsonDecode(response.body);
     return MoviesResponse.fromJson(jsonFormat);
   }

   static Future<MoviesResponse?> getSearchMovies(String query)async{
     //https://api.themoviedb.org/3/movie/{movie_id}/similar
     Uri url = Uri.https('api.themoviedb.org','/3/search/movie',{
       'api_key':'169bbffc81fcc975d2f4d11f269b40b7',
       'query':query
     });
     var response = await http.get(url);
     var jsonFormat = jsonDecode(response.body);
     return MoviesResponse.fromJson(jsonFormat);
   }

}