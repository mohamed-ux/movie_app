import 'package:flutter/material.dart';
import 'package:movie_app/apis/api_manger.dart';
import 'package:movie_app/core/componants/search_widget.dart';

import '../../core/componants/recomened_movie_card.dart';
import '../../core/style/my_theme.dart';
import '../../data/model/movies/MoviesResponse.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});
List<Results>? results;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  actionsIconTheme: IconThemeData(size: 30,color: Colors.grey),
  backgroundColor: MyThemeData.oBlack,
  actions: [
    IconButton(onPressed: (){
      showSearch(context: context, delegate: SearchWidget());
    },
        icon: Icon(Icons.search))
  ],
  title: Text('Search',style: TextStyle(color: Colors.grey),),
),
      body: Center(
        child: Image.asset('assets/images/no_movies.png'),
      ),
    );
  }
}
