part of 'search_movie_bloc.dart';

@immutable
abstract class SearchMovieEvent {}

class SearchMoviesEvent extends SearchMovieEvent {
  final String movieName;

  SearchMoviesEvent({required this.movieName});
}
