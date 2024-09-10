import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/componants/movie_card.dart';
import 'package:movie_app/core/constance.dart';

import '../../data/model/movies/MoviesResponse.dart';

class PlayingWidget extends StatelessWidget {
  Results results;
   PlayingWidget({super.key, required this.results });

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      padding: EdgeInsets.all(8),
      width: double.infinity,
      child: Stack(alignment: Alignment.bottomLeft, children: [
        Column(
          children: [
            Container(
              //color: Colors.red,
              child: CachedNetworkImage(
                imageUrl: Constance.baseUrl+results.backdropPath!,
                width: double.infinity,
                height: 180,
                fit: BoxFit.fill,
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Container(
              height: 50,
              //color: Colors.yellow,
            )
          ],
        ),
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 20,
              ),
              MovieCard(image: Constance.baseUrl+results.posterPath!,),
              Container(
                height: 200,
                width: 200,
                //color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      results.title!,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      results.releaseDate!,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
