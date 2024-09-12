import 'package:flutter/material.dart';
import 'package:movie_app/core/constance.dart';
import 'package:movie_app/core/style/my_theme.dart';

import '../../data/model/movies/MoviesResponse.dart';

class RecommendedMovieCard extends StatelessWidget {
  Results results;
   RecommendedMovieCard({super.key,required this.results});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(8),
      width: 150,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 10,
        color: Colors.black38,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: results.posterPath != null?Image.network(
                    Constance.baseUrl+'${results.posterPath??''}',
                    fit: BoxFit.fill,
                    height: 180,
                    width: double.infinity,

                  ):Container(
                      height:180,
                      child: Center(child: Icon(Icons.error,color: Colors.grey,),))
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.bookmark,
                          size: 45,
                        )),
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${results.voteAverage}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Text(
                    results.title!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(

                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    results.releaseDate!,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
