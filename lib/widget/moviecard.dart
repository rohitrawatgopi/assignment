import 'package:assignment/model/movies.dart';
import 'package:assignment/widget/cahedImage.dart';
import 'package:flutter/material.dart';

class MoviesCard extends StatelessWidget {
  final MovieModel movie;
  const MoviesCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.3;

    return Container(
      width: cardWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StyledCachedNetworkImage(imageUrl: movie.show?.image ?? ''),
          SizedBox(height: cardWidth * 0.08),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: cardWidth * 0.07),
            child: Text(
              movie.show?.name ?? 'Unknown',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: cardWidth * 0.13,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: cardWidth * 0.04),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: cardWidth * 0.07),
            child: Text(
              movie.show?.summary
                      .replaceAll('<p>', '')
                      .replaceAll('</p>', '')
                      .replaceAll("<b>", "")
                      .replaceAll("</b>", "") ??
                  'No summary available',
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: cardWidth * 0.11,
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
