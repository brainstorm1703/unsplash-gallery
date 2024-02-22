import 'package:flutter/material.dart';
import 'package:unsplash_gallery/routes/router.dart';
import 'package:unsplash_gallery/theme/theme.dart';

class UnsplashGallery extends StatelessWidget {
  const UnsplashGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unsplash Gallery',
      theme: theme,
      routes: routes,
    );
  }
}
