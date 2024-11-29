import 'package:assignment/model/movies.dart';
import 'package:assignment/widget/cahedImage.dart';
import 'package:assignment/widget/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:readmore/readmore.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MovieModel movie;

  const MovieDetailsScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final show = movie.show;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Movie Details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 300,
                child: StyledCachedNetworkImage(
                  imageUrl: show?.image ?? '',
                ),
              ),
              Column(
                children: [
                  const Gap(16),
                  Text(
                    show?.name.toUpperCase() ?? 'Unknown',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(16),
                  AppPrimaryButton(
                    buttonName: "Play",
                    callback: () {},
                    icon: Icons.play_arrow,
                  ),
                  const Gap(10),
                  AppPrimaryButton(
                    buttonName: "Download",
                    callback: () {},
                    icon: Icons.download,
                    backGradundColor: Colors.grey,
                  ),
                  const Gap(16),
                  ReadMoreText(
                    show?.summary
                            .replaceAll('<p>', '')
                            .replaceAll('</p>', '')
                            .replaceAll("<b>", "")
                            .replaceAll("</b>", "") ??
                        'No summary available',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    trimMode: TrimMode.Line,
                    trimLines: size.width < 600 ? 2 : 3,
                    colorClickableText: Colors.pink,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
