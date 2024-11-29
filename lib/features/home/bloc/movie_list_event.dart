part of 'movie_list_bloc.dart';

@immutable
abstract class MovieListEvent {}

class GetAllMoviesListEvent extends MovieListEvent {}
