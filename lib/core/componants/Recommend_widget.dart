import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/componants/Plaing_widget.dart';
import 'package:movie_app/core/componants/movie_card.dart';
import 'package:movie_app/core/componants/movie_details_details.dart';
import 'package:movie_app/core/componants/recomened_movie_card.dart';
import 'package:movie_app/core/constance.dart';
import 'package:movie_app/features/home/home_cubit.dart';

import '../../features/home/home_state.dart';

class RecommendWidget extends StatefulWidget {

  const RecommendWidget({super.key});

  @override
  State<RecommendWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<RecommendWidget> {
  HomeCubit viewModel = HomeCubit();
  @override
  void initState() {
    // TODO: implement initState
    viewModel.getRecommendMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(
        bloc: viewModel,
        builder: (context,state){
          if(state is HomeLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(state is RecommendError){
            return Text('Something Went Wrong!');
          }else if(state is RecommendSuccess){
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context,index){
                  return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                      child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, MovieDetailsWidget.routeName,
                                arguments: state.resultsList[index]);
                          },
                          child: RecommendedMovieCard(results: state.resultsList[index])));
                });
          }
          return Container();
        });
  }
}
