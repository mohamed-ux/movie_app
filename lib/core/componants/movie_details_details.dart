import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/apis/api_manger.dart';
import 'package:movie_app/core/componants/recomened_movie_card.dart';
import 'package:movie_app/core/constance.dart';
import 'package:movie_app/core/style/my_theme.dart';
import 'package:movie_app/data/model/movies/MoviesResponse.dart';

class MovieDetailsWidget extends StatelessWidget {
  static const String routeName = 'details';

  const MovieDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var result = ModalRoute.of(context)?.settings.arguments as Results;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: MyThemeData.oBlack,
        title: Text(
          result.title!,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 250,
                child: CachedNetworkImage(
                  progressIndicatorBuilder:
                      (context, url, progress) => Center(
                    child: CircularProgressIndicator(
                      value: progress.progress,
                    ),
                  ),
                  imageUrl:
                  Constance.baseUrl+result.backdropPath!,
                  fit: BoxFit.cover,
                  // placeholder: (context, url) =>
                  // const CircularProgressIndicator(),
                  errorWidget: (context, url, error) =>
                      Image.network(
                        'https://th.bing.com/th/id/OIP.YYgJscCJOLEEKRvDIslsOgAAAA?pid=ImgDet&rs=1',
                        fit: BoxFit.cover,
                      ),
                ),
              ),
              SizedBox(height: 10,),
              Text(
                result.title!,
                style: TextStyle(
                    color: Colors.white, fontSize: 25, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 5,),
          
              Text(
                result.releaseDate!,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 10,),
          
              Row(
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
                                Constance.baseUrl+result.posterPath!,
                            fit: BoxFit.fill,
                            width: 110,
                            height: 160,
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
                        Text( result.overview!,overflow: TextOverflow.ellipsis,
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
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(8),
                color: MyThemeData.oBlack,
                height: 380,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Similar ',style: TextStyle(
                        color: Colors.white,fontWeight: FontWeight.w400,fontSize: 20
                    ),
                    ),
                    //SizedBox(height: 10,),
                    Expanded(
                      child: FutureBuilder(
                        future: ApiManger.getSimilarMovies(result.id!),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }
                          if (snapshot.hasError) {
                            return Center(child: Text("Something went wrong"));
                          }
                          var movies = snapshot.data!.results;

                          return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            itemCount: movies!.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: (){
                                    Navigator.pushNamed(context, MovieDetailsWidget.routeName,
                                        arguments: movies[index]);
                                  },
                                  child: RecommendedMovieCard(results: movies[index],));
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}
