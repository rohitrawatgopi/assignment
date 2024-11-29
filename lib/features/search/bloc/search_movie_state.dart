part of 'search_movie_bloc.dart';

@immutable
abstract class SearchMovieState {}

class SearchMovieInitial extends SearchMovieState {}

class SearchMovieLoadingState extends SearchMovieState {}

class SearchMovieSuccessState extends SearchMovieState {
  final List<MovieModel> successList;

  SearchMovieSuccessState({required this.successList});
}
