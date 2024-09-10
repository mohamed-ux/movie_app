import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/componants/movie_card.dart';
import 'package:movie_app/core/componants/rated_widget.dart';
import 'package:movie_app/core/componants/recomened_movie_card.dart';
import 'package:movie_app/core/componants/slider_widget.dart';
import 'package:movie_app/core/style/my_theme.dart';

import '../../core/componants/Recommend_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              height: 350,
              child: SliderWidget()),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.all(8),
            color: MyThemeData.oBlack,
            height: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New Releases ',style: TextStyle(
                  color: Colors.white,fontWeight: FontWeight.w400,fontSize: 20
                ),
                ),
                //SizedBox(height: 10,),
                Expanded(
                  child: RatedWidget(),
                )
              ],
            ),
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
                  'Recommended ',style: TextStyle(
                    color: Colors.white,fontWeight: FontWeight.w400,fontSize: 20
                ),
                ),
                //SizedBox(height: 10,),
                Expanded(
                  child: RecommendWidget(),
                )
              ],
            ),
          ),
          SizedBox(height: 30,)
        ],
      ),
    );
  }
}
