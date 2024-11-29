import 'dart:async';
import 'dart:developer';

import 'package:assignment/model/movies.dart';
import 'package:assignment/repo/movie..dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  SearchMovieBloc() : super(SearchMovieInitial()) {
    on<SearchMovieEvent>((event, emit) {});
    on<SearchMoviesEvent>(searchMoviesEvent);
  }

  FutureOr<void> searchMoviesEvent(
      SearchMoviesEvent event, Emitter<SearchMovieState> emit) async {
    emit(SearchMovieLoadingState());
    try {
      List<MovieModel> movieList =
          await MoviesRepo.searchMovie(event.movieName);
      emit(SearchMovieSuccessState(successList: movieList));
    } catch (e) {
      log(e.toString());
    }
  }
}
