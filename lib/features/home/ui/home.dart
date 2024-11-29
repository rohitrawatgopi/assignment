import 'package:assignment/features/home/bloc/movie_list_bloc.dart';
import 'package:assignment/screen/details.dart';
import 'package:assignment/widget/cahedImage.dart';
import 'package:assignment/widget/moviecard.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MovieListBloc movieListBloc = MovieListBloc();

  @override
  void initState() {
    super.initState();
    movieListBloc.add(GetAllMoviesListEvent());
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocConsumer<MovieListBloc, MovieListState>(
        bloc: movieListBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is MovieListLoadingState) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.blue),
            );
          } else if (state is MovieListSuccessState) {
            final successState = state as MovieListSuccessState;

            return SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: successState.movies.isEmpty
                    ? Center(
                        child: Text(
                          "No result found !",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                    "https://static.vecteezy.com/system/resources/previews/017/396/814/original/netflix-mobile-application-logo-free-png.png",
                                height: screenHeight * 0.05,
                                width: screenWidth * 0.1,
                              ),
                              Icon(Icons.download,
                                  color: Colors.white,
                                  size: screenWidth * 0.07),
                            ],
                          ),
                          Gap(screenHeight * 0.01),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              side: BorderSide(color: Colors.white, width: 1),
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.06,
                                vertical: screenHeight * 0.01,
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              "Movies",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Container(
                            height: screenHeight * 0.5,
                            width: screenWidth,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white, width: 0.2),
                            ),
                            child: StyledCachedNetworkImage(
                              imageUrl:
                                  successState.movies[0].show?.image ?? '',
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          const Text(
                            "Your Next Watch",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          SizedBox(
                            height: screenHeight * 0.35,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: successState.movies.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MovieDetailsScreen(
                                          movie: successState.movies[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(screenWidth * 0.02),
                                    child: MoviesCard(
                                      movie: successState.movies[index],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
              ),
            );
          } else {
            return const Center(
              child: Text(
                "An error occurred.",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
        },
      ),
    );
  }
}
