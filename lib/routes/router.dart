import 'package:unsplash_gallery/features/unsplash_gallery/view/unsplash_gallery_screen.dart';
import 'package:unsplash_gallery/features/unsplash_photo/view/unsplash_photo_screen.dart';

final routes = {
  '/': (context) => const UnsplashGalleryScreen(),
  '/photo': (context) => const UnsplashPhotoScreen(),
};
