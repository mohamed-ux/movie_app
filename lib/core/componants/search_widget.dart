import 'package:flutter/material.dart';
import 'package:movie_app/apis/api_manger.dart';
import 'package:movie_app/core/componants/search_card.dart';

import 'movie_details_details.dart';

class SearchWidget extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        showResults(context);
      },
          icon: Icon(Icons.search)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
   return IconButton(onPressed: (){
     Navigator.pop(context);
   },
       icon: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
   return FutureBuilder(
       future: ApiManger.getSearchMovies(query),
       builder: (context,snapshot){
         if(snapshot.connectionState == ConnectionState.waiting){
           return Center(child: CircularProgressIndicator(),);
         }else if(snapshot.hasError){
           return Center(child: Text('something went wrong',style: TextStyle(color: Colors.white),),);
         }else{
           print('==================${snapshot.data?.totalResults}');
           return ListView.builder(
               shrinkWrap: true,
               scrollDirection: Axis.vertical,
               padding: const EdgeInsets.symmetric(horizontal: 16.0),
               itemBuilder: (context,index){
                 return InkWell(
                     onTap: () {
                       Navigator.pushNamed(context, MovieDetailsWidget.routeName,
                           arguments: snapshot.data!.results![index]);
                     },
                     child: SearchCard(result: snapshot.data!.results![index]));
               },
               itemCount: snapshot.data!.results!.length);
         }
       });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Container();
  }

}