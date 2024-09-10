import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/componants/Plaing_widget.dart';
import 'package:movie_app/core/componants/movie_card.dart';
import 'package:movie_app/core/componants/movie_details_details.dart';
import 'package:movie_app/features/home/home_cubit.dart';

import '../../features/home/home_state.dart';

class SliderWidget extends StatefulWidget {

  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  HomeCubit viewModel = HomeCubit();
  @override
  void initState() {
    // TODO: implement initState
    viewModel.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(
      bloc: viewModel,
        builder: (context,state){
          if(state is HomeLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(state is HomeError){
            return Text('Something Went Wrong!');
          }else if(state is HomeSuccess){
            return CarouselSlider.builder(
                itemCount: 15,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, MovieDetailsWidget.routeName,
                              arguments: state.resultsList[itemIndex]);
                        },
                        child: PlayingWidget(results: state.resultsList[itemIndex])),
                options: CarouselOptions(
                  height: 300,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 4),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ));
          }
          return Container();
        });
  }
}
