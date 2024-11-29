import 'package:assignment/features/search/bloc/search_movie_bloc.dart';
import 'package:assignment/screen/details.dart';
import 'package:assignment/widget/moviecard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  final SearchMovieBloc searchMovieBloc = SearchMovieBloc();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(systemNavigationBarColor: Colors.black),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Search Movies",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black,
            elevation: 0,
          ),
          body: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.black),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.height * 0.02,
                  ),
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          onFieldSubmitted: (value) {
                            if (_formKey.currentState!.validate()) {
                              searchMovieBloc.add(
                                SearchMoviesEvent(movieName: _controller.text),
                              );
                            }
                          },
                          controller: _controller,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Enter movie name',
                            hintStyle: const TextStyle(color: Colors.white70),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            prefixIcon:
                                const Icon(Icons.search, color: Colors.white),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please search for a movie";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: BlocConsumer<SearchMovieBloc, SearchMovieState>(
                  bloc: searchMovieBloc,
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is SearchMovieLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is SearchMovieSuccessState) {
                      final movieList = state.successList;
                      return GridView.builder(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.04,
                          vertical: size.height * 0.02,
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: size.width > 600 ? 4 : 2,
                            crossAxisSpacing: size.width * 0.03,
                            mainAxisSpacing: size.height * 0.02,
                            childAspectRatio: size.width > 600 ? 0.8 : 0.7,
                            mainAxisExtent: 340),
                        itemCount: movieList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieDetailsScreen(
                                    movie: movieList[index],
                                  ),
                                ),
                              );
                            },
                            child: MoviesCard(movie: movieList[index]),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: Text(
                          "Search your favorite movie",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
