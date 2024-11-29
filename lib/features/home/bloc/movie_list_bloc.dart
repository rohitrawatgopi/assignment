import 'dart:async';

import 'package:assignment/model/movies.dart';
import 'package:assignment/repo/movie..dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  MovieListBloc() : super(MovieListInitial()) {
    on<MovieListEvent>((event, emit) {});
    on<GetAllMoviesListEvent>(getAllMoviesList);
  }

  FutureOr<void> getAllMoviesList(
      GetAllMoviesListEvent event, Emitter<MovieListState> emit) async {
    emit(MovieListLoadingState());
    try {
      final List<MovieModel> getData = await MoviesRepo.fetchMovies();
      emit(MovieListSuccessState(movies: getData));
    } catch (e) {
      emit(MovieListErrorState(errorMessage: e.toString()));
    }
  }
}
