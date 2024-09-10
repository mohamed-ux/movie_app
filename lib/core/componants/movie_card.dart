import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/componants/movie_details_details.dart';

class MovieCard extends StatelessWidget {
  String image;
   MovieCard({super.key,required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
              image,
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
            IconButton(onPressed: (){}, icon: Icon(Icons.bookmark,size: 45,)),
            Icon(Icons.add,color: Colors.white,size: 20,)
          ],
        )
      ],
    );
  }
}
