import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class StyledCachedNetworkImage extends StatelessWidget {
  final String imageUrl;

  const StyledCachedNetworkImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => Icon(
          Icons.error,
          color: Colors.red,
        ),
        fit: BoxFit.fill,
      ),
    );
  }
}
