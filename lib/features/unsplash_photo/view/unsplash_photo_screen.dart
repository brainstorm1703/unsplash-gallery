import 'package:flutter/material.dart';
import 'package:unsplash_gallery/repositories/models/unsplash_gallery.dart';

class UnsplashPhotoScreen extends StatefulWidget {
  const UnsplashPhotoScreen({super.key});

  @override
  State<UnsplashPhotoScreen> createState() => _UnsplashPhotoScreenState();
}

class _UnsplashPhotoScreenState extends State<UnsplashPhotoScreen> {
  late UnsplashGallery photo;
  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is UnsplashGallery,
        'You must provide String args');
    photo = args as UnsplashGallery;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(photo.description),
        centerTitle: true,
      ),
      body: ListView(
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
