import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/model/movies/MoviesResponse.dart';

import '../constance.dart';

class SearchCard extends StatelessWidget {
  Results result;
   SearchCard({super.key,required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Row(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Card(
                elevation: 10,
                clipBehavior: Clip.antiAlias,
                child: Container(
                  height: 190,
                  width: 139,
                  child: CachedNetworkImage(
                    progressIndicatorBuilder:
                        (context, url, progress) => Center(
                      child: CircularProgressIndicator(
                        value: progress.progress,
                      ),
                    ),
                    imageUrl:
                    Constance.baseUrl+'${result.posterPath??''}',
                    fit: BoxFit.fill,
                    width: 110,
                    height: 130,
                    // placeholder: (context, url) =>
                    // const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        Image.network(
                          'https://th.bing.com/th/id/OIP.YYgJscCJOLEEKRvDIslsOgAAAA?pid=ImgDet&rs=1',
                          fit: BoxFit.cover,
                        ),
                  ),
                ),
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
          Container(
            padding: EdgeInsets.all(8),
            //color: Colors.red,
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text( result.title??'',overflow: TextOverflow.ellipsis,
                  maxLines: 5,style: TextStyle(
                      color: Colors.white,fontWeight: FontWeight.w400,fontSize: 15
                  ),),
                SizedBox(height: 10,),
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
                      '${result.voteAverage}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
