import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:unsplash_gallery/repositories/unsplash_gallery_repository.dart';
import 'package:unsplash_gallery/unsplash_gallery_app.dart';

void main() {
  GetIt.I.registerLazySingleton<UnsplashGalleryRepository>(
    () => UnsplashGalleryRepository(dio: Dio()),
  );
  runApp(const UnsplashGallery());
}
