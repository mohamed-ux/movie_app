import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/componants/Plaing_widget.dart';
import 'package:movie_app/core/componants/movie_card.dart';
import 'package:movie_app/core/componants/movie_details_details.dart';
import 'package:movie_app/core/constance.dart';
import 'package:movie_app/features/home/home_cubit.dart';

import '../../features/home/home_state.dart';

class RatedWidget extends StatefulWidget {
  const RatedWidget({super.key});

  @override
  State<RatedWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<RatedWidget> {
  HomeCubit viewModel = HomeCubit();

  @override
  void initState() {
    // TODO: implement initState
    viewModel.getRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is HomeLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is RatedError) {
            return Text('Something Went Wrong!');
          } else if (state is RatedSuccess) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.resultsList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, MovieDetailsWidget.routeName,
                          arguments: state.resultsList[index]);
                    },
                    child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        child: MovieCard(
                          image: Constance.baseUrl +
                              state.resultsList[index].posterPath!,
                        )),
                  );
                });
          }
          return Container();
        });
  }
}
