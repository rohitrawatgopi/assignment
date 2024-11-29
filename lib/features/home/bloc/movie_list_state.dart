part of 'movie_list_bloc.dart';

@immutable
abstract class MovieListState {}

class MovieListInitial extends MovieListState {}

class MovieListLoadingState extends MovieListState {}

class MovieListSuccessState extends MovieListState {
  final List<MovieModel> movies;
  MovieListSuccessState({required this.movies});
}

class MovieListErrorState extends MovieListState {
  String errorMessage;
  MovieListErrorState({
    required this.errorMessage,
  });
}
