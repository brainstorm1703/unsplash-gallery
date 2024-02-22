import 'package:flutter/material.dart';
import 'package:unsplash_gallery/repositories/models/unsplash_gallery.dart';

class PhotoTitle extends StatelessWidget {
  const PhotoTitle({
    super.key,
    required this.photo,
  });

  final UnsplashGallery photo;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          '/photo',
          arguments: photo,
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(photo.imageUrl),
          ListTile(
            title: Text(
              'description: ${photo.description}',
              style: theme.textTheme.labelSmall,
            ),
            subtitle: Text(
              'author: ${photo.author}',
              style: theme.textTheme.labelSmall,
            ),
          ),
        ],
      ),
    );
  }
}
